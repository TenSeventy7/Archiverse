/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _ChaptersListDialog extends StatelessWidget {
  final List<Chapter> chapters;
  final int currentChapterIndex;
  final Function(int) onChapterSelected;

  const _ChaptersListDialog({
    required this.chapters,
    required this.currentChapterIndex,
    required this.onChapterSelected,
  });

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
                  TextHeader.medium(
                    title: "Chapters",
                    icon: TablerIcons.list,
                    hasPadding: false,
                  ),
                ],
              ),
            ),
          ),

          // Chapters list
          _buildChaptersList(context),
        ],
      ),
    );
  }

  Widget _buildChaptersList(BuildContext context) {
    return SliverList.separated(
      itemCount: chapters.length,
      itemBuilder: _buildListTile,
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }

  ListTile _buildListTile(BuildContext context, int index) {
    final chapter = chapters[index];
    final isCurrentChapter = index == currentChapterIndex;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        height: 32,
        width: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(isCurrentChapter ? 32 : 8),
          color: isCurrentChapter
              ? context.colorScheme.tertiary
              : context.colorScheme.secondaryContainer,
        ),
        child: Text(
          '${chapter.chapter}',
          style: context.textTheme.titleMedium?.copyWith(
            color: isCurrentChapter
                ? context.colorScheme.onTertiary
                : context.colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      title: Text(
        chapter.title.isNotEmpty ? chapter.title : 'Chapter ${chapter.chapter}',
        style: context.textTheme.titleMedium,
      ),
      subtitle: chapter.publishDate != null
          ? Text(
              AppUtils.formatDate(context, chapter.publishDate!),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: isCurrentChapter
          ? Icon(
              TablerIcons.check,
              color: context.colorScheme.primary,
              size: 20,
            )
          : Icon(
              TablerIcons.chevron_right,
              color: context.colorScheme.onSurfaceVariant,
              size: 20,
            ),
      onTap: () {
        Navigator.pop(context);
        onChapterSelected(index);
      },
    );
  }
}

class ChaptersListDialog {
  static void showSheet(
    BuildContext context, {
    required List<Chapter> chapters,
    required int currentChapterIndex,
    required Function(int) onChapterSelected,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.surface,
      builder: (BuildContext context) => _ChaptersListDialog(
        chapters: chapters,
        currentChapterIndex: currentChapterIndex,
        onChapterSelected: onChapterSelected,
      ),
    );
  }
}
