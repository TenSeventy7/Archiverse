import 'dart:math';

import 'package:flutter/material.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class StorageUsageIndicator extends StatelessWidget {
  final double usedSpace; // in bytes
  final double totalSpace; // in bytes
  final String label;
  final IconData? icon;
  final bool showDetails;

  const StorageUsageIndicator({
    super.key,
    required this.usedSpace,
    required this.totalSpace,
    this.label = "Storage Used",
    this.icon,
    this.showDetails = true,
  });

  double get usagePercentage => (usedSpace / totalSpace).clamp(0.0, 1.0);

  String _formatBytes(double bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: context.colorScheme.onSurfaceVariant),
                const SizedBox(width: 12),
              ],
              Text(
                label,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          LinearProgressIndicator(
            value: usagePercentage,
            minHeight: 16,
            borderRadius: BorderRadius.circular(24),
            backgroundColor: context.colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
              usagePercentage > 0.9
                  ? Colors.redAccent
                  : usagePercentage > 0.7
                  ? Colors.orangeAccent
                  : context.colorScheme.primary,
            ),
          ),

          if (showDetails) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${(usagePercentage * 100).toStringAsFixed(1)}% used",
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  "${_formatBytes(usedSpace, 1)} of ${_formatBytes(totalSpace, 1)}",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
