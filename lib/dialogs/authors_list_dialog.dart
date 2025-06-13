/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _AuthorsListDialog extends StatelessWidget {
  final List<Pseud> authors;
  const _AuthorsListDialog({required this.authors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          // Header
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeader.large(
                    title: "Authors",
                    icon: TablerIcons.users,
                    hasPadding: false,
                  ),
                ],
              ),
            ),
          ),

          // Grid layout for authors
          _buildAuthorList(context),
        ],
      ),
    );
  }

  Widget _buildAuthorList(BuildContext context) {
    return SliverList.separated(
      itemCount: authors.length,
      itemBuilder: _buildListTile,
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }

  ListTile _buildListTile(BuildContext context, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 20,
        child: EnhancedFutureBuilder(
          future: Ao3Api().getPseud(authors[index]),
          rememberFutureResult: true,
          whenDone: (author) =>
              UserImage(context: context, user: author, size: 20),
          whenNotDone: UserImage(
            context: context,
            user: authors[index],
            size: 20,
          ),
        ),
      ),
      title: Text(
        authors[index].isPseud ? authors[index].pseud : authors[index].name,
        style: context.textTheme.titleMedium,
      ),
      subtitle: authors[index].isPseud
          ? Text("(${authors[index].name})", style: context.textTheme.bodySmall)
          : null,
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.colorScheme.onSurfaceVariant,
        size: 20,
      ),
      onTap: () {
        if (authors[index].isValid) {
          Navigator.pushNamed(
            context,
            AuthorActivity.routeName,
            arguments: authors[index],
          );
        }
      },
    );
  }
}

class AuthorsListDialog {
  static void showSheet(BuildContext context, {required List<Pseud> authors}) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.surface,
      builder: (BuildContext context) => _AuthorsListDialog(authors: authors),
    );
  }
}
