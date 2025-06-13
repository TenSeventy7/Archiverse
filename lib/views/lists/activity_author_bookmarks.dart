import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/bookmark_item.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AuthorBookmarksActivity extends CommonListActivity<Bookmark> {
  const AuthorBookmarksActivity({super.key, required this.author});
  static const String routeName = "/author/bookmarks";
  final Pseud author;

  @override
  AuthorBookmarksActivityState createState() => AuthorBookmarksActivityState();
}

class AuthorBookmarksActivityState extends CommonListActivityState<Bookmark> {
  Pseud get author => (widget as AuthorBookmarksActivity).author;

  @override
  Future<List<Bookmark>> fetchItems(int page) async {
    return await Ao3Api().getBookmarksByUser(author, page: page - 1);
  }

  @override
  Widget buildItemWidget(BuildContext context, Bookmark item, int index) {
    return BookmarkItem.contentWithNotes(bookmark: item);
  }

  @override
  void onItemTap(Bookmark item) {
    if (item.work != null) {
      Navigator.pushNamed(
        context,
        WorkActivity.routeName,
        arguments: item.work,
      );
    } else if (item.series != null) {
      Navigator.pushNamed(
        context,
        SeriesActivity.routeName,
        arguments: item.series,
      );
    } else {
      // Handle case where neither work nor series is available
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No work or series associated with this bookmark."),
        ),
      );
    }
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(author.name, maxLines: 1, overflow: TextOverflow.ellipsis);
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
          "Bookmarks by",
          style: context.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 16.0,
          children: [
            // User avatar
            CircleAvatar(
              maxRadius: 32.0,
              backgroundColor: context.colorScheme.primaryContainer,
              child: EnhancedFutureBuilder(
                future: Ao3Api().getPseud(author),
                rememberFutureResult: false,
                whenDone: (author) =>
                    UserImage(context: context, user: author, size: 32),
                whenNotDone: UserImage(
                  context: context,
                  user: author,
                  size: 32,
                ),
              ),
            ),

            // User info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      author.isPseud ? author.pseud : author.name,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // For pseuds, show the main username
                    if (author.isPseud)
                      Text(
                        "(${author.name})",
                        style: context.textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface.withAlpha(170),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12),

        ActionChip(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AuthorActivity.routeName,
              arguments: author,
            );
          },
          label: Text("View pseud"),
          avatar: Icon(TablerIcons.chevron_right, size: 18),
        ),
      ],
    );
  }
}
