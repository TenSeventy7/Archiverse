/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _PseudsListDialog extends StatelessWidget {
  final Pseud author;
  _PseudsListDialog({required this.author});
  late Future<List<Pseud>> pseuds = Ao3Api().getUserPseuds(author);

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
                    title: "Pseuds",
                    icon: TablerIcons.pencil_bolt,
                    hasPadding: false,
                  ),
                ],
              ),
            ),
          ),

          // Grid layout for pseuds
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: _buildPseudsList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPseudsList(BuildContext context) {
    return EnhancedFutureBuilder<List<Pseud>>(
      future: Ao3Api().getUserPseuds(author),
      rememberFutureResult: true,
      whenDone: (pseuds) => _buildPseudsContent(context, pseuds),
      whenNotDone: const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      whenError: (error) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: LoadError(
              onPressed: () {
                pseuds = Ao3Api().getUserPseuds(author);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPseudsContent(BuildContext context, List<Pseud> pseuds) {
    if (pseuds.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Icon(
                  TablerIcons.user_question,
                  size: 48,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  'No pseuds found',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Use grid for 4+ pseuds, list for fewer
    return _buildPseudsColumnList(context, pseuds);
  }

  Widget _buildPseudsColumnList(BuildContext context, List<Pseud> pseuds) {
    return SliverList.builder(
      itemCount: pseuds.length,
      itemBuilder: (context, index) {
        return _buildPseudCard(context, pseuds[index]);
      },
    );
  }

  Widget _buildPseudCard(
    BuildContext context,
    Pseud pseud, {
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
          if (pseud.isValid) {
            Navigator.pushNamed(
              context,
              AuthorActivity.routeName,
              arguments: pseud,
            );
          }
        },
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: context.colorScheme.primaryContainer,
          child: EnhancedFutureBuilder(
            future: Ao3Api().getPseud(pseud),
            rememberFutureResult: true,
            whenDone: (author) =>
                UserImage(context: context, user: author, size: 24),
            whenNotDone: UserImage(context: context, user: pseud, size: 24),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pseud.pseud,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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

class PseudsListDialog {
  static void showSheet(BuildContext context, {required Pseud author}) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.surface,
      builder: (BuildContext context) => _PseudsListDialog(author: author),
    );
  }
}
