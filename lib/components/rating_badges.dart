import 'package:archiverse/components/rating_utils.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';

class RatingBadges extends StatelessWidget {
  final Work work;
  final double size;

  const RatingBadges({super.key, required this.work, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Age Rating Badge
        _buildRatingBadge(
          RatingUtils.getAgeRatingInfo(context, work.rating),
          showIcon: false,
        ),
        const SizedBox(width: 6),

        // Relationship Badge (take first if multiple exist)
        if (work.relationship.isNotEmpty)
          _buildRatingBadge(
            RatingUtils.getRelationshipInfo(context, work.relationship.first),
            showText: false,
          ),
        if (work.relationship.isNotEmpty) const SizedBox(width: 6),

        // Warning Badge (take first if multiple exist)
        if (work.warnings.isNotEmpty)
          _buildRatingBadge(
            RatingUtils.getWarningInfo(context, work.warnings.first),
            showText: false,
          ),
      ],
    );
  }

  Widget _buildRatingBadge(
    RatingInfo info, {
    bool showIcon = true,
    bool showText = true,
  }) {
    return Tooltip(
      message: "${info.label}: ${info.description}",
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: info.backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child:
            showIcon
                ? Icon(info.icon, size: size * 0.6, color: info.foregroundColor)
                : showText
                ? Text(
                  info.symbol,
                  style: TextStyle(
                    color: info.foregroundColor,
                    fontSize: size * 0.6,
                    fontWeight: FontWeight.w600,
                  ),
                )
                : Icon(
                  info.icon,
                  size: size * 0.6,
                  color: info.foregroundColor,
                ),
      ),
    );
  }
}
