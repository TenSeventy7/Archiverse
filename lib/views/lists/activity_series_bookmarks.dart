import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/bookmark_item.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SeriesBookmarksActivity extends CommonListActivity<Bookmark> {
  const SeriesBookmarksActivity({super.key, required this.series});
  static const String routeName = "/series/bookmarks";
  final Series series;

  @override
  SeriesBookmarksActivityState createState() => SeriesBookmarksActivityState();
}

class SeriesBookmarksActivityState extends CommonListActivityState<Bookmark> {
  Series get series => (widget as SeriesBookmarksActivity).series;

  @override
  Future<List<Bookmark>> fetchItems(int page) async {
    return await Ao3Api().getBookmarksFromSeries(series, page: page - 1);
  }

  @override
  Widget buildItemWidget(BuildContext context, Bookmark item, int index) {
    return BookmarkItem.bookmarkeeOnly(bookmark: item);
  }

  @override
  void onItemTap(Bookmark item) {
    context.navigator.pushNamed(AuthorActivity.routeName, arguments: item.user);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(series.title, maxLines: 1, overflow: TextOverflow.ellipsis);
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Works count subtitle
        Text(
          "Bookmarks for",
          style: context.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 8),

        // Work title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              series.title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // For pseuds, show the main username
            Text(
              AppUtils.formatAuthorList(series.authors),
              style: context.textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(170),
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        // Action row
        ActionChip(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SeriesActivity.routeName,
              arguments: series,
            );
          },
          label: Text("View Series"),
          avatar: Icon(TablerIcons.chevron_right, size: 18),
        ),
      ],
    );
  }
}
