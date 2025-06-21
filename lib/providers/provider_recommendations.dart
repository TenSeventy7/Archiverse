import 'dart:math';
import 'package:archiverse/database/dao.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/pseud.dart';

// ignore_for_file: constant_identifier_names
enum RecommendationType {
  CONTINUE_READING,
  SAME_AUTHOR,
  SIMILAR_TAGS,
  SAME_FANDOM,
  BECAUSE_YOU_READ,
  POPULAR_IN_FANDOM,
  RANDOM_DISCOVERY,
}

class RecommendationResult {
  final List<Work> works;
  final RecommendationType type;
  final String?
  contextTitle; // "Author Name", "Fandom Name", "Work Title", etc.
  final IconData icon;
  final bool isContinueReading;

  const RecommendationResult({
    required this.works,
    required this.type,
    this.contextTitle,
    required this.icon,
    this.isContinueReading = false,
  });

  String getDisplayTitle() {
    switch (type) {
      case RecommendationType.SAME_AUTHOR:
        return "More from ${contextTitle ?? 'this author'}";
      case RecommendationType.SIMILAR_TAGS:
        return "More with ${contextTitle ?? 'similar tags'}";
      case RecommendationType.SAME_FANDOM:
        return "More from ${contextTitle ?? 'this fandom'}";
      case RecommendationType.BECAUSE_YOU_READ:
        return "Because you've read ${contextTitle ?? 'similar works'}";
      case RecommendationType.POPULAR_IN_FANDOM:
        return "Popular in ${contextTitle ?? 'your fandoms'}";
      case RecommendationType.RANDOM_DISCOVERY:
        return "Discover something new";
      default:
        return "";
    }
  }
}

class RecommendationsProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Cache for recommendations with context
  final Map<int, RecommendationResult> _pageRecommendations = {};

  bool _isLoading = false;
  String? _error;
  List<ReadHistory>? _userHistory;
  RecommendationType _lastType = RecommendationType.RANDOM_DISCOVERY;

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Initialize the recommendation system by loading user history
  Future<void> initialize() async {
    if (_userHistory != null) return; // Already initialized

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _userHistory = await _api.database.getRecentReadHistory(limit: 100);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get paginated recommendations with context
  Future<RecommendationResult> getRecommendationsWithContext({
    required int pageKey,
    int pageSize = 5,
  }) async {
    await initialize();

    // Check cache first
    if (_pageRecommendations.containsKey(pageKey)) {
      return _pageRecommendations[pageKey]!;
    }

    // Handle continue reading card as pageKey 1
    if (pageKey == 1) {
      final continueReadingResult = await _getContinueReadingResult();
      _pageRecommendations[pageKey] = continueReadingResult;
      return continueReadingResult;
    }

    if (_userHistory == null || _userHistory!.isEmpty) {
      final result = await _getRandomDiscovery(pageKey, pageSize);
      _pageRecommendations[pageKey] = result;
      return result;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Randomly select a recommendation type
      final types = RecommendationType.values;
      final random = Random();
      var selectedType = types[random.nextInt(types.length)];
      _lastType = selectedType; // Store last type for context

      RecommendationResult result;

      switch (selectedType) {
        case RecommendationType.CONTINUE_READING:
          // This shouldn't happen since we filter it out above
          result = await _getRandomDiscovery(pageKey, pageSize);
          break;
        case RecommendationType.SAME_AUTHOR:
          result = await _getRecommendationsByAuthor(pageKey, pageSize);
          break;
        case RecommendationType.SIMILAR_TAGS:
          result = await _getRecommendationsByTags(pageKey, pageSize);
          break;
        case RecommendationType.SAME_FANDOM:
          result = await _getRecommendationsByFandom(pageKey, pageSize);
          break;
        case RecommendationType.BECAUSE_YOU_READ:
          result = await _getBecauseYouRead(pageKey, pageSize);
          break;
        case RecommendationType.POPULAR_IN_FANDOM:
          result = await _getPopularInFandoms(pageKey, pageSize);
          break;
        case RecommendationType.RANDOM_DISCOVERY:
          result = await _getRandomDiscovery(pageKey, pageSize);
          break;
      }

      // Filter out works already read
      final readWorkIds = _userHistory!.map((h) => h.work.id).toSet();
      final filteredWorks = result.works
          .where((w) => !readWorkIds.contains(w.id))
          .toList();

      final finalResult = RecommendationResult(
        works: filteredWorks,
        type: result.type,
        contextTitle: result.contextTitle,
        icon: result.icon,
      );

      _pageRecommendations[pageKey] = finalResult;

      _isLoading = false;
      notifyListeners();

      return finalResult;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();

      // Return empty result on error
      final errorResult = RecommendationResult(
        works: [],
        type: RecommendationType.RANDOM_DISCOVERY,
        icon: Icons.error,
      );
      _pageRecommendations[pageKey] = errorResult;
      return errorResult;
    }
  }

  /// Get continue reading result for pageKey 0
  Future<RecommendationResult> _getContinueReadingResult() async {
    return const RecommendationResult(
      works:
          [], // Empty works list since this is handled by ContinueReadingCard
      type: RecommendationType.CONTINUE_READING,
      icon: Icons.menu_book,
      isContinueReading: true,
    );
  }

  /// Get recommendations based on authors user has read
  Future<RecommendationResult> _getRecommendationsByAuthor(
    int seed,
    int pageSize,
  ) async {
    final authors = _getUserFavoriteAuthors();
    if (authors.isEmpty) return await _getRandomDiscovery(seed, pageSize);

    final random = Random(seed);
    final selectedAuthor = authors[random.nextInt(authors.length)];

    final works = await _api.getWorksByUser(selectedAuthor, page: seed % 10);
    final shuffledWorks = _shuffleWithSeed(works, seed).take(pageSize).toList();

    return RecommendationResult(
      works: shuffledWorks,
      type: RecommendationType.SAME_AUTHOR,
      contextTitle: selectedAuthor.name,
      icon: Icons.person,
    );
  }

  /// Get recommendations based on tags user frequently reads
  Future<RecommendationResult> _getRecommendationsByTags(
    int seed,
    int pageSize,
  ) async {
    final tags = _getUserFavoriteTags();
    if (tags.isEmpty) return await _getRandomDiscovery(seed, pageSize);

    final random = Random(seed);
    final selectedTag = tags[random.nextInt(tags.length)];

    final works = await _api.getWorksFromTag(selectedTag, page: seed % 10);
    final shuffledWorks = _shuffleWithSeed(works, seed).take(pageSize).toList();

    return RecommendationResult(
      works: shuffledWorks,
      type: RecommendationType.SIMILAR_TAGS,
      contextTitle: selectedTag.name,
      icon: Icons.tag,
    );
  }

  /// Get recommendations based on fandoms user reads
  Future<RecommendationResult> _getRecommendationsByFandom(
    int seed,
    int pageSize,
  ) async {
    final fandoms = _getUserFavoriteFandoms();
    if (fandoms.isEmpty) return await _getRandomDiscovery(seed, pageSize);

    final random = Random(seed);
    final selectedFandom = fandoms[random.nextInt(fandoms.length)];

    final works = await _api.getWorksFromTag(selectedFandom, page: seed % 10);
    final shuffledWorks = _shuffleWithSeed(works, seed).take(pageSize).toList();

    return RecommendationResult(
      works: shuffledWorks,
      type: RecommendationType.SAME_FANDOM,
      contextTitle: selectedFandom.name,
      icon: Icons.favorite,
    );
  }

  /// Get recommendations because user read specific work
  Future<RecommendationResult> _getBecauseYouRead(
    int seed,
    int pageSize,
  ) async {
    if (_userHistory!.isEmpty) return await _getRandomDiscovery(seed, pageSize);

    final random = Random(seed);
    final readWork = _userHistory![random.nextInt(_userHistory!.length)].work;

    // Get recommendations based on a random aspect of the work they read
    final aspects = [
      () => readWork.fandoms.isNotEmpty ? readWork.fandoms.first : null,
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
            works = await _api.getWorksFromTag(aspect, page: seed % 10);
          } else if (aspect is Pseud) {
            works = await _api.getWorksByUser(aspect, page: seed % 10);
          } else {
            continue;
          }

          final shuffledWorks = _shuffleWithSeed(
            works,
            seed,
          ).take(pageSize).toList();

          return RecommendationResult(
            works: shuffledWorks,
            type: RecommendationType.BECAUSE_YOU_READ,
            contextTitle: readWork.title,
            icon: Icons.history,
          );
        } catch (e) {
          continue; // Try next aspect
        }
      }
    }

    return await _getRandomDiscovery(seed, pageSize);
  }

  /// Get popular works in user's favorite fandoms
  Future<RecommendationResult> _getPopularInFandoms(
    int seed,
    int pageSize,
  ) async {
    final fandoms = _getUserFavoriteFandoms();
    if (fandoms.isEmpty) return await _getRandomDiscovery(seed, pageSize);

    final random = Random(seed);
    final selectedFandom = fandoms[random.nextInt(fandoms.length)];

    // Get works and sort by popularity metrics
    final works = await _api.getWorksFromTag(selectedFandom, page: 0);
    works.sort((a, b) {
      final aScore = a.kudos + (a.bookmarks * 2) + (a.hits * 0.1);
      final bScore = b.kudos + (b.bookmarks * 2) + (b.hits * 0.1);
      return bScore.compareTo(aScore);
    });

    final shuffledWorks = _shuffleWithSeed(
      works.take(pageSize * 2).toList(),
      seed,
    ).take(pageSize).toList();

    return RecommendationResult(
      works: shuffledWorks,
      type: RecommendationType.POPULAR_IN_FANDOM,
      contextTitle: selectedFandom.name,
      icon: Icons.trending_up,
    );
  }

  /// Get random works for discovery
  Future<RecommendationResult> _getRandomDiscovery(
    int seed,
    int pageSize,
  ) async {
    final works = await _api.getRecentWorks();
    final shuffledWorks = _shuffleWithSeed(works, seed).take(pageSize).toList();

    return RecommendationResult(
      works: shuffledWorks,
      type: RecommendationType.RANDOM_DISCOVERY,
      icon: Icons.explore,
    );
  }

  /// Get user's favorite authors based on read history
  List<Pseud> _getUserFavoriteAuthors() {
    if (_userHistory == null) return [];

    final authorCount = <String, Map<String, dynamic>>{};

    for (final history in _userHistory!) {
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
  List<Tag> _getUserFavoriteTags() {
    if (_userHistory == null) return [];

    final tagCount = <String, Map<String, dynamic>>{};

    for (final history in _userHistory!) {
      final allTags = [
        ...history.work.tags,
        ...history.work.relationships,
        ...history.work.characters,
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
        .take(20)
        .map<Tag>((entry) => entry['tag'] as Tag)
        .toList();
  }

  /// Get user's favorite fandoms based on read history
  List<Tag> _getUserFavoriteFandoms() {
    if (_userHistory == null) return [];

    final fandomCount = <String, Map<String, dynamic>>{};

    for (final history in _userHistory!) {
      for (final fandom in history.work.fandoms) {
        if (fandomCount.containsKey(fandom.name)) {
          fandomCount[fandom.name]!['count']++;
        } else {
          fandomCount[fandom.name] = {'fandom': fandom, 'count': 1};
        }
      }
    }

    final sortedFandoms = fandomCount.values.toList()
      ..sort((a, b) => b['count'].compareTo(a['count']));

    return sortedFandoms
        .take(10)
        .map<Tag>((entry) => entry['fandom'] as Tag)
        .toList();
  }

  /// Shuffle list with deterministic seed for consistent pagination
  List<T> _shuffleWithSeed<T>(List<T> list, int seed) {
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

  /// Clear cache and refresh recommendations
  Future<void> refresh() async {
    _pageRecommendations.clear();
    _userHistory = null;
    _error = null;

    await initialize();
    notifyListeners();
  }

  /// Clear all cached data
  void clearCache() {
    _pageRecommendations.clear();
    _userHistory = null;
    _error = null;
    notifyListeners();
  }
}
