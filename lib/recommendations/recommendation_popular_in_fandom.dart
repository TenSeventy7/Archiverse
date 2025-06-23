import 'dart:math';

import 'package:archiverse/api.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/recommendations/recommendation_base.dart';
import 'package:archiverse/recommendations/recommendation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PopularInFandomRecommendation extends BaseRecommendation<Work> {
  const PopularInFandomRecommendation({super.title, super.items = const []});

  @override
  bool get requiresHistory => true;

  @override
  IconData get widgetIcon => TablerIcons.trending_up;

  @override
  String getWidgetTitle(BuildContext context) {
    return "Works getting hits in the ${title ?? 'your favorite fandom'} universe";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    final fandoms = RecommendationUtils.getUserFavoriteTags(
      readHistory,
      types: [TagType.FANDOM],
      limit: 10,
    );
    if (fandoms.isEmpty) {
      throw Exception('No favorite fandoms found');
    }

    final random = Random(seed);
    final selectedFandom = fandoms[random.nextInt(fandoms.length)];

    final works = await api.getWorksFromTag(selectedFandom, page: 0);
    works.sort((a, b) {
      final aScore = RecommendationUtils.calculatePopularityScore(a);
      final bScore = RecommendationUtils.calculatePopularityScore(b);
      return bScore.compareTo(aScore);
    });

    final list = RecommendationUtils.shuffleWithSeed(
      works.take(itemCount * 2).toList(),
      seed,
    ).take(itemCount).toList();

    return RecommendationResult(items: list, title: selectedFandom.name);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    return WorkSuggestions(works: items, loading: false, itemCount: itemCount);
  }

  @override
  BaseRecommendation<Work> copyWith({
    required List<Work> items,
    String? title,
  }) {
    return PopularInFandomRecommendation(title: title, items: items);
  }
}
