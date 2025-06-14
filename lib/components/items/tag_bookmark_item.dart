/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/components/items/series_item.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TagBookmarkItem extends StatelessWidget {
  final TagBookmark tagBookmark;

  const TagBookmarkItem({super.key, required this.tagBookmark});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Work/Series content section
        InkWell(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: _buildContentSection(context, colorScheme),
          ),
          onTap: () {
            if (tagBookmark.series != null) {
              Navigator.pushNamed(
                context,
                SeriesActivity.routeName,
                arguments: tagBookmark.series,
              );
            } else if (tagBookmark.work != null) {
              Navigator.pushNamed(
                context,
                WorkActivity.routeName,
                arguments: tagBookmark.work,
              );
            } else {
              SnackBar snackBar = SnackBar(
                content: Text(
                  'No series or work associated with this tag bookmark.',
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),

        Divider(
          color: colorScheme.outlineVariant.withOpacity(0.5),
          thickness: 1,
          height: 1,
        ),

        // Bookmarks section
        _buildBookmarksSection(context, colorScheme),
      ],
    );
  }

  Widget _buildBookmarksSection(BuildContext context, ColorScheme colorScheme) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final bookmark = tagBookmark.bookmarks[index];
        return ListTile(
          title: _buildSingleBookmark(context, colorScheme, bookmark),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          onTap: () => context.navigator.pushNamed(
            AuthorActivity.routeName,
            arguments: bookmark.user,
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: colorScheme.outlineVariant.withOpacity(0.3),
        thickness: 0.5,
        height: 1,
        indent: 32,
      ),
      itemCount: tagBookmark.bookmarks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildSingleBookmark(
    BuildContext context,
    ColorScheme colorScheme,
    Bookmark bookmark,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bookmark type indicator
        _buildBookmarkTypeIndicator(context, colorScheme, bookmark),

        const SizedBox(width: 12),

        // Bookmark content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info and date
              Row(
                spacing: 12.0,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Icon(
                            TablerIcons.user,
                            size: 12,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            bookmark.user.pseud,
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        TablerIcons.calendar,
                        size: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppUtils.formatDate(context, bookmark.date),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Tags if available
              if (bookmark.tags.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: bookmark.tags.take(3).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: colorScheme.outline.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        tag.name,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],

              // Notes sections
              ..._buildNotesSection(context, colorScheme, bookmark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkTypeIndicator(
    BuildContext context,
    ColorScheme colorScheme,
    Bookmark bookmark,
  ) {
    IconData icon;
    Color backgroundColor;
    Color foregroundColor;

    switch (bookmark.type) {
      case BookmarkType.PUBLIC:
        icon = TablerIcons.bookmark;
        backgroundColor = colorScheme.primaryContainer;
        foregroundColor = colorScheme.onPrimaryContainer;
        break;
      case BookmarkType.PRIVATE:
        icon = TablerIcons.bookmark_off;
        backgroundColor = colorScheme.secondaryContainer;
        foregroundColor = colorScheme.onSecondaryContainer;
        break;
      case BookmarkType.RECOMMENDATION:
        icon = TablerIcons.star;
        backgroundColor = colorScheme.tertiaryContainer;
        foregroundColor = colorScheme.onTertiaryContainer;
        break;
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 12, color: foregroundColor),
    );
  }

  List<Widget> _buildNotesSection(
    BuildContext context,
    ColorScheme colorScheme,
    Bookmark bookmark,
  ) {
    List<Widget> notesWidgets = [];

    // Public notes
    if (bookmark.notes != null && bookmark.notes!.isNotEmpty) {
      notesWidgets.addAll([
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(TablerIcons.quote, size: 12, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    "Notes",
                    style: context.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              HtmlWidget(
                bookmark.notes!,
                customWidgetBuilder: (element) {
                  return Text(element.text, style: context.textTheme.bodySmall);
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
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorScheme.tertiary.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    TablerIcons.thumb_up,
                    size: 12,
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Recommendation",
                    style: context.textTheme.labelSmall?.copyWith(
                      color: colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(bookmark.recNotes!, style: context.textTheme.bodySmall),
            ],
          ),
        ),
      ]);
    }

    return notesWidgets;
  }

  Widget _buildContentSection(BuildContext context, ColorScheme colorScheme) {
    return tagBookmark.work != null
        ? WorkItem.small(work: tagBookmark.work!)
        : tagBookmark.series != null
        ? SeriesItem.small(series: tagBookmark.series!)
        : const SizedBox();
  }
}
