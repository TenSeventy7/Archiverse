import 'package:archiverse/recommendations/recommendation_base.dart';
import 'package:archiverse/recommendations/recommendation_utils.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/api.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RandomDiscoveryRecommendation extends BaseRecommendation<Work> {
  const RandomDiscoveryRecommendation({super.items = const []});

  @override
  bool get requiresHistory => false;

  @override
  IconData get widgetIcon => TablerIcons.compass;

  @override
  String getWidgetTitle(BuildContext context) {
    return "Fresh picks you might love";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    final works = await api.getRecentWorks();
    final list = RecommendationUtils.shuffleWithSeed(
      works,
      seed,
    ).take(itemCount).toList();

    return RecommendationResult(items: list);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    return WorkSuggestions(works: items, loading: false, itemCount: itemCount);
  }

  @override
  BaseRecommendation<Work> copyWith({List<Work>? items, String? title}) {
    return RandomDiscoveryRecommendation(items: items ?? this.items);
  }
}
