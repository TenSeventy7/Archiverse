import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/bookmark_item.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';

class BookmarkCard extends BaseCard<Bookmark> {
  const BookmarkCard({
    super.key,
    required Bookmark bookmark,
    super.elevation,
    this.displayMode = BookmarkItemDisplayMode.full,
  }) : super(item: bookmark);

  const BookmarkCard.bookmarkeeOnly({
    super.key,
    required Bookmark bookmark,
    super.elevation,
    this.displayMode = BookmarkItemDisplayMode.bookmarkeeOnly,
  }) : super(item: bookmark);

  const BookmarkCard.contentOnly({
    super.key,
    required Bookmark bookmark,
    super.elevation,
    this.displayMode = BookmarkItemDisplayMode.contentOnly,
  }) : super(item: bookmark);

  final BookmarkItemDisplayMode displayMode;

  @override
  Widget buildContent(BuildContext context) {
    return BookmarkItem(bookmark: item, displayMode: displayMode);
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
        content: Text('No series or work associated with this bookmark.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
