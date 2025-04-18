/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BookmarksCard extends StatelessWidget {
  const BookmarksCard({
    super.key,
    required List<Bookmark>? bookmarks,
    required this.context,
  }) : _bookmarks = bookmarks;

  final List<Bookmark>? _bookmarks;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (int i = 0; i < min(_bookmarks!.length, 3); i++)
            _buildBookmarkItem(context, _bookmarks![i]),
        ],
      ),
    );
  }

  Widget _buildBookmarkItem(BuildContext context, Bookmark bookmark) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        radius: 18,
        child: UserImage(context: context, user: bookmark.user, size: 18.0),
      ),
      title: Text(bookmark.user.name),
      subtitle: Text(
        AppUtils.formatDate(context, bookmark.date),
        style: context.textTheme.labelSmall,
      ),
      trailing: Icon(
        bookmark.type == BookmarkType.RECOMMENDATION
            ? TablerIcons.star
            : bookmark.type == BookmarkType.PRIVATE
            ? TablerIcons.lock
            : TablerIcons.bookmark,
        size: 20,
        color:
            bookmark.type == BookmarkType.RECOMMENDATION
                ? Colors.amber
                : Theme.of(context).colorScheme.primary,
      ),
      onTap: () {
        // TODO: Navigate to user profile
      },
    );
  }
}
