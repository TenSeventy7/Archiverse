import 'package:archiverse/api.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/dialogs/chapters_list.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_read_history.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ReaderActivity extends CommonActivity {
  static const String routeName = '/work/read';

  const ReaderActivity({super.key, required this.work, this.chapter});

  final Work work;
  final Chapter? chapter;

  @override
  State<ReaderActivity> createState() => _ReaderActivityState();
}

class _ReaderActivityState extends State<ReaderActivity>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  // Constants
  static const double _iconSize = 22.0;
  static const double _dragThreshold = 0.3;
  static const double _scrollThreshold = 5.0;
  static const int _dragVelocityThreshold = 500;
  static const Duration _animationDuration = Duration(milliseconds: 300);
  static const Duration _fadeAnimationDuration = Duration(milliseconds: 200);

  // Core data
  Work get work => widget.work;
  final Ao3Api _api = Ao3Api();

  List<Chapter> _chapters = [];
  int _currentChapterIndex = 0;
  Chapter? _currentChapter;
  bool _hasRecordedInitialHistory = false;

  // State management
  bool _isLoading = true;
  String? _error;
  bool _isDisposed = false;

  // UI animation
  late AnimationController _uiAnimationController;
  late Animation<double> _uiAnimation;
  bool _isUiVisible = true;
  ReaderColor _currentColor = ReaderColor.system;

  // Drag interaction
  double _dragOpacity = 1.0;
  bool _isDragging = false;
  double _dragStartX = 0.0;

  // Scroll handling
  final ScrollController _scrollController = ScrollController();
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeAnimations();
    _setupScrollListener();
    _loadChapters();
    _setupScreenSettings();
  }

  @override
  void dispose() {
    _isDisposed = true;
    WidgetsBinding.instance.removeObserver(this);
    _saveReadHistoryBeforeDispose();
    _uiAnimationController.dispose();
    _scrollController.dispose();
    _restoreScreenSettings();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Save read history when app goes to background
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _saveReadHistoryBeforeDispose();
    }
  }

  @override
  void deactivate() {
    // Save read history when widget is being deactivated (navigation away)
    _saveReadHistoryBeforeDispose();
    super.deactivate();
  }

  // Safe method to save read history
  void _saveReadHistoryBeforeDispose() {
    if (_isDisposed || _currentChapter == null) return;

    // Also try to reset system UI state
    _resetStatusBarColor();

    try {
      final provider = Provider.of<ReadHistoryProvider>(context, listen: false);

      if (_scrollController.hasClients) {
        final scrollPosition = _scrollController.offset.toInt();
        final maxScrollExtent = _scrollController.position.maxScrollExtent
            .toInt();

        // Save asynchronously without awaiting
        provider
            .saveReadHistory(
              work: work,
              chapter: _currentChapter!,
              scrollPosition: scrollPosition,
              totalScrollPosition: maxScrollExtent,
            )
            .catchError((error) {
              debugPrint('Error saving read history: $error');
            });
      } else {
        // Save without scroll position if controller isn't attached
        provider
            .saveReadHistory(
              work: work,
              chapter: _currentChapter!,
              scrollPosition: 0,
            )
            .catchError((error) {
              debugPrint('Error saving read history: $error');
            });
      }
    } catch (e) {
      debugPrint('Error accessing provider or saving read history: $e');
    }
  }

  // Initialization methods
  void _initializeAnimations() {
    _uiAnimationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    _uiAnimation = CurvedAnimation(
      parent: _uiAnimationController,
      curve: Curves.easeInOutCubicEmphasized,
    );
    _uiAnimationController.forward();
  }

  void _setupScrollListener() {
    _scrollController.addListener(_onScroll);
  }

  void _setupScreenSettings() {
    final settings = context.read<ReaderProvider>();
    if (settings.keepScreenOn) {
      WakelockPlus.enable();
    }
  }

  void _restoreScreenSettings() {
    WakelockPlus.disable();
  }

  // Data loading methods
  Future<void> _loadChapters() async {
    try {
      _setLoadingState();

      _chapters = await _api.getChapterList(work);
      await _setInitialChapterIndex();

      await _loadCurrentChapter();
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  Future<void> _loadCurrentChapter() async {
    try {
      final chapterWithContent = await _api.getChapter(
        _chapters[_currentChapterIndex],
      );

      if (!_isDisposed) {
        setState(() {
          _currentChapter = chapterWithContent;
          _isLoading = false;
        });

        // Record initial history when first chapter loads successfully
        if (!_hasRecordedInitialHistory) {
          _recordInitialHistory();
          _hasRecordedInitialHistory = true;
        }
      }
    } catch (e) {
      if (!_isDisposed) {
        _setErrorState(e.toString());
      }
    }
  }

  void _recordInitialHistory() {
    if (_currentChapter == null) return;

    try {
      final provider = Provider.of<ReadHistoryProvider>(context, listen: false);

      // Record that user started reading this work/chapter
      provider
          .saveReadHistory(
            work: work,
            chapter: _currentChapter!,
            scrollPosition: 0,
            totalScrollPosition: 0,
          )
          .catchError((error) {
            debugPrint('Error recording initial read history: $error');
          });

      debugPrint(
        'Recorded initial read history for: ${work.title} - ${_currentChapter!.title}',
      );
    } catch (e) {
      debugPrint('Error accessing provider for initial history: $e');
    }
  }

  // State management methods
  void _setLoadingState() {
    if (!_isDisposed) {
      setState(() {
        _isLoading = true;
        _error = null;
      });
    }
  }

  void _setErrorState(String error) {
    if (!_isDisposed) {
      setState(() {
        _error = error;
        _isLoading = false;
      });
    }
  }

  Future<void> _setInitialChapterIndex() async {
    if (widget.chapter != null) {
      _currentChapterIndex = _chapters.indexWhere(
        (c) => c.id == widget.chapter!.id,
      );
      if (_currentChapterIndex == -1) _currentChapterIndex = 0;
      return;
    }

    // Get chapter from read history if available
    final readHistory = await context
        .read<ReadHistoryProvider>()
        .getReadHistory(work);
    if (readHistory != null) {
      _currentChapterIndex = _chapters.indexWhere(
        (c) => c.id == readHistory.chapter?.id,
      );
      if (_currentChapterIndex == -1) _currentChapterIndex = 0;
    }
  }

  // Navigation methods
  Future<void> _navigateToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;

    // Save current progress before switching chapters
    _saveReadHistoryBeforeDispose();

    if (!_isDisposed) {
      setState(() {
        _currentChapterIndex = index;
        _isLoading = true;
        _currentChapter = null;
      });
    }

    await _loadCurrentChapter();
  }

  void _previousChapter() {
    if (_currentChapterIndex > 0) {
      _navigateToChapter(_currentChapterIndex - 1);
    }
  }

  void _nextChapter() {
    if (_currentChapterIndex < _chapters.length - 1) {
      _navigateToChapter(_currentChapterIndex + 1);
    }
  }

  // UI interaction methods
  void _onScroll() {
    final currentOffset = _scrollController.offset;
    final scrollDelta = currentOffset - _lastScrollOffset;

    if (scrollDelta.abs() > _scrollThreshold) {
      final shouldHideUI = scrollDelta > 0;
      if (shouldHideUI && _isUiVisible) {
        _toggleUI(false);
      } else if (!shouldHideUI && !_isUiVisible) {
        _toggleUI(true);
      }
    }

    _lastScrollOffset = currentOffset;
  }

  void _toggleUI([bool? show]) {
    if (_isDisposed) return;

    final shouldShow = show ?? !_isUiVisible;

    if (shouldShow != _isUiVisible) {
      setState(() => _isUiVisible = shouldShow);

      if (shouldShow) {
        _uiAnimationController.forward();
      } else {
        _uiAnimationController.reverse();
      }
    }

    // Add this line to update status bar color immediately
    _setStatusBarColor();
  }

  void _onContentTap(TapUpDetails details) {
    _toggleUI();
  }

  // Drag handling methods
  void _onHorizontalDragStart(DragStartDetails details) {
    if (!_isDisposed) {
      setState(() {
        _isDragging = true;
        _dragStartX = details.localPosition.dx;
      });
    }
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_isDisposed) return;

    final screenWidth = MediaQuery.of(context).size.width;
    final dragDistance = (details.localPosition.dx - _dragStartX).abs();
    final dragProgress = (dragDistance / (screenWidth * _dragThreshold)).clamp(
      0.0,
      1.0,
    );
    final opacity = (1.0 - dragProgress).clamp(0.0, 1.0);

    setState(() => _dragOpacity = opacity);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _resetDragState();

    final velocity = details.primaryVelocity ?? 0;

    if (velocity > _dragVelocityThreshold) {
      _previousChapter();
    } else if (velocity < -_dragVelocityThreshold) {
      _nextChapter();
    }
  }

  void _onHorizontalDragCancel() => _resetDragState();

  void _resetDragState() {
    if (!_isDisposed) {
      setState(() {
        _isDragging = false;
        _dragOpacity = 1.0;
      });
    }
  }

  // Dialog methods
  void _showChapterList() {
    ChaptersListDialog.showSheet(
      context,
      chapters: _chapters,
      currentChapterIndex: _currentChapterIndex,
      onChapterSelected: _navigateToChapter,
    );
  }

  void _showWorkOptions() {
    WorkOptionsDialog.showSheet(context, work: work, isReader: true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        if (settings.keepScreenOn) {
          WakelockPlus.enable();
        } else {
          WakelockPlus.disable();
        }

        _currentColor = settings.readerColor;

        return Scaffold(
          appBar: _buildAnimatedAppBar(),
          backgroundColor: settings.readerColor.toBackgroundColor(context),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(settings.textScaleFactor)),
            child: _buildBody(settings),
          ),
          bottomNavigationBar: _buildAnimatedBottomNavBar(),
        );
      },
    );
  }

  PreferredSize _buildAnimatedAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AnimatedBuilder(
        animation: _uiAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -kToolbarHeight * (1 - _uiAnimation.value)),
            child: Opacity(
              opacity: _uiAnimation.value,
              child: AppBar(
                title: Text(work.title),
                centerTitle: true,
                backgroundColor: context.theme.colorScheme.surfaceContainer,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedBottomNavBar() {
    return AnimatedBuilder(
      animation: _uiAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            (kToolbarHeight + context.screenPadding.bottom) *
                (1 - _uiAnimation.value),
          ),
          child: Opacity(
            opacity: _uiAnimation.value,
            child: PreferredSize(
              preferredSize: Size(
                double.infinity,
                kToolbarHeight + context.screenPadding.bottom,
              ),
              child: _buildDockedToolbar(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(ReaderProvider settings) {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: settings.readerColor.toForegroundColor(context),
        ),
      );
    }

    if (_error != null) {
      return Center(child: LoadError(onPressed: _loadCurrentChapter));
    }

    return _buildContent();
  }

  void _resetStatusBarColor() {
    context.setNavigationBarColor(Colors.transparent);
  }

  void _setStatusBarColor() {
    if (_isUiVisible) {
      _resetStatusBarColor();
      return;
    }

    switch (_currentColor) {
      case ReaderColor.light:
      case ReaderColor.sepia:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        break;
      case ReaderColor.dark:
      case ReaderColor.gray:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        break;
      case ReaderColor.system:
        _resetStatusBarColor();
        break;
    }
  }

  Widget _buildContent() {
    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return GestureDetector(
          onTapUp: _onContentTap,
          onHorizontalDragStart: _onHorizontalDragStart,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          onHorizontalDragCancel: _onHorizontalDragCancel,
          child: AnimatedSwitcher(
            duration: _isDragging ? Duration.zero : _animationDuration,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: AnimatedOpacity(
              duration: _isDragging ? Duration.zero : _fadeAnimationDuration,
              opacity: _dragOpacity,
              child: _buildScrollContent(settings),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScrollContent(ReaderProvider settings) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(
            settings.readerColor.toForegroundColor(context).withOpacity(0.5),
          ),
          trackColor: WidgetStateProperty.all(
            settings.readerColor.toContainerColor(context).withOpacity(0.3),
          ),
        ),
      ),
      child: Stack(
        children: [
          Scrollbar(
            controller: _scrollController,
            thumbVisibility: false,
            radius: const Radius.circular(4.0),
            child: SingleChildScrollView(
              key: ValueKey(_currentChapterIndex),
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: context.commonPaddingDouble,
              ),
              child: _buildChapterContent(settings),
            ),
          ),
          // Top shadow
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: context.screenPadding.top + kToolbarHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    settings.readerColor.toBackgroundColor(context),
                    settings.readerColor
                        .toBackgroundColor(context)
                        .withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // Bottom shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: context.screenPadding.bottom + 48.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    settings.readerColor.toBackgroundColor(context),
                    settings.readerColor
                        .toBackgroundColor(context)
                        .withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterContent(ReaderProvider settings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kToolbarHeight + context.screenPadding.top + 16.0),
        _buildChapterHeader(settings),
        SizedBox(height: 24 * settings.paragraphSpacing),
        Theme(
          data: Theme.of(context).copyWith(
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: settings.readerColor.toForegroundColor(context),
              year2023: false,
            ),
          ),
          child: _buildChapterBody(settings),
        ),
        _buildChapterPostface(settings),
        SizedBox(height: kToolbarHeight + context.screenPadding.bottom + 16.0),
      ],
    );
  }

  Widget _buildChapterBody(ReaderProvider settings) {
    if (_currentChapter?.content == null) {
      return const Center(child: Text('No content available'));
    }

    final textStyle = GoogleFonts.getFont(settings.bodyFontFamily).copyWith(
      height: settings.lineHeight,
      color: settings.readerColor.toForegroundColor(context),
    );

    return HtmlWidget(
      _currentChapter!.content!,
      key: ValueKey(
        'html_${settings.justifyText ? 'justified' : 'normal'}_${settings.readerColor.toString()}',
      ),
      textStyle: textStyle.copyWith(height: settings.lineHeight),
      customStylesBuilder: (element) {
        if (settings.justifyText) {
          return {'text-align': 'justify'};
        }
        return {};
      },
    );
  }

  Widget _buildChapterPostface(ReaderProvider settings) {
    if (_currentChapter?.postface?.isNotEmpty != true) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16 * settings.paragraphSpacing),
        Opacity(
          opacity: 0.7,
          child: TextHeader.small(
            title: "Notes",
            hasPadding: false,
            color: settings.readerColor.toForegroundColor(context),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: settings.readerColor
                .toContainerColor(context)
                .withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: HtmlWidget(
            _currentChapter!.postface!,
            textStyle: GoogleFonts.getFont(
              settings.bodyFontFamily,
              textStyle: TextStyle(
                height: settings.lineHeight,
                fontFamily: settings.bodyFontFamily,
                color: settings.readerColor.toForegroundColor(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChapterHeader(ReaderProvider settings) {
    if (_currentChapter == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildChapterTitle(settings),
        const SizedBox(height: 8),
        _buildChapterInfo(settings),
        ..._buildChapterSummary(settings),
        ..._buildChapterPreface(settings),
      ],
    );
  }

  Widget _buildChapterTitle(ReaderProvider settings) {
    return Text(
      _currentChapter!.title.isNotEmpty
          ? _currentChapter!.title
          : 'Chapter ${_currentChapter!.chapter}',
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        settings.headingFontFamily,
        textStyle: context.theme.textTheme.titleLarge?.copyWith(
          color: settings.readerColor.toForegroundColor(context),
          fontWeight: FontWeight.bold,
          fontFamily: settings.headingFontFamily,
        ),
      ),
    );
  }

  Widget _buildChapterInfo(ReaderProvider settings) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_currentChapterIndex + 1} of ${_chapters.length}',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            settings.bodyFontFamily,
            textStyle: context.theme.textTheme.titleSmall?.copyWith(
              color: settings.readerColor
                  .toForegroundColor(context)
                  .withAlpha(170),
            ),
          ),
        ),
        if (_currentChapter!.words > 0) ...[
          const SizedBox(width: 16),
          Text(
            '${_currentChapter!.words} words',
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.theme.colorScheme.onSurfaceVariant,
              fontFamily: settings.bodyFontFamily,
            ),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildChapterSummary(ReaderProvider settings) {
    if (_currentChapter?.summary?.isNotEmpty != true) {
      return [];
    }

    return [
      SizedBox(height: 16 * settings.paragraphSpacing),
      _buildInfoContainer(
        content: _currentChapter!.summary!,
        textStyle: GoogleFonts.getFont(
          settings.bodyFontFamily,
          textStyle: context.theme.textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.bodyFontFamily,
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildChapterPreface(ReaderProvider settings) {
    if (_currentChapter?.preface?.isNotEmpty != true) {
      return [];
    }

    return [
      SizedBox(height: 16 * settings.paragraphSpacing),
      Opacity(
        opacity: 0.7,
        child: TextHeader.small(
          title: "Notes",
          hasPadding: false,
          color: settings.readerColor.toForegroundColor(context),
        ),
      ),
      _buildInfoContainer(
        content: _currentChapter!.preface!,
        backgroundColor: settings.readerColor.toContainerColor(context),
        textStyle: GoogleFonts.getFont(
          settings.bodyFontFamily,
          textStyle: TextStyle(
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.bodyFontFamily,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
    ];
  }

  Widget _buildInfoContainer({
    required String content,
    Color? backgroundColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 4.0,
      vertical: 16.0,
    ),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: HtmlWidget(
        content,
        textStyle: textStyle ?? context.theme.textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildDockedToolbar() {
    final bool hasPrevious = _currentChapterIndex > 0;
    final bool hasNext = _currentChapterIndex < _chapters.length - 1;

    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return Container(
          color: context.theme.colorScheme.surfaceContainer,
          height: kToolbarHeight + context.screenPadding.bottom,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavigationButton(
                  icon: TablerIcons.chevron_left,
                  onPressed: hasPrevious ? _previousChapter : null,
                ),
                _buildNavigationButton(
                  icon: TablerIcons.chevron_right,
                  onPressed: hasNext ? _nextChapter : null,
                ),
                _buildChapterListButton(),
                _buildBookmarkButton(),
                _buildOptionsButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      iconSize: _iconSize,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget _buildChapterListButton() {
    return IconButton.filled(
      iconSize: _iconSize,
      style: IconButton.styleFrom(
        backgroundColor: context.theme.colorScheme.tertiary,
        foregroundColor: context.theme.colorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      icon: const Icon(TablerIcons.list),
      onPressed: _showChapterList,
    );
  }

  Widget _buildBookmarkButton() {
    return IconButton(
      iconSize: _iconSize,
      icon: const Icon(TablerIcons.bookmark),
      onPressed: () => {}, // TODO: Implement bookmark
    );
  }

  Widget _buildOptionsButton() {
    return IconButton(
      iconSize: _iconSize,
      icon: const Icon(TablerIcons.dots_vertical),
      onPressed: _showWorkOptions,
    );
  }
}
