import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/models/library_category.dart';
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

  // List of library categories
  List<LibraryCategory> _categories = [];
  List<LibraryCategory> get categories => _categories;
  bool _isLoadingCategories = true;
  bool get isLoadingCategories => _isLoadingCategories;

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

  /// Fetch library categories
  Future<void> fetchCategories() async {
    _isLoadingCategories = true;
    notifyListeners();

    try {
      _categories = await _api.getLibraryCategories(1);
    } catch (e) {
      print('Error fetching library categories: $e');
      _categories = [];
    } finally {
      _isLoadingCategories = false;
      notifyListeners();
    }
  }

  /// Delete a library category
  Future<void> deleteCategory(LibraryCategory category) async {
    try {
      print('Deleting category: ${category.name}');
      await _api.deleteLibraryCategory(category);
      await refreshCategories();
      notifyListeners();
    } catch (e) {
      print('Error deleting category: $e');
      // Optionally handle error, e.g. show snackbar
    }
  }

  /// Remove a work from a specific category
  Future<void> removeWorkFromCategory(
    Work work,
    LibraryCategory category,
  ) async {
    try {
      if (!await _api.isWorkInCategory(work, category)) {
        return;
      }

      await _api.removeWorkFromCategory(work, category);
      notifyListeners();

      await refreshCategories(); // Refresh categories after removal
    } catch (e) {}
  }

  /// Add a new library category
  Future<void> addCategory(LibraryCategory category) async {
    try {
      await _api.createLibraryCategory(
        category.name,
        icon: category.icon,
        color: category.color,
      );
      notifyListeners();
      await refreshCategories(); // Refresh categories after adding
    } catch (e) {
      print('Error adding category: $e');
      // Optionally handle error, e.g. show snackbar
    }
  }

  /// Update an existing library category
  Future<void> updateCategory(LibraryCategory category) async {
    try {
      await _api.updateLibraryCategory(category);
      notifyListeners();
      await refreshCategories(); // Refresh categories after updating
    } catch (e) {
      print('Error updating category: $e');
      // Optionally handle error, e.g. show snackbar
    }
  }

  /// Refresh categories from API
  Future<void> refreshCategories() async {
    _categories = [];
    await fetchCategories();
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
    await Future.wait([
      fetchRecentlyAdded(),
      fetchMostRead(),
      fetchCategories(),
    ]);
  }

  /// Clear all data
  void clear() {
    _recentlyAddedWorks = [];
    _mostReadWorks = [];
    _categories = [];
    notifyListeners();
  }
}
