import 'package:flutter/material.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/api.dart';

class RecommendationResult<T> {
  final List<T> items;
  final String? title;

  const RecommendationResult({required this.items, this.title});
}

abstract class BaseRecommendation<T> {
  final List<T> items;
  final String? title;

  const BaseRecommendation({this.items = const [], this.title});

  /// Whether this recommendation type requires user history
  bool get requiresHistory;

  /// Icon for this recommendation type
  IconData get widgetIcon;

  /// Get localized title for the recommendation widget
  String getWidgetTitle(BuildContext context);

  /// Get number of items to display in the widget
  int get itemCount => 10;

  /// Whether this recommendation should have a header
  bool get hasHeader => true;

  /// Get recommendations based on user history and seed
  Future<RecommendationResult<T>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  });

  /// Build the widget for displaying these recommendations (without header)
  Widget build({required BuildContext context, required List<T> items});

  /// Create a new instance with items and other properties
  BaseRecommendation<T> copyWith({required List<T> items, String? title});
}
