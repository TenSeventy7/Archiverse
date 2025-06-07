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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: _buildAuthorList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorList(BuildContext context) {
    // Use grid for 4+ authors, list for fewer
    return authors.length >= 4
        ? _buildAuthorsGrid(context)
        : _buildAuthorsColumnList(context);
  }

  Widget _buildAuthorsColumnList(BuildContext context) {
    return SliverList.builder(
      itemCount: authors.length,
      itemBuilder: (context, index) {
        return _buildAuthorCard(context, authors[index]);
      },
    );
  }

  Widget _buildAuthorsGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.75,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _buildAuthorCard(context, authors[index], isGrid: true);
      }, childCount: authors.length),
    );
  }

  Widget _buildAuthorCard(
    BuildContext context,
    Pseud author, {
    bool isGrid = false,
  }) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: isGrid ? 0 : 6),
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: isGrid ? 4 : 12,
          horizontal: isGrid ? 8 : 16,
        ),
        onTap: () {
          if (author.isValid) {
            Navigator.pushNamed(
              context,
              AuthorActivity.routeName,
              arguments: author,
            );
          }
        },
        leading: CircleAvatar(
          radius: isGrid ? 20 : 28,
          child: EnhancedFutureBuilder(
            future: Ao3Api().getPseud(author),
            rememberFutureResult: true,
            whenDone: (author) =>
                UserImage(context: context, user: author, size: 24),
            whenNotDone: UserImage(context: context, user: author, size: 24),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display pseudonym if different from username
            if (author.isPseud)
              Text(
                author.pseud,
                style: context.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

            // Always display username
            Text(
              author.isPseud ? "(${author.name})" : author.name,
              style: context.textTheme.titleSmall?.copyWith(
                color: author.isPseud
                    ? context.colorScheme.onSurfaceVariant
                    : null,
                fontWeight: !author.isPseud ? FontWeight.w600 : null,
                fontSize: !author.isPseud ? 18 : null,
              ),
            ),
          ],
        ),
        trailing: Icon(
          TablerIcons.chevron_right,
          color: context.colorScheme.onSurfaceVariant,
          size: 20,
        ),
      ),
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
