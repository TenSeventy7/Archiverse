import 'package:archiverse/api.dart';
import 'package:archiverse/components/continue_reading_card.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/recommendations/base_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ContinueReadingRecommendation extends BaseRecommendation<Work> {
  const ContinueReadingRecommendation({super.items = const []});

  @override
  bool get requiresHistory => false;

  @override
  IconData get widgetIcon => TablerIcons.book;

  @override
  bool get hasHeader => false;

  @override
  String getWidgetTitle(BuildContext context) {
    return "";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    return const RecommendationResult<Work>(items: []);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    // This should not be used as ContinueReadingCard handles this
    return const ContinueReadingCard();
  }

  @override
  BaseRecommendation<Work> copyWith({List<Work>? items, String? title}) {
    return ContinueReadingRecommendation(items: items ?? this.items);
  }
}
