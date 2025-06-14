import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/dialogs/chapters_list.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ReaderActivity extends CommonActivity {
  static const String routeName = '/work/read';
  const ReaderActivity({super.key, required this.work, this.chapter});

  final Work work;
  final Chapter? chapter;

  @override
  State<ReaderActivity> createState() => _ReaderActivityState();
}

class _ReaderActivityState extends State<ReaderActivity> {
  Work get work => widget.work;

  List<Chapter> _chapters = [];
  int _currentChapterIndex = 0;
  Chapter? _currentChapter;
  bool _isLoading = true;
  String? _error;

  final PageController _pageController = PageController();
  final Ao3Api _api = Ao3Api();

  @override
  void initState() {
    super.initState();
    _loadChapters();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadChapters() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Get chapter list from work
      _chapters = await _api.getChapterList(work);

      // Find initial chapter index
      if (widget.chapter != null) {
        _currentChapterIndex = _chapters.indexWhere(
          (c) => c.id == widget.chapter!.id,
        );
        if (_currentChapterIndex == -1) _currentChapterIndex = 0;
      }

      // Load the current chapter content
      await _loadCurrentChapter();
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
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
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _navigateToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;

    setState(() {
      _currentChapterIndex = index;
      _isLoading = true;
      _currentChapter = null;
    });

    await _loadCurrentChapter();
    _pageController.animateToPage(
      0, // Reset to top of new chapter
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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

  @override
  Widget build(BuildContext context) {
    context.setNavigationBarColor(Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        title: Text(work.title),
        centerTitle: true,
        backgroundColor: context.theme.colorScheme.surfaceContainer,
      ),
      body: _buildBody(),
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size(double.infinity, 64.0),
        child: _buildDockedToolbar(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: LoadError(onPressed: _loadCurrentChapter));
    }

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Swipe navigation
        if (details.primaryVelocity! > 0) {
          // Swiped right - previous chapter
          _previousChapter();
        } else if (details.primaryVelocity! < 0) {
          // Swiped left - next chapter
          _nextChapter();
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter header
            _buildChapterHeader(),
            const SizedBox(height: 24),

            // Chapter content
            if (_currentChapter?.content != null)
              _buildChapterContent()
            else
              const Center(child: Text('No content available')),

            if (_currentChapter!.postface?.isNotEmpty == true) ...[
              const SizedBox(height: 16),
              Opacity(
                opacity: 0.7,
                child: TextHeader.small(title: "Notes", hasPadding: false),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.tertiaryContainer
                      .withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: HtmlWidget(
                  _currentChapter!.postface!,
                  textStyle: context.theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChapterHeader() {
    if (_currentChapter == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Chapter number and title
        Text(
          _currentChapter!.title.isNotEmpty
              ? _currentChapter!.title
              : 'Chapter ${_currentChapter!.chapter}',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        // Chapter info
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_currentChapterIndex + 1} of ${_chapters.length}',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleSmall?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (_currentChapter!.words > 0) ...[
              const SizedBox(width: 16),
              Text(
                '${_currentChapter!.words} words',
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),

        // Summary if available
        if (_currentChapter!.summary?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: HtmlWidget(
              _currentChapter!.summary!,
              textStyle: context.theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
        if (_currentChapter!.preface?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          Opacity(
            opacity: 0.7,
            child: TextHeader.small(title: "Notes", hasPadding: false),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.tertiaryContainer.withOpacity(
                0.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: HtmlWidget(
              _currentChapter!.preface!,
              textStyle: context.theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildChapterContent() {
    return HtmlWidget(_currentChapter!.content!);
  }

  Widget _buildDockedToolbar() {
    const double iconSize = 22.0;
    final bool hasPrevious = _currentChapterIndex > 0;
    final bool hasNext = _currentChapterIndex < _chapters.length - 1;

    return Container(
      color: context.theme.colorScheme.surfaceContainer,
      height: 64.0,
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: iconSize,
            icon: const Icon(TablerIcons.chevron_left),
            onPressed: hasPrevious ? _previousChapter : null,
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(TablerIcons.chevron_right),
            onPressed: hasNext ? _nextChapter : null,
          ),

          IconButton.filled(
            iconSize: iconSize,
            style: IconButton.styleFrom(
              backgroundColor: context.theme.colorScheme.tertiary,
              foregroundColor: context.theme.colorScheme.onTertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            icon: const Icon(TablerIcons.list),
            onPressed: _showChapterList,
          ),

          IconButton(
            iconSize: iconSize,
            icon: const Icon(TablerIcons.bookmark),
            onPressed: () => {}, // TODO: Implement bookmark
          ),

          IconButton(
            iconSize: iconSize,
            icon: const Icon(TablerIcons.dots_vertical),
            onPressed: () => WorkOptionsDialog.showSheet(
              context,
              work: work,
              isReader: true,
            ),
          ),
        ],
      ),
    );
  }

  void _showChapterList() {
    ChaptersListDialog.showSheet(
      context,
      chapters: _chapters,
      currentChapterIndex: _currentChapterIndex,
      onChapterSelected: _navigateToChapter,
    );
  }
}
