import 'dart:math';

import 'package:archiverse/api.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/recommendations/recommendation_base.dart';
import 'package:archiverse/recommendations/recommendation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RelatedWorksRecommendation extends BaseRecommendation<Work> {
  const RelatedWorksRecommendation({super.title, super.items = const []});

  @override
  bool get requiresHistory => true;

  @override
  IconData get widgetIcon => TablerIcons.history;

  @override
  String getWidgetTitle(BuildContext context) {
    return "Because you read ${title ?? 'something you liked'}";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    if (readHistory == null || readHistory.isEmpty) {
      throw Exception('No user history found');
    }

    final random = Random(seed);
    final Work? readWork = RecommendationUtils.getRandomWorkFromHistory(
      readHistory,
      random,
    );

    if (readWork == null) {
      throw Exception('No suitable work found in history');
    }

    final aspects = [
      () => readWork.fandoms.isNotEmpty ? readWork.fandoms.first : null,
      () => readWork.relationships.isNotEmpty
          ? readWork.relationships.first
          : null,
      () => readWork.characters.isNotEmpty ? readWork.characters.first : null,
      () => readWork.tags.isNotEmpty ? readWork.tags.first : null,
      () => readWork.authors.isNotEmpty ? readWork.authors.first : null,
    ];

    aspects.shuffle(random);

    for (final getAspect in aspects) {
      final aspect = getAspect();
      if (aspect != null) {
        try {
          List<Work> works;
          if (aspect is Tag) {
            works = await api.getWorksFromTag(aspect, page: seed % 5);
          } else if (aspect is Pseud) {
            works = await api.getWorksByUser(aspect, page: seed % 2);
          } else {
            continue;
          }

          final list = RecommendationUtils.shuffleWithSeed(
            works,
            seed,
          ).take(itemCount).toList();

          if (list.isNotEmpty) {
            return RecommendationResult(items: list, title: readWork.title);
          }
        } catch (e) {
          continue;
        }
      }
    }

    throw Exception('No suitable recommendations found');
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
    return RelatedWorksRecommendation(title: title, items: items);
  }
}
