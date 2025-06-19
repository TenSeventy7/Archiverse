import 'package:archiverse/api.dart';
import 'package:archiverse/components/items/bookmark_item.dart';
import 'package:archiverse/components/rating_badges.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class WorkBookmarksActivity extends CommonListActivity<Bookmark> {
  const WorkBookmarksActivity({super.key, required this.work});
  static const String routeName = "/work/bookmarks";
  final Work work;

  @override
  WorkBookmarksActivityState createState() => WorkBookmarksActivityState();
}

class WorkBookmarksActivityState extends CommonListActivityState<Bookmark> {
  Work get work => (widget as WorkBookmarksActivity).work;

  @override
  Future<List<Bookmark>> fetchItems(int page) async {
    return await AppApi().getBookmarksFromWork(work, page: page - 1);
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
    return Text(work.title, maxLines: 1, overflow: TextOverflow.ellipsis);
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
              work.title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // For pseuds, show the main username
            Text(
              AppUtils.formatAuthorList(work.authors),
              style: context.textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(170),
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        // Rating and action row
        Row(
          children: [
            // Rating badges
            RatingBadges(work: work, size: 30),

            Spacer(),

            // View tag details button
            ActionChip(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  WorkActivity.routeName,
                  arguments: work,
                );
              },
              label: Text("View Work"),
              avatar: Icon(TablerIcons.chevron_right, size: 18),
            ),
          ],
        ),
      ],
    );
  }
}
