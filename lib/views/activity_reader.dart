import 'package:archiverse/api.dart';
import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/reader/reader_content.dart';
import 'package:archiverse/components/reader/reader_toolbar.dart';
import 'package:archiverse/dialogs/chapters_list.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static const double _dragThreshold = 0.3;
  static const double _scrollThreshold = 5.0;
  static const int _dragVelocityThreshold = 500;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  // Core data
  Work get work => widget.work;
  final Ao3Api _api = Ao3Api();

  List<Chapter> _chapters = [];
  int _chapterIdx = 0;
  Chapter? _chapter;
  bool _hasPostedHit = false;

  // State management
  bool _loading = true;
  String? _error;
  bool _disposed = false;

  // UI animation
  late AnimationController _animator;
  late Animation<double> _animation;
  bool _fullscreen = false;
  ReaderColor _color = ReaderColor.system;

  // Drag interaction
  double _dragOpacity = 1.0;
  bool _isDragging = false;
  double _dragStartX = 0.0;

  // Scroll handling
  final ScrollController _scroller = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Initialize reader provider with context and scroll controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReaderProvider>().initialize(
        context: context,
        controller: _scroller,
      );
    });

    _initialize();
    _loadChapters();
  }

  @override
  void dispose() {
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);

    _animator.dispose();
    _scroller.dispose();
    _setWakelock(false);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _recordHistory();

      _resetStatusBarColor();
    }
  }

  @override
  void deactivate() {
    _recordHistory();

    _resetStatusBarColor();
    super.deactivate();
  }

  void _recordHistory() {
    if (_disposed || _chapter == null) return;
    context.read<ReaderProvider>().saveReadHistory(
      work: work,
      chapter: _chapter!,
    );
  }

  void _initialize() {
    // Set up the animation for showing/hiding the reader UI
    _animator = AnimationController(duration: _animationDuration, vsync: this);
    _animation = CurvedAnimation(
      parent: _animator,
      curve: Curves.easeInOutCubicEmphasized,
    );
    _animator.forward();

    // Start tracking the current scroll position
    _scroller.addListener(_onScroll);

    // Enable wakelock if needed
    final settings = context.read<ReaderProvider>();
    _setWakelock(settings.keepScreenOn);
  }

  void _setWakelock(bool enable) {
    if (enable) {
      WakelockPlus.enable();
    } else {
      WakelockPlus.disable();
    }
  }

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
      final chapterWithContent = await _api.getChapter(_chapters[_chapterIdx]);

      if (!_disposed) {
        setState(() {
          _chapter = chapterWithContent;
          _loading = false;
        });

        // Restore scroll position after loading
        await _restoreScrollPosition();

        if (!_hasPostedHit) {
          _hasPostedHit = true;
          AppApi().postHit(work);
        }
      }
    } catch (e) {
      if (!_disposed) {
        _setErrorState(e.toString());
      }
    }
  }

  Future<void> _restoreScrollPosition() async {
    if (_chapter == null) return;

    final readHistory = await context.read<LibraryProvider>().getReadHistory(
      work,
    );

    if (readHistory?.chapter?.id == _chapter!.id &&
        readHistory?.position != null &&
        readHistory!.position > 0) {
      // Wait for the ListView to build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroller.hasClients) {
          _scroller.animateTo(
            readHistory.position.toDouble(),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void _setLoadingState() {
    if (!_disposed) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
  }

  void _setErrorState(String error) {
    if (!_disposed) {
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _setInitialChapterIndex() async {
    if (widget.chapter != null) {
      _chapterIdx = _chapters.indexWhere((c) => c.id == widget.chapter!.id);
      if (_chapterIdx == -1) _chapterIdx = 0;
      return;
    }

    final readHistory = await context.read<LibraryProvider>().getReadHistory(
      work,
    );
    if (readHistory != null) {
      _chapterIdx = _chapters.indexWhere(
        (c) => c.id == readHistory.chapter?.id,
      );
      if (_chapterIdx == -1) _chapterIdx = 0;
    }
  }

  Future<void> _navigateToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;

    _recordHistory();

    if (!_disposed) {
      setState(() {
        _chapterIdx = index;
        _loading = true;
        _chapter = null;
      });
    }

    await _loadCurrentChapter();
  }

  void _previousChapter() {
    if (_chapterIdx > 0) {
      _navigateToChapter(_chapterIdx - 1);
    }
  }

  void _nextChapter() {
    if (_chapterIdx < _chapters.length - 1) {
      _navigateToChapter(_chapterIdx + 1);
    }
  }

  void _onScroll() {
    final currentOffset = _scroller.offset;
    final scrollDelta = currentOffset - _scrollOffset;

    if (scrollDelta.abs() > _scrollThreshold) {
      final shouldHideUI = scrollDelta > 0;
      if (shouldHideUI && !_fullscreen) {
        _toggleUI(false);
      } else if (!shouldHideUI && _fullscreen) {
        _toggleUI(true);
      }
    }

    _scrollOffset = currentOffset;
  }

  void _toggleUI([bool? show]) {
    if (_disposed) return;

    final shouldShow = show ?? _fullscreen;

    if (shouldShow != !_fullscreen) {
      setState(() {
        _fullscreen = !shouldShow;
        _setStatusBarColor(shouldShow);
      });

      if (shouldShow) {
        _animator.forward();
      } else {
        _animator.reverse();
      }
    }
  }

  void _onContentTap(TapUpDetails details) {
    _toggleUI();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    if (!_disposed) {
      setState(() {
        _isDragging = true;
        _dragStartX = details.localPosition.dx;
      });
    }
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_disposed) return;

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
    if (!_disposed) {
      setState(() {
        _isDragging = false;
        _dragOpacity = 1.0;
      });
    }
  }

  void _showChapterList() {
    ChaptersListDialog.showSheet(
      context,
      chapters: _chapters,
      currentChapterIndex: _chapterIdx,
      onChapterSelected: _navigateToChapter,
    );
  }

  void _showWorkOptions() {
    WorkOptionsDialog.showSheet(context, work: work, isReader: true);
  }

  void _showBookmarks() {
    // TODO: Implement bookmark functionality
  }

  void _resetStatusBarColor() {
    context.setNavigationBarColor(Colors.transparent);
  }

  void _setStatusBarColor(bool reset) async {
    if (reset) {
      _resetStatusBarColor();
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    switch (_color) {
      case ReaderColor.light:
      case ReaderColor.sepia:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
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
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        break;
      case ReaderColor.system:
        _resetStatusBarColor();
        break;
    }
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

        _color = settings.readerColor;

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
      preferredSize: const Size.fromHeight(kExpressiveToolbarHeight),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              0,
              -kExpressiveToolbarHeight * (1 - _animation.value),
            ),
            child: Opacity(
              opacity: _animation.value,
              child: ExpressiveAppBar(
                title: Text(work.title),
                unelevatedColor: context.theme.colorScheme.surfaceContainer,
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
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            (kToolbarHeight + context.screenPadding.bottom) *
                (1 - _animation.value),
          ),
          child: Opacity(
            opacity: _animation.value,
            child: PreferredSize(
              preferredSize: Size(
                double.infinity,
                kToolbarHeight + context.screenPadding.bottom,
              ),
              child: ReaderToolbar(
                hasPrevious: _chapterIdx > 0,
                hasNext: _chapterIdx < _chapters.length - 1,
                onPreviousChapter: _previousChapter,
                onNextChapter: _nextChapter,
                onShowChapterList: _showChapterList,
                onShowBookmarks: _showBookmarks,
                onShowOptions: _showWorkOptions,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(ReaderProvider settings) {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(
          color: settings.readerColor.toForegroundColor(context),
        ),
      );
    }

    if (_error != null) {
      return Center(child: LoadError(onPressed: _loadCurrentChapter));
    }

    return ReaderContent(
      chapter: _chapter,
      chapters: _chapters,
      currentChapterIndex: _chapterIdx,
      scrollController: _scroller,
      onContentTap: _onContentTap,
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      onHorizontalDragCancel: _onHorizontalDragCancel,
      dragOpacity: _dragOpacity,
      isDragging: _isDragging,
    );
  }
}
