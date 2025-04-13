import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class StorageInfoCard extends StatelessWidget {
  final double usedPercentage;
  final String usedSpace;
  final String totalSpace;

  const StorageInfoCard({
    super.key,
    required this.usedPercentage,
    required this.usedSpace,
    required this.totalSpace,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(TablerIcons.device_sd_card, color: colorScheme.primary),
                const SizedBox(width: 12),
                Text("Storage", style: context.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),

            // Progress bar
            LinearProgressIndicator(
              value: usedPercentage,
              borderRadius: BorderRadius.circular(4),
              minHeight: 8,
            ),

            const SizedBox(height: 12),

            // Storage details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${(usedPercentage * 100).toInt()}% used",
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  "$usedSpace of $totalSpace",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
