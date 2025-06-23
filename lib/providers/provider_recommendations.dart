import 'dart:math';
import 'package:archiverse/recommendations/base_recommendation.dart';
import 'package:archiverse/recommendations/continue_reading_recommendation.dart';
import 'package:archiverse/recommendations/popular_in_fandom_recommendations.dart';
import 'package:archiverse/recommendations/random_discovery_recommendations.dart';
import 'package:archiverse/recommendations/related_works_recommendations.dart';
import 'package:archiverse/recommendations/same_author_recommendations.dart';
import 'package:archiverse/recommendations/same_character_recommendations.dart';
import 'package:archiverse/recommendations/same_fandom_recommendations.dart';
import 'package:archiverse/recommendations/same_relationship_recommendations.dart';
import 'package:archiverse/recommendations/similar_tags_recommendations.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/models/read_history.dart';

class RecommendationsProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Cache for recommendations with context
  final Map<int, BaseRecommendation> _cache = {};

  bool _isLoading = false;
  String? _error;
  List<ReadHistory>? _workHistory;

  // Dynamic list of available recommendation types
  final List<BaseRecommendation<dynamic>> _recommendations = [];
  int _lastRecommendationId = 0;

  RecommendationsProvider();

  void _addInitialRecommendations() {
    _addRecommendation(const RandomDiscoveryRecommendation());

    // These recommenders only make sense if we have user history
    if (_workHistory != null && _workHistory!.isNotEmpty) {
      _addRecommendation(const SameAuthorRecommendation());
      _addRecommendation(const SimilarTagsRecommendation());
      _addRecommendation(const SameFandomRecommendation());
      _addRecommendation(const SameCharacterRecommendation());
      _addRecommendation(const SameRelationshipRecommendation());
      _addRecommendation(const RelatedWorksRecommendation());
      _addRecommendation(const PopularInFandomRecommendation());
    }
  }

  /// Add a new recommendation type dynamically
  void addRecommendationType(BaseRecommendation<Work> recommendation) {
    _addRecommendation(recommendation);
    notifyListeners();
  }

  /// Remove a recommendation type
  void removeRecommendationType(Type recommendationType) {
    _recommendations.removeWhere(
      (rec) => rec.runtimeType == recommendationType,
    );
    notifyListeners();
  }

  /// Get all available recommendation types
  List<BaseRecommendation<Work>> get recommendations =>
      List.unmodifiable(_recommendations);

  void _addRecommendation(BaseRecommendation<Work> recommendation) {
    // Avoid duplicates based on runtime type
    if (!_recommendations.any(
      (rec) => rec.runtimeType == recommendation.runtimeType,
    )) {
      _recommendations.add(recommendation);
    }
  }

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Initialize the recommendation system by loading user history
  Future<void> initialize() async {
    if (_workHistory != null) return; // Already initialized

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _workHistory = await _api.database.readHistoriesDao.getRecentReadHistory(
        limit: 100,
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }

    // Add initial recommendations if not already present
    if (_recommendations.isEmpty) {
      _addInitialRecommendations();
    }

    _lastRecommendationId = _recommendations.length;
  }

  /// Get paginated recommendations with context
  Future<BaseRecommendation> getRecommendationsWithContext(int pageKey) async {
    await initialize();

    // Check cache first
    if (_cache.containsKey(pageKey)) {
      return _cache[pageKey]!;
    }

    // Handle continue reading card as pageKey 1
    if (pageKey == 1 && _workHistory != null && _workHistory!.isNotEmpty) {
      final continueReadingResult = const ContinueReadingRecommendation(
        items: [],
      );
      _cache[pageKey] = continueReadingResult;
      return continueReadingResult;
    }

    int attempts = 0;
    while (attempts <= 3) {
      try {
        _isLoading = true;
        _error = null;
        notifyListeners();

        // Filter recommendations based on history requirement
        final hasHistory = _workHistory != null && _workHistory!.isNotEmpty;
        final availableRecs = _recommendations
            .where((rec) => !rec.requiresHistory || hasHistory)
            .toList();

        if (availableRecs.isEmpty) {
          // Fallback to random discovery
          availableRecs.add(const RandomDiscoveryRecommendation());
        }

        // Randomly select a recommendation type
        final random = Random();
        BaseRecommendation<dynamic> engine = RandomDiscoveryRecommendation();

        if (attempts < 3) {
          int index = random.nextInt(availableRecs.length);

          // Ensure we don't select the same recommendation type as last time
          while (index == _lastRecommendationId) {
            index = random.nextInt(availableRecs.length);
          }

          engine = availableRecs[index];
        }

        final recommendations = await engine.getRecommendations(
          api: _api,
          seed: pageKey,
          readHistory: _workHistory,
        );

        if (recommendations.items.isNotEmpty) {
          final result = engine.copyWith(
            items: recommendations.items,
            title: recommendations.title,
          );

          _cache[pageKey] = result;

          _isLoading = false;
          notifyListeners();

          return result;
        }
      } catch (e) {
        _error = e.toString();
        _isLoading = false;
        notifyListeners();

        // Return empty result on error
        final errorResult = const RandomDiscoveryRecommendation(items: []);
        _cache[pageKey] = errorResult;
        return errorResult;
      }
      attempts++;
    }

    // Return empty result on error
    final errorResult = const RandomDiscoveryRecommendation(items: []);
    _cache[pageKey] = errorResult;
    return errorResult;
  }

  bool get hasHistory {
    return _workHistory != null && _workHistory!.isNotEmpty;
  }

  /// Clear cache and refresh recommendations
  Future<void> refresh() async {
    _cache.clear();
    _workHistory = null;
    _error = null;
    notifyListeners();

    await initialize();
  }

  /// Clear all cached data
  void clearCache() {
    _cache.clear();
    _workHistory = null;
    _error = null;
    notifyListeners();
  }
}
