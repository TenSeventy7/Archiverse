import 'package:archiverse/components/storage_usage_indicator.dart';
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
    return Card.outlined(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StorageUsageIndicator(
          usedSpace: 8,
          totalSpace: 99,
          icon: TablerIcons.device_sd_card,
        ),
      ),
    );
  }
}
