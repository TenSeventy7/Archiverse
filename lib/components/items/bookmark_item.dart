/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/components/items/series_item.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum BookmarkItemDisplayMode {
  /// Show both bookmarkee info and work/series content
  full,

  /// Show only the bookmarkee info (who bookmarked, when, notes)
  bookmarkeeOnly,

  /// Show only the work/series content with bookmark type indicator
  contentOnly,
}

class BookmarkItem extends StatelessWidget {
  final Bookmark bookmark;
  final BookmarkItemDisplayMode displayMode;

  const BookmarkItem({
    super.key,
    required this.bookmark,
    this.displayMode = BookmarkItemDisplayMode.full,
  });

  const BookmarkItem.bookmarkeeOnly({super.key, required this.bookmark})
    : displayMode = BookmarkItemDisplayMode.bookmarkeeOnly;

  const BookmarkItem.contentOnly({super.key, required this.bookmark})
    : displayMode = BookmarkItemDisplayMode.contentOnly;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show bookmarkee info unless content-only mode
        if (displayMode != BookmarkItemDisplayMode.contentOnly) ...[
          _buildBookmarkeeSection(context, colorScheme),

          // Divider only shown in full mode
          if (displayMode == BookmarkItemDisplayMode.full) ...[
            const SizedBox(height: 18),
            Divider(
              color: colorScheme.outlineVariant.withOpacity(0.5),
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 16),
          ],
        ],

        // Show work/series content unless bookmarkee-only mode
        if (displayMode != BookmarkItemDisplayMode.bookmarkeeOnly) ...[
          _buildContentSection(context, colorScheme),
        ],
      ],
    );
  }

  Widget _buildBookmarkeeHeader(BuildContext context, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bookmark type chip
        _buildBookmarkTypeChip(context, colorScheme),

        // Date of bookmark
        Row(
          children: [
            Icon(
              TablerIcons.calendar,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              AppUtils.formatDate(context, bookmark.date),
              style: context.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookmarkeeSection(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row with bookmark type and date
        _buildBookmarkeeHeader(context, colorScheme),

        const SizedBox(height: 18),

        // User info
        Row(
          spacing: 12,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                TablerIcons.user,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookmark.user.pseud,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Bookmarked this ${bookmark.isWorkBookmark ? 'work' : 'series'}",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Tags if available
        if (bookmark.tags.isNotEmpty) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: bookmark.tags.take(5).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  tag.name,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              );
            }).toList(),
          ),
        ],

        // Notes sections
        ..._buildNotesSection(context, colorScheme),
      ],
    );
  }

  Widget _buildBookmarkTypeChip(BuildContext context, ColorScheme colorScheme) {
    IconData icon;
    String label;
    Color backgroundColor;
    Color foregroundColor;

    switch (bookmark.type) {
      case BookmarkType.PUBLIC:
        icon = TablerIcons.bookmark;
        label = "Public Bookmark";
        backgroundColor = colorScheme.primaryContainer;
        foregroundColor = colorScheme.onPrimaryContainer;
        break;
      case BookmarkType.PRIVATE:
        icon = TablerIcons.bookmark_off;
        label = "Private Bookmark";
        backgroundColor = colorScheme.secondaryContainer;
        foregroundColor = colorScheme.onSecondaryContainer;
        break;
      case BookmarkType.RECOMMENDATION:
        icon = TablerIcons.star;
        label = "Recommendation";
        backgroundColor = colorScheme.tertiaryContainer;
        foregroundColor = colorScheme.onTertiaryContainer;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: foregroundColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNotesSection(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    List<Widget> notesWidgets = [];

    // Public notes
    if (bookmark.notes != null && bookmark.notes!.isNotEmpty) {
      notesWidgets.addAll([
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(TablerIcons.quote, size: 16, color: colorScheme.primary),
                  const SizedBox(width: 6),
                  Text(
                    "Bookmark Notes",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              HtmlWidget(
                bookmark.notes!,
                customWidgetBuilder: (element) {
                  return Text(
                    element.text,
                    style: context.textTheme.bodyMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ]);
    }

    // Recommendation notes
    if (bookmark.type == BookmarkType.RECOMMENDATION &&
        bookmark.recNotes != null &&
        bookmark.recNotes!.isNotEmpty) {
      notesWidgets.addAll([
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorScheme.tertiary.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    TablerIcons.thumb_up,
                    size: 16,
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Recommendation",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(bookmark.recNotes!, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ]);
    }

    return notesWidgets;
  }

  Widget _buildContentSection(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        // Show bookmark type indicator in content-only mode
        if (displayMode == BookmarkItemDisplayMode.contentOnly) ...[
          _buildBookmarkeeHeader(context, colorScheme),
          const SizedBox(height: 16),
        ],

        // Embedded work or series
        Skeleton.unite(
          child: bookmark.isWorkBookmark
              ? WorkItem.small(work: bookmark.work!)
              : bookmark.isSeriesBookmark
              ? SeriesItem.small(series: bookmark.series!)
              : SizedBox(),
        ),
      ],
    );
  }
}
