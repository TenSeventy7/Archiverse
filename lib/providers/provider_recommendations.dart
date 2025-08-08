import 'dart:math';
import 'package:archiverse/recommendations/recommendation_base.dart';
import 'package:archiverse/recommendations/recommendation_continue_reading.dart';
import 'package:archiverse/recommendations/recommendation_popular_in_fandom.dart';
import 'package:archiverse/recommendations/recommendation_random_discovery.dart';
import 'package:archiverse/recommendations/recommendation_related_works.dart';
import 'package:archiverse/recommendations/recommendation_same_author.dart';
import 'package:archiverse/recommendations/recommendation_same_character.dart';
import 'package:archiverse/recommendations/recommendation_same_fandom.dart';
import 'package:archiverse/recommendations/recommendation_same_relationship.dart';
import 'package:archiverse/recommendations/recommendation_similar_tags.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/models/read_history.dart';

class RecommendationsProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Cache for recommendations with context
  final Map<int, BaseRecommendation> _cache = {};

  bool _isLoading = false;
  bool _isInitialized = false;
  String? _error;
  List<ReadHistory>? _workHistory;

  // Dynamic list of available recommendation types
  final List<BaseRecommendation<dynamic>> _recommendations = [];
  int _lastRecommendationId = 0;

  RecommendationsProvider();

  void _addInitialRecommendations() {
    _addRecommendation(const RandomDiscoveryRecommendation());
    _addRecommendation(const SameAuthorRecommendation());
    _addRecommendation(const SimilarTagsRecommendation());
    _addRecommendation(const SameFandomRecommendation());
    _addRecommendation(const SameCharacterRecommendation());
    _addRecommendation(const SameRelationshipRecommendation());
    _addRecommendation(const RelatedWorksRecommendation());
    _addRecommendation(const PopularInFandomRecommendation());
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
  bool get isInitialized => _isInitialized;
  String? get error => _error;

  /// Initialize the recommendation system by loading user history
  Future<void> initialize() async {
    if (_workHistory != null) return; // Already initialized
    if (_isInitialized) return; // Already initialized

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
    _isInitialized = true;
    notifyListeners();
  }

  /// Get paginated recommendations with context
  Future<BaseRecommendation> getRecommendationsWithContext(int pageKey) async {
    await initialize();

    while (!_isInitialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

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

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Get recommendations with fallback strategy
      final result = await _getRecommendationsWithFallback(pageKey);

      _cache[pageKey] = result;
      _isLoading = false;
      notifyListeners();

      return result;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();

      // Return guaranteed non-empty fallback
      final errorResult = await _getGuaranteedRecommendation(pageKey);
      _cache[pageKey] = errorResult;
      return errorResult;
    }
  }

  /// Get recommendations with intelligent fallback strategy
  Future<BaseRecommendation> _getRecommendationsWithFallback(
    int pageKey,
  ) async {
    final hasHistory = _workHistory != null && _workHistory!.isNotEmpty;

    // Create prioritized list of recommendation engines
    final prioritizedEngines = _getPrioritizedEngines(hasHistory);

    // Try each engine in order of priority
    for (final engine in prioritizedEngines) {
      try {
        final recommendations = await engine.getRecommendations(
          api: _api,
          seed: pageKey,
          readHistory: _workHistory,
        );

        if (recommendations.items.isNotEmpty) {
          return engine.copyWith(
            items: recommendations.items,
            title: recommendations.title,
          );
        }
      } catch (e) {
        // Continue to next engine
        continue;
      }
    }

    // If all engines fail, return guaranteed fallback
    return await _getGuaranteedRecommendation(pageKey);
  }

  /// Get prioritized list of recommendation engines
  List<BaseRecommendation<dynamic>> _getPrioritizedEngines(bool hasHistory) {
    final available = _recommendations
        .where((rec) => !rec.requiresHistory || hasHistory)
        .toList();

    if (available.isEmpty) {
      return [const RandomDiscoveryRecommendation()];
    }

    // Shuffle to avoid always using the same order, but ensure variety
    final random = Random(DateTime.now().millisecondsSinceEpoch);
    available.shuffle(random);

    // Always include RandomDiscovery as final fallback if not already present
    if (!available.any((rec) => rec is RandomDiscoveryRecommendation)) {
      available.add(const RandomDiscoveryRecommendation());
    }

    return available;
  }

  /// Get a guaranteed non-empty recommendation (fallback of fallbacks)
  Future<BaseRecommendation> _getGuaranteedRecommendation(int pageKey) async {
    // Use random discovery with broader search parameters
    try {
      final engine = const RandomDiscoveryRecommendation();
      final recommendations = await engine.getRecommendations(
        api: _api,
        seed: pageKey,
        readHistory: [], // Empty history for broader results
      );

      return engine.copyWith(
        items: recommendations.items,
        title: recommendations.title,
      );
    } catch (e) {
      // Absolute fallback - return empty but properly structured result
      return const RandomDiscoveryRecommendation(items: []);
    }
  }

  bool get hasHistory {
    return _workHistory != null && _workHistory!.isNotEmpty && _isInitialized;
  }

  /// Clear cache and refresh recommendations
  Future<void> refresh() async {
    _cache.clear();
    _workHistory = null;
    _error = null;
    _isInitialized = false;
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
