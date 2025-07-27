import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';

class LibraryProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Recently added works state
  List<Work> _recentlyAddedWorks = [];
  List<Work> get recentlyAddedWorks => _recentlyAddedWorks;

  // Most read works state - derived from read history with highest hits
  List<Work> _mostReadWorks = [];
  List<Work> get mostReadWorks => _mostReadWorks;

  // Loading states
  bool _isLoadingRecentlyAdded = false;
  bool get isLoadingRecentlyAdded => _isLoadingRecentlyAdded;

  bool _isLoadingMostRead = false;
  bool get isLoadingMostRead => _isLoadingMostRead;

  /// Fetch recently added works to library
  Future<void> fetchRecentlyAdded({int limit = 10}) async {
    _isLoadingRecentlyAdded = true;
    notifyListeners();

    try {
      _recentlyAddedWorks = await _api.getRecentlyAddedToLibrary(limit: limit);
    } catch (e) {
      print('Error fetching recently added works: $e');
      _recentlyAddedWorks = [];
    } finally {
      _isLoadingRecentlyAdded = false;
      notifyListeners();
    }
  }

  /// Fetch most read works based on read history hits and completion
  Future<void> fetchMostRead({int limit = 10}) async {
    _isLoadingMostRead = true;
    notifyListeners();

    try {
      // Get all read history entries
      final allHistory = await ReadHistoryRepository.getAllReadHistory();

      if (allHistory.isEmpty) {
        _mostReadWorks = [];
        return;
      }

      // Create a scoring system that combines hits and completion
      // Higher hits = more read, completion shows engagement
      final scoredWorks = <MapEntry<Work, double>>[];

      for (final history in allHistory) {
        // Base score from hits (primary factor)
        double score = history.hits.toDouble() * 10;

        // Completion bonus - completed works get extra points
        if (history.completion >= 1.0) {
          score += 5; // Completed work bonus
        } else if (history.completion >= 0.5) {
          score += 2; // Partially read bonus
        }

        // Recency bonus - more recent reads get slight boost
        final daysSinceRead = DateTime.now()
            .difference(history.timestamp)
            .inDays;
        if (daysSinceRead <= 7) {
          score += 1; // Recent read bonus
        }

        scoredWorks.add(MapEntry(history.work, score));
      }

      // Sort by score (descending) and take the top works
      scoredWorks.sort((a, b) => b.value.compareTo(a.value));

      _mostReadWorks = scoredWorks
          .take(limit)
          .map((entry) => entry.key)
          .toList();
    } catch (e) {
      print('Error fetching most read works: $e');
      _mostReadWorks = [];
    } finally {
      _isLoadingMostRead = false;
      notifyListeners();
    }
  }

  /// Refresh all library data
  Future<void> refreshAll() async {
    await Future.wait([fetchRecentlyAdded(), fetchMostRead()]);
  }

  /// Clear all data
  void clear() {
    _recentlyAddedWorks = [];
    _mostReadWorks = [];
    notifyListeners();
  }
}
