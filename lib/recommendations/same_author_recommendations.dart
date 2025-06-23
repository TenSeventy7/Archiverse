import 'dart:math';

import 'package:archiverse/api.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/recommendations/base_recommendation.dart';
import 'package:archiverse/recommendations/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SameAuthorRecommendation extends BaseRecommendation<Work> {
  const SameAuthorRecommendation({super.title, super.items = const []});

  @override
  bool get requiresHistory => true;

  @override
  IconData get widgetIcon => TablerIcons.feather;

  @override
  String getWidgetTitle(BuildContext context) {
    return "Check out more works by ${title ?? 'your favorite author'}";
  }

  @override
  Future<RecommendationResult<Work>> getRecommendations({
    required AppApi api,
    required int seed,
    List<ReadHistory>? readHistory,
  }) async {
    final authors = RecommendationUtils.getUserFavoriteAuthors(readHistory);
    if (authors.isEmpty) {
      throw Exception('No favorite authors found');
    }

    final random = Random(seed);
    final selectedAuthor = authors[random.nextInt(authors.length)];

    final works = await api.getWorksByUser(selectedAuthor, page: seed % 2);
    List<Work> list = RecommendationUtils.shuffleWithSeed<Work>(
      works,
      seed,
    ).take(itemCount).toList();

    list = RecommendationUtils.filterReadWorks(list, readHistory);
    return RecommendationResult(items: list, title: selectedAuthor.pseud);
  }

  @override
  Widget build({required BuildContext context, required List<Work> items}) {
    return WorkSuggestions(works: items, loading: false, itemCount: itemCount);
  }

  @override
  BaseRecommendation<Work> copyWith({List<Work>? items, String? title}) {
    return SameAuthorRecommendation(title: title, items: items ?? this.items);
  }
}
