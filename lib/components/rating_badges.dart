import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RatingBadges extends StatelessWidget {
  final Work work;
  const RatingBadges({super.key, required this.work});
  final size = 24.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Age Rating Badge
        _buildRatingBadge(context, work.rating),
        const SizedBox(width: 6),

        // Relationship Badge
        _buildRelationshipBadge(
          context,
          work.relationship.firstOrNull ?? RelationshipType.NONE,
        ),
        const SizedBox(width: 6),

        // Warning Badge
        _buildWarningBadge(
          context,
          work.warnings.firstOrNull ?? WarningType.NOT_APPLICABLE,
        ),
      ],
    );
  }

  Widget _buildRatingBadge(BuildContext context, AgeRating? rating) {
    final colorScheme = Theme.of(context).colorScheme;

    // Define colors and icons based on AO3's rating system
    Color bgColor;
    Color iconColor;
    String text;

    switch (rating) {
      case AgeRating.GENERAL:
        bgColor = Colors.green.withOpacity(0.8);
        iconColor = Colors.white;
        text = "G";
        break;
      case AgeRating.TEEN:
        bgColor = Colors.orange.withOpacity(0.8);
        iconColor = Colors.white;
        text = "T";
        break;
      case AgeRating.MATURE:
        bgColor = Colors.deepOrange.withOpacity(0.8);
        iconColor = Colors.white;
        text = "M";
        break;
      case AgeRating.EXPLICIT:
        bgColor = Colors.red.withOpacity(0.8);
        iconColor = Colors.white;
        text = "E";
        break;
      default:
        bgColor = colorScheme.surfaceVariant;
        iconColor = colorScheme.onSurfaceVariant;
        text = "N";
    }

    return Tooltip(
      message: _getRatingTooltip(rating),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: iconColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildRelationshipBadge(BuildContext context, RelationshipType type) {
    final colorScheme = Theme.of(context).colorScheme;

    // Define colors and icons based on AO3's category system
    Color bgColor;
    Color iconColor;
    IconData icon;

    switch (type) {
      case RelationshipType.FEM_SLASH:
        bgColor = Colors.pink.withOpacity(0.2);
        iconColor = Colors.pink;
        icon = TablerIcons.venus;
        break;
      case RelationshipType.SLASH:
        bgColor = Colors.blue.withOpacity(0.2);
        iconColor = Colors.blue;
        icon = TablerIcons.mars;
        break;
      case RelationshipType.HET:
        bgColor = Colors.purple.withOpacity(0.2);
        iconColor = Colors.purple;
        icon = TablerIcons.gender_bigender;
        break;
      case RelationshipType.GEN:
        bgColor = Colors.teal.withOpacity(0.2);
        iconColor = Colors.teal;
        icon = TablerIcons.article;
        break;
      case RelationshipType.MULTI:
        bgColor = Colors.amber.withOpacity(0.2);
        iconColor = Colors.amber;
        icon = TablerIcons.users_group;
        break;
      case RelationshipType.OTHER:
        bgColor = Colors.grey.withOpacity(0.2);
        iconColor = Colors.grey;
        icon = TablerIcons.dots;
        break;
      default:
        bgColor = colorScheme.surfaceVariant;
        iconColor = colorScheme.onSurfaceVariant;
        icon = TablerIcons.question_mark;
    }

    return Tooltip(
      message: _getRelationshipTooltip(type),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14, color: iconColor),
      ),
    );
  }

  Widget _buildWarningBadge(BuildContext context, WarningType warning) {
    final colorScheme = Theme.of(context).colorScheme;

    // Define colors and icons based on AO3's warning system
    Color bgColor;
    Color iconColor;
    IconData icon;

    switch (warning) {
      case WarningType.APPLICABLE:
        bgColor = colorScheme.errorContainer;
        iconColor = colorScheme.error;
        icon = TablerIcons.alert_triangle;
        break;
      case WarningType.NOT_APPLICABLE:
      default:
        bgColor = colorScheme.surfaceVariant.withOpacity(0.3);
        iconColor = colorScheme.onSurfaceVariant;
        icon = TablerIcons.check;
    }

    return Tooltip(
      message: _getWarningTooltip(warning),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14, color: iconColor),
      ),
    );
  }

  String _getRatingTooltip(AgeRating? rating) {
    switch (rating) {
      case AgeRating.GENERAL:
        return "General Audiences";
      case AgeRating.TEEN:
        return "Teen And Up";
      case AgeRating.MATURE:
        return "Mature";
      case AgeRating.EXPLICIT:
        return "Explicit";
      default:
        return "Not Rated";
    }
  }

  String _getRelationshipTooltip(RelationshipType? type) {
    switch (type) {
      case RelationshipType.FEM_SLASH:
        return "F/F";
      case RelationshipType.SLASH:
        return "M/M";
      case RelationshipType.HET:
        return "F/M";
      case RelationshipType.GEN:
        return "General";
      case RelationshipType.MULTI:
        return "Multiple Pairings";
      case RelationshipType.OTHER:
        return "Other Relationships";
      default:
        return "Unknown Relationship";
    }
  }

  String _getWarningTooltip(WarningType warning) {
    switch (warning) {
      case WarningType.APPLICABLE:
        return "Contains Content Warnings";
      case WarningType.NOT_APPLICABLE:
        return "No Content Warnings";
      default:
        return "Unknown Warning Status";
    }
  }
}
