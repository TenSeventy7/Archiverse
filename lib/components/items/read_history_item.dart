import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:relative_time/relative_time.dart';

class ReadHistoryItem extends StatelessWidget {
  const ReadHistoryItem({super.key, required this.history});
  final ReadHistory history;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Column(
      children: [
        if (history.chapter != null) ...[
          InkWell(
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: _buildChapterContent(context),
            ),
            onTap: () {
              context.navigator.pushNamed(
                ReaderActivity.routeName,
                arguments: {'work': history.work, 'chapter': history.chapter},
              );
            },
          ),

          Divider(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            thickness: 1,
            height: 1,
          ),
        ],

        // Work/Series content section
        InkWell(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: WorkItem.small(work: history.work),
          ),
          onLongPress: () =>
              WorkOptionsDialog.showSheet(context, work: history.work),
          onTap: () {
            context.navigator.pushNamed(
              WorkActivity.routeName,
              arguments: history.work,
            );
          },
        ),
      ],
    );
  }

  Widget _buildChapterContent(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        _buildChapterHeader(context),
        ListTile(
          contentPadding: EdgeInsets.zero,
          minTileHeight: 0.0,
          title: Text("Resume from", style: context.textTheme.bodySmall),
          subtitle: Text(
            history.chapter!.title,
            style: context.textTheme.titleMedium,
          ),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              history.chapter!.chapter.toString(),
              style: context.textTheme.titleMedium
                  ?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  )
                  .apply(fontSizeDelta: 1.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChapterHeader(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        Icon(
          TablerIcons.clock,
          size: 16.0,
          color: context.colorScheme.onSurfaceVariant,
        ),
        Text(
          AppUtils.formatDate(
            context,
            history.timestamp,
            timeUnits: const [
              TimeUnit.year,
              TimeUnit.month,
              TimeUnit.week,
              TimeUnit.day,
              TimeUnit.hour,
              TimeUnit.minute,
            ],
          ),
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
