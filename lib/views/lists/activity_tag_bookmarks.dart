import 'dart:isolate';

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/tag_bookmark_item.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TagBookmarksActivity extends CommonListActivity<TagBookmark> {
  const TagBookmarksActivity({super.key, required this.tag});
  static const String routeName = "/tag/bookmarks";
  final Tag tag;

  @override
  TagBookmarksActivityState createState() => TagBookmarksActivityState();
}

class TagBookmarksActivityState extends CommonListActivityState<TagBookmark> {
  Tag get tag => (widget as TagBookmarksActivity).tag;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  Future<List<TagBookmark>> fetchItems(int page) async {
    return await Ao3Api().getBookmarksFromTag(tag, page: page - 1);
  }

  @override
  bool get isSelectable => false;

  @override
  Widget buildItemWidget(BuildContext context, TagBookmark item, int index) {
    return TagBookmarkItem(tagBookmark: item);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(tag.name, maxLines: 1, overflow: TextOverflow.ellipsis);
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
          "Bookmarks tagged with",
          style: context.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 8),

        // Tag name
        Text(
          tag.name,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 8),
        // Tag type and action button row
        Row(
          children: [
            // Tag type chip
            Chip(
              avatar: Icon(
                _getTagTypeIcon(tag.type),
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              label: Text(
                tag.type.toString(),
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: colorScheme.primaryContainer,
              side: BorderSide.none,
            ),

            Spacer(),

            // View tag details button
            ActionChip(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TagActivity.routeName,
                  arguments: tag,
                );
              },
              label: Text("View Tag"),
              avatar: Icon(TablerIcons.chevron_right, size: 18),
            ),
          ],
        ),
      ],
    );
  }

  IconData _getTagTypeIcon(TagType type) {
    switch (type) {
      case TagType.FANDOM:
        return TablerIcons.book;
      case TagType.CHARACTER:
        return TablerIcons.user;
      case TagType.RELATIONSHIP:
        return TablerIcons.heart;
      case TagType.FREEFORM:
        return TablerIcons.tag;
    }
  }
}
