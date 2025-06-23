import 'dart:math';

import 'package:archiverse/api.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/recommendations/base_recommendation.dart';
import 'package:archiverse/recommendations/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SameCharacterRecommendation extends BaseRecommendation<Work> {
  const SameCharacterRecommendation({super.title, super.items = const []});

  @override
  bool get requiresHistory => true;

  @override
  IconData get widgetIcon => TablerIcons.user;

  @override
  String getWidgetTitle(BuildContext context) {
    // return "More works in the ${title ?? 'your favorite'} universe";
    return "Looking for more ${title ?? 'of your favorite character'}?";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    final fandoms = RecommendationUtils.getUserFavoriteTags(
      readHistory,
      types: [TagType.CHARACTER],
      limit: 20,
    );

    if (fandoms.isEmpty) {
      throw Exception('No favorite characters found');
    }

    final random = Random(seed);
    final selectedFandom = fandoms[random.nextInt(fandoms.length)];

    final works = await api.getWorksFromTag(selectedFandom, page: seed % 10);
    final list = RecommendationUtils.shuffleWithSeed(
      works,
      seed,
    ).take(itemCount).toList();

    return RecommendationResult(items: list, title: selectedFandom.name);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    return WorkSuggestions(works: items, loading: false);
  }

  @override
  BaseRecommendation<Work> copyWith({
    List<Work>? items,
    String? title,
    bool? isContinueReading,
  }) {
    return SameCharacterRecommendation(
      title: title,
      items: items ?? this.items,
    );
  }
}
