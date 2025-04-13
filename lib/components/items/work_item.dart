import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/components/rating_badges.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';

class WorkItem extends StatelessWidget {
  final Work work;
  final bool small;
  const WorkItem({super.key, required this.work}) : small = false;
  const WorkItem.small({super.key, required this.work}) : small = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with last updated + rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildLastUpdatedRow(context), RatingBadges(work: work)],
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
                    work.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppUtils.formatAuthorList(work.authors),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Options button
            IconButton.filledTonal(
              visualDensity: VisualDensity.compact,
              onPressed: () => WorkOptionsDialog.showSheet(context, work: work),
              icon: Icon(
                TablerIcons.dots_vertical,
                size: 18.0,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),

        // Fandoms and series info
        if (!small) ...[
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              AppUtils.formatFandomsList(work.fandoms),
              style: context.textTheme.labelMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ..._buildSeriesInfo(context),

          const SizedBox(height: 12.0),

          // Summary section
          HtmlWidget(
            _getFirstParagraph(work.summary),
            customWidgetBuilder: (element) {
              return Text(
                element.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium,
              );
            },
          ),
        ],

        // Stats row
        const SizedBox(height: 14.0),
        _buildWorkStatistics(context),
      ],
    );
  }

  Row _buildLastUpdatedRow(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          TablerIcons.clock,
          size: 16.0,
          color: colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 8.0),
        Text(
          AppUtils.formatWorkLastUpdated(context, work),
          style: context.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSeriesInfo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    List<Widget> series = [];

    for (SeriesWork work in work.series) {
      series.add(const SizedBox(height: 10.0));
      series.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer.withOpacity(0.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                TablerIcons.books,
                size: 14,
                color: colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: 6),
              Text(
                "Part ${work.part} of the ${work.series.title} series",
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return series;
  }

  Row _buildWorkStatistics(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12.0,
          children: [
            CompactTextIcon(icon: TablerIcons.book, statistic: work.chapters),
            CompactTextIcon(
              icon: TablerIcons.align_left,
              statistic: work.words,
            ),
            CompactTextIcon(
              icon: TablerIcons.message,
              statistic: work.comments,
            ),
            CompactTextIcon(icon: TablerIcons.heart, statistic: work.kudos),
          ],
        ),

        Row(
          spacing: 8.0,
          children: [
            if (work.finished == true)
              CompactTextIcon.text(
                icon: TablerIcons.check,
                text: context.strings.work_complete,
              ),
            if (work.requiresAuth) ...[
              Icon(TablerIcons.lock, size: 14.0, color: colorScheme.error),
            ],
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
