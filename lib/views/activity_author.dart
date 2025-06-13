import 'dart:math';

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/components/suggestions/bookmark_suggestions.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/components/suggestions/series_suggestions.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/dialogs/pseuds_list_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_common_detail.dart';
import 'package:archiverse/views/lists/activity_author_bookmarks.dart';
import 'package:archiverse/views/lists/activity_author_series.dart';
import 'package:archiverse/views/lists/activity_author_works.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthorActivity extends CommonDetailActivity<Pseud> {
  static const String routeName = "/detail/author/";
  final bool fromAuthor;
  const AuthorActivity({
    super.key,
    required Pseud author,
    this.fromAuthor = false,
  }) : super(item: author);

  @override
  AuthorDetailState createState() => AuthorDetailState();
}

class AuthorDetailState extends CommonDetailActivityState<Pseud> {
  AuthorDetailState() : super(Fillers.user);

  bool get fromAuthor =>
      widget is AuthorActivity ? (widget as AuthorActivity).fromAuthor : false;

  // Content sections
  List<Work>? _works;
  List<Bookmark>? _bookmarks;
  List<Series>? _series;

  // Loading states
  LoadingState _worksState = LoadingState.LOADING;
  LoadingState _bookmarksState = LoadingState.LOADING;
  LoadingState _seriesState = LoadingState.LOADING;

  @override
  void onItemLoaded() {
    _fetchWorks();
    _fetchBookmarks();
    _fetchSeries();
  }

  Future<void> _fetchWorks() async {
    setState(() {
      _worksState = LoadingState.LOADING;
    });

    try {
      final works = await Ao3Api().getWorksByUser(item);

      if (mounted) {
        setState(() {
          _works = works;
          _worksState = LoadingState.LOADED;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _worksState = LoadingState.ERROR;
        });
      }
    }
  }

  Future<void> _fetchBookmarks() async {
    setState(() {
      _bookmarksState = LoadingState.LOADING;
    });

    try {
      final bookmarks = await Ao3Api().getBookmarksByUser(item);

      if (mounted) {
        setState(() {
          _bookmarks = bookmarks;
          _bookmarksState = LoadingState.LOADED;
        });
      }
    } catch (e) {
      print("Error fetching bookmarks: $e");
      if (mounted) {
        setState(() {
          _bookmarksState = LoadingState.ERROR;
        });
      }
    }
  }

  Future<void> _fetchSeries() async {
    setState(() {
      _seriesState = LoadingState.LOADING;
    });

    try {
      final series = await Ao3Api().getSeriesByUser(item);

      if (mounted) {
        setState(() {
          _series = series;
          _seriesState = LoadingState.LOADED;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _seriesState = LoadingState.ERROR;
        });
      }
    }
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.28;
  }

  @override
  Future<Pseud> fetchItem() {
    if (item.isPseud) {
      return Ao3Api().getPseud(item);
    }

    return Ao3Api().getUser(item);
  }

  @override
  List<Widget> buildDetailSlivers(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.pseuds.isNotEmpty && item.pseuds.length > 1)
              // Only show pseuds selector for main profile (not when viewing a pseud)
              if (!item.isPseud &&
                  item.pseuds.isNotEmpty &&
                  item.pseuds.length > 1)
                _buildPseudsList(context),

            // Bio only exists for main user
            if (!item.isPseud && item.bio != null && item.bio!.isNotEmpty)
              _buildBioSection(context),

            // Show "Back to main profile" for pseuds
            if (item.isPseud) _buildMainProfileButton(context),

            _buildStatCards(context),
            _buildContentSections(context),

