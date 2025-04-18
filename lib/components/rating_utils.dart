import 'package:flutter/material.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

/// Utility class for handling work ratings visualization
class RatingUtils {
  // Age Rating Information
  static RatingInfo getAgeRatingInfo(BuildContext context, AgeRating? rating) {
    switch (rating) {
      case AgeRating.GENERAL:
        return RatingInfo(
          symbol: "G",
          label: "General Audiences",
          description:
              "This work is appropriate for all ages with no adult themes or potentially offensive content.",
          backgroundColor: Colors.green.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_check,
        );
      case AgeRating.TEEN:
        return RatingInfo(
          symbol: "T",
          label: "Teen And Up",
          description:
              "This work may contain mild violence, coarse language, and minor suggestive adult themes.",
          backgroundColor: Colors.orange.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_t,
        );
      case AgeRating.MATURE:
        return RatingInfo(
          symbol: "M",
          label: "Mature",
          description:
              "This work contains adult themes including violence, sensitive topics, or non-explicit sexual content.",
          backgroundColor: Colors.deepOrange.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_m,
        );
      case AgeRating.EXPLICIT:
        return RatingInfo(
          symbol: "E",
          label: "Explicit",
          description:
              "This work contains explicit sexual content, graphic violence, or other adult material.",
          backgroundColor: Colors.red.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_e,
        );
      default:
        return RatingInfo(
          symbol: "N",
          label: "Not Rated",
          description:
              "The author hasn't specified the content rating. May contain material from any rating category.",
          backgroundColor: Colors.grey.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_n,
        );
    }
  }

  // Relationship Type Information
  static RatingInfo getRelationshipInfo(
    BuildContext context,
    RelationshipType type,
  ) {
    switch (type) {
      case RelationshipType.FEM_SLASH:
        return RatingInfo(
          symbol: "F/F",
          label: "Female/Female Relationships",
          description:
              "This work focuses on romantic or sexual relationships between women.",
          backgroundColor: Colors.pink.withOpacity(0.2),
          foregroundColor: Colors.pink,
          icon: TablerIcons.venus,
        );
      case RelationshipType.SLASH:
        return RatingInfo(
          symbol: "M/M",
          label: "Male/Male Relationships",
          description:
              "This work focuses on romantic or sexual relationships between men.",
          backgroundColor: Colors.blue.withOpacity(0.2),
          foregroundColor: Colors.blue,
          icon: TablerIcons.mars,
        );
      case RelationshipType.HET:
        return RatingInfo(
          symbol: "M/F",
          label: "Male/Female Relationships",
          description:
              "This work focuses on romantic or sexual relationships between men and women.",
          backgroundColor: Colors.purple.withOpacity(0.2),
          foregroundColor: Colors.purple,
          icon: TablerIcons.gender_bigender,
        );
      case RelationshipType.GEN:
        return RatingInfo(
          symbol: "Gen",
          label: "General",
          description:
              "This work focuses on non-romantic relationships or has romance as a secondary element.",
          backgroundColor: Colors.teal.withOpacity(0.2),
          foregroundColor: Colors.teal,
          icon: TablerIcons.article,
        );
      case RelationshipType.MULTI:
        return RatingInfo(
          symbol: "Multi",
          label: "Multiple Pairings",
          description:
              "This work contains various relationship types or polyamorous relationships.",
          backgroundColor: Colors.amber.withOpacity(0.2),
          foregroundColor: Colors.amber,
          icon: TablerIcons.users_group,
        );
      case RelationshipType.OTHER:
        return RatingInfo(
          symbol: "Other",
          label: "Other Relationships",
          description:
              "This work contains relationships that don't fit the standard categories.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.dots,
        );
      default:
        return RatingInfo(
          symbol: "N/A",
          label: "Unknown Relationship",
          description:
              "The relationship type for this work hasn't been specified.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.question_mark,
        );
    }
  }

  // Warning Type Information
  static RatingInfo getWarningInfo(BuildContext context, WarningType warning) {
    switch (warning) {
      case WarningType.APPLICABLE:
        return RatingInfo(
          symbol: "CW",
          label: "Content Warnings Apply",
          description:
              "This work contains potentially disturbing content. Check the tags for specifics.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.alert_triangle,
        );
      case WarningType.AUTHOR_DEFERRED:
        return RatingInfo(
          symbol: "?",
          label: "Author Chose Not To Warn",
          description:
              "The author has opted not to specify warnings. Any content may be present.",
          backgroundColor: Colors.amber.withOpacity(0.2),
          foregroundColor: Colors.amber,
          icon: TablerIcons.alert_circle,
        );
      case WarningType.NOT_APPLICABLE:
        return RatingInfo(
          symbol: "✓",
          label: "No Content Warnings",
          description:
              "This work doesn't contain content requiring standard archive warnings.",
          backgroundColor: Colors.green.withOpacity(0.2),
          foregroundColor: Colors.green,
          icon: TablerIcons.check,
        );
      case WarningType.GRAPHIC_VIOLENCE:
        return RatingInfo(
          symbol: "GV",
          label: "Graphic Violence",
          description:
              "This work contains explicit depictions of violence or gore.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.sword,
        );
      case WarningType.MAJOR_CHARACTER_DEATH:
        return RatingInfo(
          symbol: "MCD",
          label: "Major Character Death",
          description:
              "This work involves the death of one or more major characters.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.skull,
        );
      case WarningType.RAPE_NON_CONSENSUAL:
        return RatingInfo(
          symbol: "R/NC",
          label: "Rape/Non-Con",
          description:
              "This work contains depictions of non-consensual sexual activities.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.lock,
        );
      case WarningType.UNDERAGE:
        return RatingInfo(
          symbol: "U",
          label: "Underage",
          description:
              "This work depicts sexual activity involving characters under 18.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.number_18_small,
        );
      default:
        return RatingInfo(
          symbol: "?",
          label: "Unknown Warning Status",
          description: "Warning information for this work is unavailable.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.question_mark,
        );
    }
  }
}

/// Data class containing information about a rating
class RatingInfo {
  final String symbol;
  final String label;
  final String description;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  const RatingInfo({
    required this.symbol,
    required this.label,
    required this.description,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });
}
