import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/dialogs/chapters_list.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/reading_layout.dart';
import 'package:archiverse/models/work.dart';
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
    with TickerProviderStateMixin {
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

  // State management
  bool _isLoading = true;
  String? _error;

  // UI animation
  late AnimationController _uiAnimationController;
  late Animation<double> _uiAnimation;
  bool _isUiVisible = true;

  // Drag interaction
  double _dragOpacity = 1.0;
  bool _isDragging = false;
  double _dragStartX = 0.0;

  // Scroll handling
  final ScrollController _scrollController = ScrollController();
  double _lastScrollOffset = 0.0;

  // Page controller for paged scrolling
  PageController? _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupScrollListener();
    _loadChapters();
    _setupScreenSettings();
  }

  @override
  void dispose() {
    _uiAnimationController.dispose();
    _scrollController.dispose();
    _pageController?.dispose();
    _restoreScreenSettings();
    super.dispose();
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
      _setInitialChapterIndex();

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

      setState(() {
        _currentChapter = chapterWithContent;
        _isLoading = false;
      });

      _initializePageController();
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  void _initializePageController() {
    final settings = context.read<ReaderProvider>();
    if (settings.scrollingType == ScrollingType.paged) {
      _pageController?.dispose();
      _pageController = PageController();
      _currentPage = 0;
    }
  }

  // State management methods
  void _setLoadingState() {
    setState(() {
      _isLoading = true;
      _error = null;
    });
  }

  void _setErrorState(String error) {
    setState(() {
      _error = error;
      _isLoading = false;
    });
  }

  void _setInitialChapterIndex() {
    if (widget.chapter != null) {
      _currentChapterIndex = _chapters.indexWhere(
        (c) => c.id == widget.chapter!.id,
      );
      if (_currentChapterIndex == -1) _currentChapterIndex = 0;
    }
  }

  // Navigation methods
  Future<void> _navigateToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;

    setState(() {
      _currentChapterIndex = index;
      _isLoading = true;
      _currentChapter = null;
    });

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

  void _previousPage() {
    if (_pageController != null && _currentPage > 0) {
      final settings = context.read<ReaderProvider>();
      if (settings.useScrollAnimation) {
        _pageController!.previousPage(
          duration: _animationDuration,
          curve: Curves.easeInOut,
        );
      } else {
        _pageController!.jumpToPage(_currentPage - 1);
      }
    }
  }

  void _nextPage() {
    if (_pageController != null) {
      final settings = context.read<ReaderProvider>();
      if (settings.useScrollAnimation) {
        _pageController!.nextPage(
          duration: _animationDuration,
          curve: Curves.easeInOut,
        );
      } else {
        _pageController!.jumpToPage(_currentPage + 1);
      }
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
    final shouldShow = show ?? !_isUiVisible;

    if (shouldShow != _isUiVisible) {
      setState(() => _isUiVisible = shouldShow);

      if (shouldShow) {
        _uiAnimationController.forward();
      } else {
        _uiAnimationController.reverse();
      }
    }
  }

  void _onContentTap(TapUpDetails details) {
    final settings = context.read<ReaderProvider>();

    if (settings.scrollingType == ScrollingType.paged && settings.tapEdges) {
      final screenWidth = MediaQuery.of(context).size.width;
      final tapX = details.localPosition.dx;
      final edgeThreshold = screenWidth * 0.2;

      if (tapX < edgeThreshold) {
        _previousPage();
        return;
      } else if (tapX > screenWidth - edgeThreshold) {
        _nextPage();
        return;
      }
    }

    _toggleUI();
  }

  // Drag handling methods
  void _onHorizontalDragStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
      _dragStartX = details.localPosition.dx;
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
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
    final settings = context.read<ReaderProvider>();
    final adjustedVelocity = velocity * settings.scrollSensitivity;

    if (adjustedVelocity > _dragVelocityThreshold) {
      if (settings.scrollingType == ScrollingType.paged) {
        _previousPage();
      } else {
        _previousChapter();
      }
    } else if (adjustedVelocity < -_dragVelocityThreshold) {
      if (settings.scrollingType == ScrollingType.paged) {
        _nextPage();
      } else {
        _nextChapter();
      }
    }
  }

  void _onHorizontalDragCancel() => _resetDragState();

  void _resetDragState() {
    setState(() {
      _isDragging = false;
      _dragOpacity = 1.0;
    });
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

  // Build methods
  @override
  Widget build(BuildContext context) {
    context.setNavigationBarColor(Colors.transparent);

    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(settings.textScaleFactor)),
          child: Scaffold(
            appBar: _buildAnimatedAppBar(),
            backgroundColor: settings.readerColor.toBackgroundColor(context),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: _buildBody(settings),
            bottomNavigationBar: _buildAnimatedBottomNavBar(),
          ),
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
    if (settings.scrollingType == ScrollingType.paged) {
      return _buildPagedContent(settings);
    }
    return _buildContinuousContent(settings);
  }

  Widget _buildContinuousContent(ReaderProvider settings) {
    return SingleChildScrollView(
      key: ValueKey(_currentChapterIndex),
      controller: _scrollController,
      physics: settings.scrollPhysics,
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: context.commonPaddingDouble,
      ),
      child: _buildChapterContent(settings),
    );
  }

  Widget _buildPagedContent(ReaderProvider settings) {
    return PageView(
      controller: _pageController,
      physics: settings.scrollPhysics,
      onPageChanged: (index) => setState(() => _currentPage = index),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: context.commonPaddingDouble,
          ),
          child: _buildChapterContent(settings),
        ),
      ],
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

    final textStyle =
        GoogleFonts.getFont(settings.getFontFamily(settings.bodyFont)).copyWith(
          height: settings.lineHeight,
          color: settings.readerColor.toForegroundColor(context),
        );

    switch (settings.readingLayout) {
      case ReadingLayout.singleColumn:
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

      case ReadingLayout.dualColumn:
        return _buildDualColumnContent(settings, textStyle);

      case ReadingLayout.paginated:
        return _buildPaginatedContent(settings, textStyle);
    }
  }

  Widget _buildDualColumnContent(ReaderProvider settings, TextStyle textStyle) {
    // For dual column, we'll split the content roughly in half
    // This is a simplified implementation - you might want to implement
    // more sophisticated column balancing
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: HtmlWidget(_currentChapter!.content!, textStyle: textStyle),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(), // Placeholder for second column
        ),
      ],
    );
  }

  Widget _buildPaginatedContent(ReaderProvider settings, TextStyle textStyle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HtmlWidget(_currentChapter!.content!, textStyle: textStyle),
          if (settings.showScrollIndicator) ...[
            SizedBox(height: 16 * settings.paragraphSpacing),
            Center(
              child: Text(
                '— ${_currentPage + 1} —',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: settings.getFontFamily(settings.bodyFont),
                ),
              ),
            ),
          ],
        ],
      ),
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
            color: context.theme.colorScheme.tertiaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: HtmlWidget(
            _currentChapter!.postface!,
            textStyle: GoogleFonts.getFont(
              settings.getFontFamily(settings.bodyFont),
              textStyle: TextStyle(
                height: settings.lineHeight,
                fontFamily: settings.getFontFamily(settings.bodyFont),
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
        settings.getFontFamily(settings.headingFont),
        textStyle: context.theme.textTheme.titleLarge?.copyWith(
          color: settings.readerColor.toForegroundColor(context),
          fontWeight: FontWeight.bold,
          fontFamily: settings.getFontFamily(settings.headingFont),
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
            settings.getFontFamily(settings.bodyFont),
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
              fontFamily: settings.getFontFamily(settings.bodyFont),
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
          settings.getFontFamily(settings.bodyFont),
          textStyle: context.theme.textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.getFontFamily(settings.bodyFont),
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
        backgroundColor: context.theme.colorScheme.tertiaryContainer,
        textStyle: GoogleFonts.getFont(
          settings.getFontFamily(settings.bodyFont),
          textStyle: TextStyle(
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.getFontFamily(settings.bodyFont),
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
                if (settings.scrollingType == ScrollingType.paged) ...[
                  _buildNavigationButton(
                    icon: TablerIcons.chevron_left,
                    onPressed: _currentPage > 0 ? _previousPage : null,
                  ),
                  _buildNavigationButton(
                    icon: TablerIcons.chevron_right,
                    onPressed: _nextPage,
                  ),
                ] else ...[
                  _buildNavigationButton(
                    icon: TablerIcons.chevron_left,
                    onPressed: hasPrevious ? _previousChapter : null,
                  ),
                  _buildNavigationButton(
                    icon: TablerIcons.chevron_right,
                    onPressed: hasNext ? _nextChapter : null,
                  ),
                ],
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
