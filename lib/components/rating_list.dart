/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/rating_utils.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RatingList extends StatelessWidget {
  final Work work;
  const RatingList({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        // Age Rating
        _buildRatingItem(
          context,
          RatingUtils.getAgeRatingInfo(context, work.rating),
          useIcon: false,
        ),

        // Relationship Types
        for (var relation in work.relationship)
          _buildRatingItem(
            context,
            RatingUtils.getRelationshipInfo(context, relation),
          ),

        // Content Warnings
        for (var warning in work.warnings)
          _buildRatingItem(
            context,
            RatingUtils.getWarningInfo(context, warning),
          ),
      ],
    );
  }

  Widget _buildRatingItem(
    BuildContext context,
    RatingInfo info, {
    bool useIcon = true,
  }) {
    return Card(
      elevation: 0,
      color: info.backgroundColor.withAlpha(26),
      margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: info.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              useIcon
                  ? Icon(info.icon, color: info.foregroundColor, size: 28)
                  : Center(
                    child: Text(
                      info.symbol,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: info.foregroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
        ),
        title: Text(
          info.label,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(info.description, style: context.textTheme.bodySmall),
      ),
    );
  }
}
