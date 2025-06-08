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
         contentPadding: const EdgeInsets.symmetric(
           horizontal: 16.0,
           vertical: 16.0,
         ),
       );

  @override
  Widget buildContent(BuildContext context) {
    return TagBookmarkItem(tagBookmark: item);
  }

  @override
  void onTap(BuildContext context) {
    if (item.series != null) {
      Navigator.pushNamed(
        context,
        SeriesActivity.routeName,
        arguments: item.series,
      );
    } else if (item.work != null) {
      Navigator.pushNamed(
        context,
        WorkActivity.routeName,
        arguments: item.work,
      );
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('No series or work associated with this tag bookmark.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
