
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

class SeriesItem extends StatelessWidget {
  final Series series;
  final bool small;
  const SeriesItem({super.key, required this.series}) : small = false;
  const SeriesItem.small({super.key, required this.series}) : small = true;

  @override
  Widget build(BuildContext context) {
    Future<Series>? future;
    if (small && series.authors.isEmpty) {
      future = Ao3Api().getSeries(series);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4.0),
        _buildLastUpdatedRow(context, future),
        const SizedBox(height: 4.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Text(series.title),
          subtitle: _buildAuthors(context, future),
          titleTextStyle: context.textTheme.titleMedium?.apply(
            fontSizeDelta: 4,
          ),
          subtitleTextStyle: context.textTheme.labelLarge,
        ),
        if (!small) ...[
          ..._buildSummary(context),
        ],
        const SizedBox(height: 8.0),
        _buildSeriesStatistics(future),
      ],
    );
  }

  _buildAuthors(BuildContext context, Future<Series>? future) {
    if (series.authors.isNotEmpty) {
      return Text(AppUtils.formatAuthorList(series.authors));
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) => Text(AppUtils.formatAuthorList(series.authors)),
        whenNotDone: const Skeletonizer(
          enabled: true,
          child: Text("A Very Very Long Text"),
        ),
      );
    }

    return const SizedBox();
  }

  _buildLastUpdatedRow(BuildContext context, Future<Series>? future) {
    if (series.updateDate != null || series.publishDate != null) {
      return _buildLastUpdatedWidget(context, series);
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) => _buildLastUpdatedWidget(context, series),
        whenNotDone: Skeletonizer(
          enabled: true,
          child: _buildLastUpdatedWidget(context, Fillers.series),
        ),
      );
    }

    return const SizedBox();
  }

  _buildLastUpdatedWidget(BuildContext context, Series series) {
    return Row(
      children: [
        const Icon(TablerIcons.clock, size: 16.0),
        const SizedBox(width: 8.0),
        Text(
          AppUtils.formatSeriesLastUpdated(context, series),
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  _buildSummary(BuildContext context) {
    if (series.summary.isEmpty) return const [SizedBox()];
    return [
      const SizedBox(height: 4.0),
      HtmlWidget(
        AppUtils.getFirstParagraph(series.summary),
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
    ];
  }

  _buildSeriesStatistics(Future<Series>? future) {
    if (series != null) {
      return _buildStatisticsWidget(series);
    } else if (future != null) {
      return EnhancedFutureBuilder(
        future: future,
        rememberFutureResult: false,
        whenDone: (series) => _buildStatisticsWidget(series),
        whenNotDone: Skeletonizer(
          enabled: true,
          child: _buildStatisticsWidget(Fillers.series),
        ),
      );
    }

    return const SizedBox();
  }

  _buildStatisticsWidget(Series series) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CompactTextIcon(
            icon: TablerIcons.writing, statistic: series.works ?? 0),
        const SizedBox(width: 12.0),
        CompactTextIcon(
            icon: TablerIcons.align_left, statistic: series.words ?? 0),
        const SizedBox(width: 12.0),
        CompactTextIcon(
            icon: TablerIcons.bookmark, statistic: series.bookmarks ?? 0),
        if (series.finished == true) ...[
          const SizedBox(width: 12.0),
          CompactTextIcon.text(
            icon: TablerIcons.check,
            text: "Completed",
          ),
        ],
      ],
    );
  }
}
