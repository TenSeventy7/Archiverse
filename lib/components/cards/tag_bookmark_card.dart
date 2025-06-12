import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/tag_bookmark_item.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:archiverse/views/activity_tag.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';

class TagBookmarkCard extends BaseCard<TagBookmark> {
  const TagBookmarkCard({
    super.key,
    required TagBookmark tagBookmark,
    super.elevation,
  }) : super(
         item: tagBookmark,
         contentPadding: EdgeInsets.zero,
         isSelectable: false,
       );

  @override
  Widget buildContent(BuildContext context) {
    return TagBookmarkItem(tagBookmark: item);
  }
}
