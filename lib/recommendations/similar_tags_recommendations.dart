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

class SimilarTagsRecommendation extends BaseRecommendation<Work> {
  const SimilarTagsRecommendation({super.title, super.items = const []});

  @override
  bool get requiresHistory => true;

  @override
  IconData get widgetIcon => TablerIcons.tag;

  @override
  String getWidgetTitle(BuildContext context) {
    return "More works tagged with ${title ?? 'your favorite tag'}";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    final tags = RecommendationUtils.getUserFavoriteTags(
      readHistory,
      types: [TagType.FREEFORM],
    );
    if (tags.isEmpty) {
      throw Exception('No favorite tags found');
    }

    final random = Random(seed);
    final selectedTag = tags[random.nextInt(tags.length)];

    final works = await api.getWorksFromTag(selectedTag, page: seed % 10);
    final list = RecommendationUtils.shuffleWithSeed(
      works,
      seed,
    ).take(itemCount).toList();

    return RecommendationResult(items: list, title: selectedTag.name);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    return WorkSuggestions(works: items, loading: false, itemCount: itemCount);
  }

  @override
  BaseRecommendation<Work> copyWith({List<Work>? items, String? title}) {
    return SimilarTagsRecommendation(title: title, items: items ?? this.items);
  }
}
