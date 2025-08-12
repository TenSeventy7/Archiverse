import 'package:flutter/material.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';

class LibraryProvider extends ChangeNotifier {
  final AppApi _api = AppApi();

  // Read History state
  ReadHistory? _mostRecentHistory;
  bool _isLoadingHistory = false;
  String? _readHistoryError;

  // Library state
  List<Work> _recentlyAddedWorks = [];
  List<Work> _mostReadWorks = [];
  List<LibraryFolder> _folders = [];

  bool _isLoadingRecentlyAdded = false;
  bool _isLoadingMostRead = false;
  bool _isLoadingFolders = true;
  String? _libraryError;

  bool get isLoadingHistory => _isLoadingHistory;
  String? get readHistoryError => _readHistoryError;
  ReadHistory? get mostRecentHistory => _mostRecentHistory;
  List<Work> get recentlyAddedWorks => _recentlyAddedWorks;
  List<Work> get mostReadWorks => _mostReadWorks;
  List<LibraryFolder> get folders => _folders;
  bool get isLoadingRecentlyAdded => _isLoadingRecentlyAdded;
  bool get isLoadingMostRead => _isLoadingMostRead;
  bool get isLoadingFolders => _isLoadingFolders;
  String? get libraryError => _libraryError;
  bool get isLoadingAny =>
      _isLoadingHistory ||
      _isLoadingRecentlyAdded ||
      _isLoadingMostRead ||
      _isLoadingFolders;
  String? get anyError => _readHistoryError ?? _libraryError;

  Future<void> initialize() async {
    await _loadMostRecentHistory();
  }

  /// Saves read history and updates related library data
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

      // Clear cache and refresh data
      _mostRecentHistory = null;
      await _loadMostRecentHistory();

      // Also refresh most read works since this affects the ranking
      await _fetchMostRead();

