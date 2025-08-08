import 'package:archiverse/api.dart';
import 'package:archiverse/components/bookmarks_card.dart';
import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/dialogs/authors_list_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/mixins/mixin_common_paginated_list.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_detail.dart';
import 'package:archiverse/views/lists/activity_series_bookmarks.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SeriesActivity extends CommonDetailActivity<Series> {
  static const String routeName = "/detail/series/";
  const SeriesActivity({super.key, required Series series})
    : super(item: series);

  @override
  SeriesDetailState createState() => SeriesDetailState();
}

class SeriesDetailState extends CommonDetailActivityState<Series>
    with CommonPaginatedListMixin<Work> {
  SeriesDetailState() : super(Fillers.series);

  // State variables
  List<Bookmark>? _bookmarks;
  bool _isBookmarked = false;
  bool _showAllWorks = false;
  List<Work> _initialWorks = [];

  @override
  void initState() {
    super.initState();
    initializePagination();
  }

  @override
  void dispose() {
    disposePagination();
    super.dispose();
  }

  @override
  void onItemLoaded() {
    // Fetch initial works when item is loaded
    _fetchInitialWorks();
    _fetchBookmarks();
  }

  @override
  Future<void> onRefreshContent() async {
    // Refresh bookmarks and initial works when content is refreshed
    _fetchBookmarks();
    _fetchInitialWorks();
  }

  @override
  bool get hasNextPage {
    // If API already returns no more works, we don't need to check further
    if (!hasNextPageInternal) return false;

    // If we come across a situation where pageCount == current number of works,
    // we need to infer from somewhere else if there are more works.
    // For series, we can check the works reported in the series metadata.
    if (itemsCount >= item.works) {
      return false; // No more works than the series count
    }

    return hasNextPageInternal;
  }

  @override
  Future<List<Work>> fetchItems(int page) async {
    return await AppApi().getWorksFromSeries(item, page: page);
  }

  void _fetchBookmarks() async {
    try {
      List<Bookmark> bookmarks = await AppApi().getBookmarksFromSeries(
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

  Future<void> _fetchInitialWorks() async {
    try {
      final works = await AppApi().getWorksFromSeries(item, page: 1);
      setState(() {
        _initialWorks = works;
      });
    } catch (e) {
      // Handle error if needed
    }
  }

  void _toggleAllWorks() {
    setState(() {
      _showAllWorks = true;
    });
    refreshPagination();
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
    // TODO: Implement actual bookmark functionality
  }

  void _subscribeSeries() {
    // TODO: Implement subscription functionality
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.25;
  }

  @override
  Future<Series> fetchItem({bool refresh = false}) {
    return AppApi().getSeries(
      item,
      refresh: refresh,
      priority: RequestPriority.high,
    );
  }

  @override
  List<Widget>? buildBottomBar(BuildContext context) {
    if (state == LoadingState.ERROR) return null;

    return [
      IconButton(
        onPressed: _toggleBookmark,
        icon: Icon(
          _isBookmarked ? TablerIcons.bookmark_filled : TablerIcons.bookmark,
          size: 22.0,
        ),
      ),

      IconButton(
        onPressed: _subscribeSeries,
        icon: Icon(TablerIcons.bell, size: 22.0),
      ),

      IconButton(
        onPressed: () => AppUtils.shareItem(item),
        icon: Icon(TablerIcons.share, size: 22.0),
      ),

      // Series Options
      IconButton(
        onPressed: () {
          // TODO
        },
        icon: Icon(TablerIcons.dots_vertical, size: 22.0),
      ),
    ];
  }

  @override
  List<Widget> buildDetailSlivers(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            _buildSeriesInfo(context),
            _buildAuthorsSection(context),
            SizedBox(height: 8.0),

            if (item.summary.isNotEmpty) ...[
              _buildSummarySection(context),
              const SizedBox(height: 8.0),
            ],

            _buildMetadataSection(context),
          ],
        ),
      ),
      _buildWorksSliver(context),

      // Bookmarks preview if available
      if (_bookmarks != null && _bookmarks!.isNotEmpty)
        SliverToBoxAdapter(child: _buildBookmarksSection(context)),

      SliverToBoxAdapter(
        child: SizedBox(height: context.screenPadding.bottom + 24.0),
      ),
    ];
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
              SeriesBookmarksActivity.routeName,
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

  Widget _buildSeriesInfo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status and last updated
          Row(
            children: [
              Icon(
                TablerIcons.clock,
                size: 18,
                color: colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Text(
                AppUtils.formatDate(context, item.updateDate ?? DateTime.now()),
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
                          "Complete",
                          style: context.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Skeleton.leaf(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          TablerIcons.clock,
                          size: 14,
                          color: colorScheme.onTertiaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "In Progress",
                          style: context.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
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
          _buildStatsRow(context),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatBox(
          context: context,
          icon: TablerIcons.books,
          value: item.works,
          label: "Works",
          color: colorScheme.primary,
        ),
        _buildStatBox(
          context: context,
          icon: TablerIcons.align_left,
          value: item.words,
          label: "Words",
          color: colorScheme.secondary,
        ),
        _buildStatBox(
          context: context,
          icon: TablerIcons.bookmarks,
          value: item.bookmarks,
          label: "Bookmarks",
          color: colorScheme.tertiary,
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

  Widget _buildAuthorsSection(BuildContext context) {
    if (item.authors.isEmpty) return SizedBox.shrink();

    return Card.filled(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          if (item.authors.length > 1) {
            AuthorsListDialog.showSheet(context, authors: item.authors);
            return;
          }

          context.navigator.pushNamed(
            AuthorActivity.routeName,
            arguments: item.authors.first,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Author avatars
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
                              future: AppApi().getPseud(item.authors[i]),
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

              Icon(TablerIcons.chevron_right, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: HtmlWidget(item.summary, textStyle: context.textTheme.bodyMedium),
    );
  }

  Widget _buildMetadataSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card.outlined(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Text(
                "Series Information",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Divider(
              height: 1,
              color: context.colorScheme.outlineVariant.withOpacity(0.3),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMetadataRow(
                    context,
                    TablerIcons.calendar_event,
                    "Started",
                    item.publishDate != null
                        ? AppUtils.formatDate(context, item.publishDate!)
                        : "Unknown",
                  ),
                  const SizedBox(height: 12),
                  _buildMetadataRow(
                    context,
                    TablerIcons.clock,
                    "Last Updated",
                    AppUtils.formatDate(
                      context,
                      item.updateDate ?? DateTime.now(),
                    ),
                  ),
                  if (item.notes != null && item.notes!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildMetadataRow(
                      context,
                      TablerIcons.note,
                      "Notes",
                      item.notes!,
                      isExpandable: true,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataRow(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    bool isExpandable = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              isExpandable
                  ? HtmlWidget(value, textStyle: context.textTheme.bodyMedium)
                  : Text(value, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorksSliver(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextHeader.large(
              title: "Works in Series",
              icon: TablerIcons.books,
              padding: const EdgeInsets.symmetric(horizontal: -8.0),
            ),
          ),
        ),
        if (!_showAllWorks) ...[
          // Show initial works
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index < _initialWorks.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: WorkCard(work: _initialWorks[index]),
                );
              }
              return null;
            }, childCount: 5),
          ),
          // Show "See all" button if there are more works
          if (item.works > 5)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: FilledButton.icon(
                    onPressed: _toggleAllWorks,
                    icon: Icon(TablerIcons.eye),
                    label: Text("See all ${item.works} parts"),
                  ),
                ),
              ),
            ),
          // Show empty state if no works
          if (_initialWorks.isEmpty)
            SliverToBoxAdapter(
              child: Center(
                child: ItemPlaceholder.small(
                  message: "No works in this series yet",
                  icon: TablerIcons.books_off,
                ),
              ),
            ),
        ] else ...[
          // Show paginated list when "See all" is tapped
          PagingListener<int, Work>(
            controller: pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedSliverList<int, Work>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Work>(
                    itemBuilder: (context, work, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: WorkCard(work: work),
                    ),
                    firstPageErrorIndicatorBuilder: (context) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: LoadError.small(
                          onPressed: () => pagingController.refresh(),
                        ),
                      ),
                    ),
                    newPageErrorIndicatorBuilder: (context) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: LoadError.small(
                          onPressed: () => fetchNextPage(),
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: ItemPlaceholder.small(
                        message: "No works in this series yet",
                        icon: TablerIcons.books_off,
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        _buildLoadingList(context),
                    newPageProgressIndicatorBuilder: (context) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildLoadingList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: List.generate(
          3,
          (index) => Skeletonizer(
            enabled: true,
            child: Card(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Container(height: 120),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8.0,
        children: [
          // Series type indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Series",
              style: context.textTheme.labelSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            item.title,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(item.title);
  }

  String _getAuthorName(Pseud pseud) {
    if (pseud.isPseud) {
      return "${pseud.pseud} (${pseud.name})";
    } else {
      return pseud.name;
    }
  }
}
