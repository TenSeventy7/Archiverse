import 'package:archiverse/models/chapter.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';

class ReadHistoryProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Cache for read history
  ReadHistory? _mostRecentHistory;
  bool _isLoading = false;
  String? _error;

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  ReadHistory? get mostRecentHistory => _mostRecentHistory;

  /// Saves read history and notifies listeners
  Future<void> saveReadHistory({
    required Work work,
    required Chapter chapter,
    required int scrollPosition,
    int? totalScrollPosition,
  }) async {
    try {
      await _api.saveReadHistory(
        work: work,
        chapter: chapter,
        scrollPosition: scrollPosition,
        totalScrollPosition: totalScrollPosition,
      );

      // Clear cache to force refresh
      _mostRecentHistory = null;

      // Refresh most recent history
      await _loadMostRecentHistory();

      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  /// Gets read history for a specific work
  Future<ReadHistory?> getReadHistory(Work work) async {
    try {
      return await _api.getReadHistory(work);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  /// Loads most recent read history
  Future<void> loadMostRecentHistory() async {
    await _loadMostRecentHistory();
  }

  Future<void> _loadMostRecentHistory() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _mostRecentHistory = await _api.getMostRecentReadHistory();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Loads paginated grouped history
  Future<Map<int, List<ReadHistory>>> loadPaginatedGroupedHistory({
    int offset = 0,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await _api.getPaginatedGroupedHistory(offset: offset);

      _isLoading = false;
      notifyListeners();

      return result;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return {};
    }
  }

  /// Deletes read history for a work
  Future<bool> deleteReadHistory(Work work) async {
    try {
      final success = await _api.deleteReadHistory(work);

      if (success) {
        _mostRecentHistory = null;
        await _loadMostRecentHistory();
        notifyListeners();
      }

      return success;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Refreshes all cached data
  Future<void> refresh() async {
    _mostRecentHistory = null;
    _error = null;
    await _loadMostRecentHistory();
  }

  /// Clears all cached data
  void clearCache() {
    _mostRecentHistory = null;
    _error = null;
    notifyListeners();
  }
}
