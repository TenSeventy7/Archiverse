import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/bookmarks_card.dart';
import 'package:archiverse/components/cards/series_card.dart';
import 'package:archiverse/components/items/series_item.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/rating_list.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/dialogs/author_orphan_info.dart';
import 'package:archiverse/dialogs/authors_list_dialog.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_detail.dart';
import 'package:archiverse/components/work_metadata_item.dart';
import 'package:archiverse/views/lists/activity_tag_works.dart';
import 'package:archiverse/views/lists/activity_work_bookmarks.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkActivity extends CommonDetailActivity<Work> {
  static const String routeName = "/detail/work/";
  const WorkActivity({super.key, required Work work}) : super(item: work);

  @override
  WorkDetailState createState() => WorkDetailState();
}

// Helper function for minimum value since dart:math min isn't being used
int min(int a, int b) => a < b ? a : b;

class WorkDetailState extends CommonDetailActivityState<Work> {
  WorkDetailState() : super(Fillers.work);

  // State variables
  List<Bookmark>? _bookmarks;
  List<SeriesWork>? _series;
  bool _isLiked = false;

  // Scroll controller for custom scroll effects
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Can implement scroll-based UI updates here if needed
  }

  @override
  void onItemLoaded() {
    _fetchSeries();
    _fetchBookmarks();
  }

  void _fetchSeries() async {
    try {
      List<SeriesWork> fetched = [];
      for (var part in item.series) {
        Series series = await Ao3Api().getSeries(part.series);
        fetched.add(part.copyWith(series: series));
      }

      if (mounted) {
        setState(() {
          _series = fetched;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _series = [];
        });
      }
    }
  }

  void _fetchBookmarks() async {
    try {
      List<Bookmark> bookmarks = await Ao3Api().getBookmarksFromWork(
        item,
        page: 1,
      );
      if (mounted) {
        setState(() {
          _bookmarks = bookmarks;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _bookmarks = null;
        });
      }
    }
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    // TODO: Implement actual like functionality
  }

  void _startReading() {
    Navigator.pushNamed(
      context,
      "", // TODO: Add Reader.routeName
      arguments: {"work": item, "chapter": null},
    );
  }

  void _downloadWork() {
    // TODO: Implement download functionality
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.25;
  }

  @override
  Future<Work> fetchItem() {
    return Ao3Api().getWork(item);
  }

  @override
  List<Widget>? buildBottomBar(BuildContext context) {
    if (state == LoadingState.ERROR) return null;

    return [
      IconButton(
        onPressed: _toggleLike,
        icon: Icon(
          _isLiked ? TablerIcons.heart_filled : TablerIcons.heart,
          size: 22.0,
        ),
      ),

      IconButton(
        onPressed: () {
          // TODO
        },
        icon: Icon(TablerIcons.message, size: 22.0),
      ),

      IconButton(
        onPressed: () {
          // TODO
        },
        icon: Icon(TablerIcons.share, size: 22.0),
      ),

      // Work Options
      IconButton(
        onPressed: () =>
            WorkOptionsDialog.showSheet(context, work: widget.item),
        icon: Icon(TablerIcons.dots_vertical, size: 22.0),
      ),
    ];
  }

  @override
  Widget buildBottomActionButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: "read",
      backgroundColor: context.colorScheme.tertiaryContainer,
      foregroundColor: context.colorScheme.onTertiaryContainer,
      onPressed: () {},
      child: Icon(TablerIcons.book, size: 20.0),
    );
  }

  @override
  List<Widget> buildDetailSlivers(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              _buildHeroSection(context),
              SizedBox(height: 8.0),
              _buildWorkContent(context),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildHeroSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Last updated info
          Row(
            children: [
              Icon(
                TablerIcons.clock,
                size: 18,
                color: colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Text(
                AppUtils.formatWorkLastUpdated(context, item),
                style: context.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                ),
              ),

              const Spacer(),

              // Completion status
              if (item.finished == true)
                Skeleton.leaf(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          TablerIcons.check,
                          size: 14,
                          color: colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Completed",
                          style: context.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 24.0),
          _buildHeroStats(context),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildHeroStats(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatBox(
          context: context,
          icon: TablerIcons.bookmarks,
          value: item.bookmarks,
          label: "Bookmarks",
          color: colorScheme.primary,
        ),
        _buildStatBox(
          context: context,
          icon: TablerIcons.heart,
          value: item.kudos,
          label: "Kudos",
          color: colorScheme.secondary,
        ),
        _buildStatBox(
          context: context,
          icon: TablerIcons.message,
          value: item.comments,
          label: "Comments",
          color: colorScheme.tertiary,
        ),
        _buildStatBox(
          context: context,
          icon: TablerIcons.eye,
          value: item.hits,
          label: "Hits",
          color: colorScheme.error,
        ),
      ],
    );
  }

  Widget _buildStatBox({
    required BuildContext context,
    required IconData icon,
    required int value,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 6),
        Text(
          AppUtils.formatCompactNumber(value),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author avatars with profile links
          _buildAuthorSection(context),

          // Series information if applicable
          if (item.series.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: _buildSeriesSection(context),
            ),

          // Summary section - always show full
          if (item.summary.isNotEmpty) ...[
            _buildSummarySection(context),
            const SizedBox(height: 2),
          ],

          // Ratings
          _buildRatingsSetction(context),

          // Tags in vertical layout
          _buildAllTagsSection(context),

          // Additional metadata card
          _buildMetadataSection(context),

          // Bookmarks preview if available
          if (_bookmarks != null && _bookmarks!.isNotEmpty)
            _buildBookmarksSection(context),
        ],
      ),
    );
  }

  Widget _buildAuthorSection(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          if (item.authors.first.isOrphan) {
            // Show author orphan info dialog
            AuthorOrphanInfoDialog.showSheet(context);
            return;
          }

          // If more than 1 author, show list dialog
          if (item.authors.length > 1) {
            // Show authors list dialog
            AuthorsListDialog.showSheet(context, authors: item.authors);
            return;
          }

          // Otherwise, navigate to author detail
          context.navigator.pushNamed(
            AuthorActivity.routeName,
            arguments: item.authors.first,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Author avatars with overlap
              Skeleton.leaf(
                child: SizedBox(
                  height: 48,
                  width: item.authors.length > 1
                      ? 48 + (item.authors.length - 1) * 24
                      : 48,
                  child: Stack(
                    children: [
                      for (int i = 0; i < item.authors.length; i++)
                        Positioned(
                          left: i * 24.0,
                          child: CircleAvatar(
                            radius: 24,
                            child: EnhancedFutureBuilder(
                              future: Ao3Api().getPseud(item.authors[i]),
                              rememberFutureResult: true,
                              whenDone: (author) => UserImage(
                                context: context,
                                user: author,
                                size: 24,
                              ),
                              whenNotDone: UserImage(
                                context: context,
                                user: item.authors[i],
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Author names
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.authors.length == 1 ? "Author" : "Authors",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      item.authors.length == 1
                          ? _getAuthorName(item.authors.first)
                          : "${item.authors.length} authors",
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var s in _series ?? item.series) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Part ${s.part} of the series",
              style: context.textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SeriesCard.small(series: s.series),
        ],
      ],
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    final String summary = item.summary;
    final bool hasSummary = summary.isNotEmpty;

    if (!hasSummary) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HtmlWidget(summary, textStyle: context.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildRatingsSetction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.medium(title: "Ratings", hasPadding: false),
          RatingList(work: item),
        ],
      ),
    );
  }

  Widget _buildAllTagsSection(BuildContext context) {
    // Define all tag groups to display
    final Map<String, List<Tag>> tagGroups = {
      "Fandoms": item.fandoms,
      "Characters": item.characters,
      "Relationships": item.relationships,
      "Tags": item.tags,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Loop through each tag category
          for (var entry in tagGroups.entries) ...[
            if (entry.value.isNotEmpty) ...[
              // Category header
              TextHeader.medium(
                title: entry.key,
                icon: _getCategoryIcon(entry.key),
                hasPadding: false,
              ),

              // Tags wrapped in a Flow widget
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: entry.value
                    .map(
                      (tag) => ActionChip(
                        avatar: _getTagIconFor(entry.key),
                        backgroundColor: context.colorScheme.surfaceVariant
                            .withOpacity(0.3),
                        side: BorderSide(
                          color: context.colorScheme.outline.withOpacity(0.2),
                          width: 1,
                        ),
                        label: Text(tag.name),
                        onPressed: () {
                          context.navigator.pushNamed(
                            TagWorksActivity.routeName,
                            arguments: tag,
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case "Fandoms":
        return TablerIcons.books;
      case "Characters":
        return TablerIcons.users;
      case "Relationships":
        return TablerIcons.hearts;
      case "Tags":
        return TablerIcons.tags;
      default:
        return TablerIcons.tag;
    }
  }

  Widget? _getTagIconFor(String category) {
    IconData? iconData;

    switch (category) {
      case "Fandoms":
        iconData = TablerIcons.book;
        break;
      case "Characters":
        iconData = TablerIcons.user;
        break;
      case "Relationships":
        iconData = TablerIcons.heart;
        break;
      case "Tags":
        iconData = TablerIcons.tag;
        break;
    }

    return iconData != null ? Icon(iconData, size: 14) : null;
  }

  Widget _buildMetadataSection(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Card.outlined(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Text(
                "Work Information",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withOpacity(0.3),
            ),

            // Grid of metadata items
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 24,
                runSpacing: 16,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  WorkMetadataItem(
                    context: context,
                    icon: TablerIcons.book_2,
                    label: "Chapters",
                    value:
                        "${item.chapters}/${item.finished == true ? item.totalChapters : '?'}",
                  ),
                  WorkMetadataItem(
                    context: context,
                    icon: TablerIcons.align_left,
                    label: "Words",
                    value: AppUtils.formatNumber(item.words),
                  ),
                  WorkMetadataItem(
                    context: context,
                    icon: TablerIcons.clock,
                    label: "Updated",
                    value: AppUtils.formatDate(context, item.updateDate),
                  ),
                  if (item.publishDate != null) ...[
                    WorkMetadataItem(
                      context: context,
                      icon: TablerIcons.calendar_event,
                      label: "Published",
                      value: AppUtils.formatDate(context, item.publishDate!),
                    ),
                  ],
                  WorkMetadataItem(
                    context: context,
                    icon: TablerIcons.language,
                    label: "Language",
                    value: item.language ?? "English",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.medium(
            title: "Recent Bookmarks",
            actionText: Text("See all"),
            onTap: () => context.navigator.pushNamed(
              WorkBookmarksActivity.routeName,
              arguments: item,
            ),
            hasPadding: false,
          ),

          const SizedBox(height: 8),

          BookmarksCard(bookmarks: _bookmarks, context: context),
        ],
      ),
    );
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(item.title);
  }

  String _getAuthorName(Pseud first) {
    if (first.isPseud) {
      return "${first.pseud} (${first.name})";
    } else {
      return first.name;
    }
  }
}