            // Add some space at the bottom
            SizedBox(height: context.screenPadding.bottom + 24.0),
          ],
        ),
      ),
    ];
  }

  Widget _buildMainProfileButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        color: colorScheme.primaryContainer.withOpacity(0.3),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: () {
            // If the user is viewing a pseud, just pop
            // We already have the main profile loaded in the stack below
            if (fromAuthor) {
              Navigator.of(context).pop();
              return;
            }

            final user = Pseud(name: item.name, pseud: item.name);
            Navigator.of(
              context,
            ).pushReplacementNamed(AuthorActivity.routeName, arguments: user);
          },
          leading: Icon(TablerIcons.user_circle, color: colorScheme.primary),
          title: Text(
            item.name,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "View the user's main profile",
            style: context.textTheme.bodySmall,
          ),
          trailing: Icon(TablerIcons.chevron_right, size: 18),
        ),
      ),
    );
  }

  Widget _buildBioSection(BuildContext context) {
    return PaddedColumn(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: HtmlWidget(
            item.bio ?? "",
            textStyle: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildPseudsList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    bool showMore = item.pseuds.length > 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeader.large(
          title: "Pseuds",
          icon: TablerIcons.pencil_bolt,
          onTap: item.pseuds.length > 4
              ? () => PseudsListDialog.showSheet(context, author: item)
              : null,
          actionText: showMore ? Text("See all") : null,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: min(item.pseuds.length, 4),
          itemBuilder: (context, index) {
            final pseud = item.pseuds[index];

            // Skip the main user pseud as we're already on their page
            if (!pseud.isPseud) return SizedBox();

            return Card.filled(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  AuthorActivity.routeName,
                  arguments: {"pseud": pseud, "fromAuthor": true},
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: colorScheme.primaryContainer,
                        child: EnhancedFutureBuilder(
                          future: Ao3Api().getPseud(pseud),
                          rememberFutureResult: true,
                          whenDone: (author) => UserImage(
                            context: context,
                            user: author,
                            size: 24,
                          ),
                          whenNotDone: UserImage(
                            context: context,
                            user: pseud,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pseud.pseud,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (pseud.works != null)
                              Text(
                                "${pseud.works} works",
                                style: context.textTheme.bodySmall,
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
          },
        ),
      ],
    );
  }

  Widget _buildWorksSection(BuildContext context) {
    if (_worksState == LoadingState.ERROR) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LoadError.small(onPressed: _fetchWorks)),
      );
    } else if (_worksState == LoadingState.LOADING) {
      return WorkSuggestions(works: Fillers.works, loading: true, elevation: 0);
    } else if (_works == null || _works!.isEmpty) {
      return Center(
        child: ItemPlaceholder.small(
          message: "No works found",
          icon: TablerIcons.book_off,
        ),
      );
    } else {
      return WorkSuggestions(works: _works!, loading: false, elevation: 0);
    }
  }

  Widget _buildSeriesSection(BuildContext context) {
    if (_seriesState == LoadingState.ERROR) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LoadError.small(onPressed: _fetchSeries)),
      );
    } else if (_seriesState == LoadingState.LOADING) {
      return SeriesSuggestions(
        series: Fillers.seriesList,
        loading: true,
        elevation: 0,
      );
    } else if (_series == null || _series!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ItemPlaceholder.small(
            message: "No series found",
            icon: TablerIcons.books_off,
          ),
        ),
      );
    } else {
      return SeriesSuggestions(series: _series!, loading: false, elevation: 0);
    }
  }

  Widget _buildBookmarksSection(BuildContext context) {
    if (_bookmarksState == LoadingState.ERROR) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LoadError.small(onPressed: _fetchBookmarks)),
      );
    } else if (_bookmarksState == LoadingState.LOADING) {
      return BookmarkSuggestions.contentWithNotes(
        bookmarks: Fillers.bookmarks,
        loading: true,
        elevation: 0,
      );
    } else if (_bookmarks == null || _bookmarks!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ItemPlaceholder.small(
            message: "No bookmarks found",
            icon: TablerIcons.bookmark_off,
          ),
        ),
      );
    } else {
      return BookmarkSuggestions.contentWithNotes(
        bookmarks: _bookmarks!,
        loading: false,
        elevation: 0,
      );
    }
  }

  Widget _buildContentSections(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Works Section
        TextHeader.large(
          title: "Works",
          icon: TablerIcons.book_2,
          onTap: () => context.navigator.pushNamed(
            AuthorWorksActivity.routeName,
            arguments: item,
          ),
          actionText:
              _worksState == LoadingState.ERROR ||
                  _worksState == LoadingState.LOADING ||
                  (_works?.isEmpty ?? true) ||
                  (_works?.length ?? 0) < 5
              ? null
              : Text("See more"),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: context.commonPadding,
          ),
          child: _buildWorksSection(context),
        ),

        SizedBox(height: 16),

        // Series Section
        TextHeader.large(
          title: "Series",
          icon: TablerIcons.list_numbers,
          onTap: () => context.navigator.pushNamed(
            AuthorSeriesActivity.routeName,
            arguments: item,
          ),
          actionText:
              _seriesState == LoadingState.ERROR ||
                  _seriesState == LoadingState.LOADING ||
                  (_series?.isEmpty ?? true) ||
                  (_series?.length ?? 0) < 5
              ? null
              : Text("See more"),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: context.commonPadding,
          ),
          child: _buildSeriesSection(context),
        ),

        SizedBox(height: 16),

        // Bookmarks Section
        TextHeader.large(
          title: "Bookmarks",
          icon: TablerIcons.bookmarks,
          onTap: () => context.navigator.pushNamed(
            AuthorBookmarksActivity.routeName,
            arguments: item,
          ),
          actionText:
              _bookmarksState == LoadingState.ERROR ||
                  _bookmarksState == LoadingState.LOADING ||
                  (_bookmarks?.isEmpty ?? true) ||
                  (_bookmarks?.length ?? 0) < 5
              ? null
              : Text("See more"),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: context.commonPadding,
          ),
          child: _buildBookmarksSection(context),
        ),
      ],
    );
  }

  Widget _buildStatCards(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          _buildStatCard(
            context,
            TablerIcons.book_2,
            item.works?.toString() ?? '0',
            "Works",
            colorScheme.primary,
          ),
          SizedBox(width: 8.0),
          _buildStatCard(
            context,
            TablerIcons.bookmarks,
            item.bookmarks?.toString() ?? '0',
            "Bookmarks",
            colorScheme.secondary,
          ),
          SizedBox(width: 8.0),
          _buildStatCard(
            context,
            TablerIcons.list_numbers,
            item.series?.toString() ?? '0',
            "Series",
            colorScheme.tertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Expanded(
      child: Skeleton.leaf(
        child: Card(
          elevation: 0,
          color: color.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Icon(icon, color: color, size: 24),
                SizedBox(height: 8),
                Text(
                  value,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(label, style: context.textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Profile section
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8.0,
          children: [
            // User avatar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Skeleton.leaf(
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: colorScheme.primaryContainer,
                  child: UserImage(context: context, user: item, size: 38),
                ),
              ),
            ),

            // User info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.isPseud ? item.pseud : item.name,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // For pseuds, show the main username
                    if (item.isPseud)
                      Text(
                        "(${item.name})",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface.withAlpha(170),
                        ),
                      ),

                    // For main profile, show join date
                    if (!item.isPseud && item.joinDate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              TablerIcons.calendar,
                              size: 16,
                              color: colorScheme.onSurface.withAlpha(150),
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Joined ${AppUtils.formatDate(context, item.joinDate!)}",
                              style: context.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface.withAlpha(150),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(item.pseud);
  }
}