      notifyListeners();
    } catch (e) {
      _readHistoryError = e.toString();
      notifyListeners();
    }
  }

  /// Gets read history for a specific work
  Future<ReadHistory?> getReadHistory(Work work) async {
    try {
      return await _api.getReadHistory(work);
    } catch (e) {
      _readHistoryError = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<void> _loadMostRecentHistory() async {
    try {
      _isLoadingHistory = true;
      _readHistoryError = null;
      notifyListeners();

      _mostRecentHistory = await _api.getMostRecentReadHistory();

      _isLoadingHistory = false;
      notifyListeners();
    } catch (e) {
      _readHistoryError = e.toString();
      _isLoadingHistory = false;
      notifyListeners();
    }
  }

  /// Loads paginated grouped history
  Future<Map<int, List<ReadHistory>>> loadPaginatedGroupedHistory({
    int offset = 0,
  }) async {
    try {
      _isLoadingHistory = true;
      _readHistoryError = null;
      notifyListeners();

      final result = await _api.getPaginatedGroupedHistory(offset: offset);

      _isLoadingHistory = false;
      notifyListeners();

      return result;
    } catch (e) {
      _readHistoryError = e.toString();
      _isLoadingHistory = false;
      notifyListeners();
      return {};
    }
  }

  /// Checks if there's more history beyond the current offset
  Future<bool> hasMoreHistory(int currentOffset) async {
    try {
      return await _api.hasMoreHistory(currentOffset);
    } catch (e) {
      _readHistoryError = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Gets the total count of read history entries
  Future<int> getReadHistoryCount() async {
    try {
      return await _api.getReadHistoryCount();
    } catch (e) {
      _readHistoryError = e.toString();
      notifyListeners();
      return 0;
    }
  }

  /// Deletes read history for a work and updates related data
  Future<bool> deleteReadHistory(Work work) async {
    try {
      final success = await _api.deleteReadHistory(work);

      if (success) {
        _mostRecentHistory = null;
        await _loadMostRecentHistory();
        // Refresh most read works since this affects the ranking
        await _fetchMostRead();
        notifyListeners();
      }

      return success;
    } catch (e) {
      _readHistoryError = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Fetch recently added works to library
  Future<void> fetchRecentlyAdded({int limit = 10}) async {
    _isLoadingRecentlyAdded = true;
    _libraryError = null;
    notifyListeners();

    try {
      _recentlyAddedWorks = await _api.getRecentlyAddedToLibrary(limit: limit);
    } catch (e) {
      _libraryError = 'Error fetching recently added works: $e';
      _recentlyAddedWorks = [];
    } finally {
      _isLoadingRecentlyAdded = false;
      notifyListeners();
    }
  }

  /// Fetch library folders
  Future<void> fetchFolders() async {
    _isLoadingFolders = true;
    _libraryError = null;
    notifyListeners();

    try {
      _folders = await _api.getLibraryFolders(1);
    } catch (e) {
      _libraryError = 'Error fetching library folders: $e';
      _folders = [];
    } finally {
      _isLoadingFolders = false;
      notifyListeners();
    }
  }

  /// Fetch most read works based on read history
  Future<void> fetchMostRead({int limit = 10}) async {
    await _fetchMostRead(limit: limit);
  }

  Future<void> _fetchMostRead({int limit = 10}) async {
    _isLoadingMostRead = true;
    notifyListeners();

    try {
      final allHistory = await ReadHistoryRepository.getAllReadHistory();

      if (allHistory.isEmpty) {
        _mostReadWorks = [];
        return;
      }

      // Create a scoring system that combines hits and completion
      final scores = <int, _WorkScore>{};

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

        // Use the work ID as key and accumulate/update scores
        if (scores[history.work.id] == null) {
          scores[history.work.id] = _WorkScore(history.work, score);
        } else {
          // Update with latest score (hit counts should be identical across histories)
          scores[history.work.id]!.score = score;
        }
      }

      // Sort by score (descending) and take the top works
      final sortedEntries = scores.entries.toList()
        ..sort((a, b) => b.value.score.compareTo(a.value.score));

      _mostReadWorks = sortedEntries
          .take(limit)
          .map((entry) => entry.value.work)
          .toList();
    } catch (e) {
      _libraryError = 'Error fetching most read works: $e';
      _mostReadWorks = [];
    } finally {
      _isLoadingMostRead = false;
      notifyListeners();
    }
  }

  /// Delete a library folder
  Future<void> deleteFolder(LibraryFolder folder) async {
    try {
      await _api.deleteLibraryFolder(folder);
      await fetchFolders();
    } catch (e) {
      _libraryError = 'Error deleting folder: $e';
    }
    notifyListeners();
  }

  /// Remove a work from a specific folder
  Future<void> removeWorkFromFolder(Work work, LibraryFolder folder) async {
    try {
      if (!await _api.isWorkInFolder(work, folder)) {
        return;
      }

      await _api.removeWorkFromFolder(work, folder);
      await fetchFolders();
    } catch (e) {
      _libraryError = 'Error removing work from folder: $e';
    }
    notifyListeners();
  }

  /// Add a new library folder
  Future<void> addFolder(LibraryFolder folder) async {
    try {
      await _api.createLibraryFolder(
        folder.name,
        icon: folder.icon,
        color: folder.color,
      );
      await fetchFolders();
    } catch (e) {
      _libraryError = 'Error adding folder: $e';
    }
    notifyListeners();
  }

  /// Update an existing library folder
  Future<void> updateFolder(LibraryFolder folder) async {
    try {
      await _api.updateLibraryFolder(folder);
      await fetchFolders();
    } catch (e) {
      _libraryError = 'Error updating folder: $e';
    }
    notifyListeners();
  }

  /// Refresh folders from API
  Future<void> refreshFolders() async {
    _folders = [];
    await fetchFolders();
  }

  /// Refresh all library and read history data
  Future<void> refreshAll() async {
    await Future.wait([fetchRecentlyAdded(), fetchFolders()]);
  }

  /// Refresh only read history related data
  Future<void> refreshHistory() async {
    _mostRecentHistory = null;
    _readHistoryError = null;
    await Future.wait([
      _loadMostRecentHistory(),
      _fetchMostRead(), // Most read works depend on read history
    ]);
  }

  /// Refresh only library data (not read history)
  Future<void> refreshLibrary() async {
    await Future.wait([fetchRecentlyAdded(), fetchFolders()]);
  }

  /// Clear all cached data
  void clearAll() {
    // Clear read history cache
    _mostRecentHistory = null;
    _readHistoryError = null;

    // Clear library cache
    _recentlyAddedWorks = [];
    _mostReadWorks = [];
    _folders = [];
    _libraryError = null;

    notifyListeners();
  }

  /// Clear only read history cache
  void clearReadHistoryCache() {
    _mostRecentHistory = null;
    _readHistoryError = null;
    notifyListeners();
  }

  /// Clear only library cache
  void clearLibraryCache() {
    _recentlyAddedWorks = [];
    _mostReadWorks = [];
    _folders = [];
    _libraryError = null;
    notifyListeners();
  }
}

/// Helper class for work scoring in most read calculation
class _WorkScore {
  final Work work;
  double score;

  _WorkScore(this.work, this.score);
}
