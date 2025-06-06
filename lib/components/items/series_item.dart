/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/utils.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/models/series.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:html/parser.dart';

class SeriesItem extends StatelessWidget {
  final Series series;
  final bool small;
  const SeriesItem({super.key, required this.series}) : small = false;
  const SeriesItem.small({super.key, required this.series}) : small = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Future<Series>? future;
    if (small && series.authors.isEmpty) {
      future = Ao3Api().getSeries(series);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with last updated
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLastUpdatedRow(context, future),
            // Series indicator badge
            if (!small) ...[
              Skeleton.unite(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        TablerIcons.books,
                        size: 12,
                        color: colorScheme.onTertiaryContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Series",
                        style: context.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 14.0),

        // Title and author section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Title + Author
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    series.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  _buildAuthors(context, future, colorScheme),
                ],
              ),
            ),

            // Series options button (placeholder for future functionality)
            if (small) ...[
              Skeleton.leaf(
                child: IconButton.filledTonal(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    // TODO: Implement series options dialog
                  },
                  icon: Icon(
                    TablerIcons.dots_vertical,
                    size: 18.0,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ],
        ),

        if (!small) ...[
          const SizedBox(height: 12.0),

          // Summary section
          if (series.summary.isNotEmpty) ...[
            HtmlWidget(
              _getFirstParagraph(series.summary),
              customWidgetBuilder: (element) {
                return Text(
                  element.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyMedium,
                );
              },
            ),
            const SizedBox(height: 4.0),
          ],

          // Notes section if available
          if (series.notes != null && series.notes!.isNotEmpty) ...[
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    TablerIcons.note,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      series.notes!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],

        // Stats row
        const SizedBox(height: 14.0),
        _buildSeriesStatistics(context, future),
      ],
    );
  }

  Widget _buildLastUpdatedRow(BuildContext context, Future<Series>? future) {
    final colorScheme = Theme.of(context).colorScheme;

    if (series.updateDate != null || series.publishDate != null) {
      return _buildLastUpdatedWidget(context, series, colorScheme);
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) =>
            _buildLastUpdatedWidget(context, series, colorScheme),
        whenNotDone: Skeletonizer(
          enabled: true,
          child: _buildLastUpdatedWidget(context, Fillers.series, colorScheme),
        ),
      );
    }

    return const SizedBox();
  }

  Widget _buildLastUpdatedWidget(
    BuildContext context,
    Series series,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Icon(
          TablerIcons.clock,
          size: 16.0,
          color: colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 8.0),
        Text(
          AppUtils.formatSeriesLastUpdated(context, series),
          style: context.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthors(
    BuildContext context,
    Future<Series>? future,
    ColorScheme colorScheme,
  ) {
    if (series.authors.isNotEmpty) {
      return Text(
        AppUtils.formatAuthorList(series.authors),
        style: context.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      );
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) => Text(
          AppUtils.formatAuthorList(series.authors),
          style: context.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        whenNotDone: const Skeletonizer(
          enabled: true,
          child: Text("A Very Very Long Text"),
        ),
      );
    }

    return const SizedBox();
  }

  Widget _buildSeriesStatistics(BuildContext context, Future<Series>? future) {
    final colorScheme = Theme.of(context).colorScheme;

    if (series.updateDate != null ||
        series.publishDate != null ||
        series.authors.isNotEmpty) {
      return _buildStatisticsWidget(context, series, colorScheme);
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) =>
            _buildStatisticsWidget(context, series, colorScheme),
        whenNotDone: Skeletonizer(
          enabled: true,
          child: _buildStatisticsWidget(context, Fillers.series, colorScheme),
        ),
      );
    }

    return _buildStatisticsWidget(context, series, colorScheme);
  }

  Widget _buildStatisticsWidget(
    BuildContext context,
    Series series,
    ColorScheme colorScheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12.0,
          children: [
            CompactTextIcon(icon: TablerIcons.writing, statistic: series.works),
            CompactTextIcon(
              icon: TablerIcons.align_left,
              statistic: series.words,
            ),
            CompactTextIcon(
              icon: TablerIcons.bookmark,
              statistic: series.bookmarks,
            ),
          ],
        ),

        Row(
          spacing: 8.0,
          children: [
            if (series.finished == true)
              CompactTextIcon.text(icon: TablerIcons.check, text: "Complete"),
          ],
        ),
      ],
    );
  }

  String _getFirstParagraph(String str) {
    var document = parse(str);
    var firstP = document.querySelector('p');
    return firstP != null ? firstP.outerHtml : '';
  }
}
