import 'dart:math';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';

class RecommendationUtils {
  /// Filter works already read by the user
  static List<Work> filterReadWorks(
    List<Work> works,
    List<ReadHistory>? userHistory,
  ) {
    if (userHistory == null || userHistory.isEmpty) return works;

    final readWorkIds = userHistory.map((e) => e.work.id).toSet();
    return works.where((work) => !readWorkIds.contains(work.id)).toList();
  }

  /// Get user's favorite authors based on read history
  static List<Pseud> getUserFavoriteAuthors(List<ReadHistory>? userHistory) {
    if (userHistory == null || userHistory.isEmpty) return [];

    final authorCount = <String, Map<String, dynamic>>{};

    for (final history in userHistory) {
      for (final author in history.work.authors) {
        final key = "${author.name}_${author.pseud}";
        if (authorCount.containsKey(key)) {
          authorCount[key]!['count']++;
        } else {
          authorCount[key] = {'author': author, 'count': 1};
        }
      }
    }

    final sortedAuthors = authorCount.values.toList()
      ..sort((a, b) => b['count'].compareTo(a['count']));

    return sortedAuthors
        .take(10)
        .map<Pseud>((entry) => entry['author'] as Pseud)
        .toList();
  }

  /// Get user's favorite tags based on read history
  static List<Tag> getUserFavoriteTags(
    List<ReadHistory>? userHistory, {
    required List<TagType> types,
    int limit = 20,
  }) {
    if (userHistory == null || userHistory.isEmpty) return [];
    if (types.isEmpty) return [];

    final tagCount = <String, Map<String, dynamic>>{};

    for (final history in userHistory) {
      final allTags = <Tag>[
        if (types.contains(TagType.FANDOM)) ...history.work.fandoms,
        if (types.contains(TagType.FREEFORM)) ...history.work.tags,
        if (types.contains(TagType.RELATIONSHIP)) ...history.work.relationships,
        if (types.contains(TagType.CHARACTER)) ...history.work.characters,
      ];
      for (final tag in allTags) {
        if (tagCount.containsKey(tag.name)) {
          tagCount[tag.name]!['count']++;
        } else {
          tagCount[tag.name] = {'tag': tag, 'count': 1};
        }
      }
    }

    final sortedTags = tagCount.values.toList()
      ..sort((a, b) => b['count'].compareTo(a['count']));

    return sortedTags
        .take(limit)
        .map<Tag>((entry) => entry['tag'] as Tag)
        .toList();
  }

  /// Shuffle list with deterministic seed for consistent pagination
  static List<T> shuffleWithSeed<T>(List<T> list, int seed) {
    final random = Random(seed);
    final shuffled = List<T>.from(list);

    for (int i = shuffled.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = shuffled[i];
      shuffled[i] = shuffled[j];
      shuffled[j] = temp;
    }

    return shuffled;
  }

  /// Get random work from user history
  static Work? getRandomWorkFromHistory(
    List<ReadHistory> userHistory,
    Random random,
  ) {
    if (userHistory.isEmpty) return null;
    return userHistory[random.nextInt(userHistory.length)].work;
  }

  /// Calculate popularity score for works
  static double calculatePopularityScore(dynamic work) {
    return work.kudos + (work.bookmarks * 2) + (work.hits * 0.1);
  }
}
