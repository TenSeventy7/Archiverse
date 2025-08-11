import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';

extension AppApiReadHistory on AppApi {
  /// Saves the read history for a work and chapter.
  ///
  /// This method computes the completion percentage based on the totalnumber of chapters in the work.
  /// If the work is a one-shot, it sets completion to 100%. If the
  /// work has no total chapters, it assumes 0% completion.
  ///
  /// The [scrollPosition] parameter is the current scroll position in the chapter,
  /// which can be used to restore the user's position later. Make sure that the reader component
  /// supports saving and restoring this position.
  Future<void> saveReadHistory({
    required Work work,
    required Chapter chapter,
    required int scrollPosition,
    int? totalScrollPosition,
  }) async {
    try {
      var completion = 0.0;

      // If work is not in the database, save it first
      if (!(await WorkRepository.workExists(work.id))) {
        await WorkRepository.saveWork(work);
      }

      // If chapter is not in the database, save it first
      if (!(await ChapterRepository.chapterExists(chapter.id))) {
        await ChapterRepository.saveChapter(chapter);
      }

      // Compute completion based on work's total number of chapters against current chapter number
      // For one-shot works, completion is based on scroll position
      // For works without total chapters, we compute read chapters (current chapter number/total current chapters)
      if (work.oneshot) {
        completion = totalScrollPosition != null && totalScrollPosition > 0
            ? (scrollPosition / totalScrollPosition).clamp(0, 1)
            : 1.0; // Default to 100% if no total scroll position
      } else if (work.totalChapters != null && work.totalChapters! > 0) {
        completion = (chapter.chapter / work.totalChapters!).clamp(0, 1);
      } else {
        // If no total chapters, assume completion is based on current chapter count
        completion = chapter.chapter / work.chapters;
      }

      ReadHistory readHistory = ReadHistory(
        work: work,
        chapter: chapter,
        timestamp: DateTime.now(),
        position: scrollPosition,
        status: ReadStatus.IN_PROGRESS,
        completion: completion,
      );

      // Save to database (insertOnConflictUpdate will handle upsert)
      await ReadHistoryRepository.saveReadHistory(readHistory);
    } catch (e) {
      print('Error saving read history: $e');
    }
  }

  /// Fetches the read history for a specific work.
  ///
  /// Returns a [ReadHistory] object if found, or null if not found or an error occurs.
  Future<ReadHistory?> getReadHistory(Work work) async {
    try {
      return await ReadHistoryRepository.getReadHistory(work.id);
    } catch (e) {
      print('Error fetching read history: $e');
      return null;
    }
  }

  /// Fetches the latest read history for a specific work.
  ///
  /// Returns a [ReadHistory] object if found, or null if not found or an error occurs.
  Future<ReadHistory?> getLatestReadHistory(Work work) async {
    try {
      List<ReadHistory> histories =
          await ReadHistoryRepository.getReadHistoryByStatus(
            ReadStatus.IN_PROGRESS,
          );
      try {
        return histories.firstWhere((history) => history.work.id == work.id);
      } catch (e) {
        return null;
      }
    } catch (e) {
      print('Error fetching latest read history: $e');
      return null;
    }
  }

  /// Fetches the most latest read history.
  ///
  /// Returns a [ReadHistory] object if found, or null if not found or an error occurs.
  Future<ReadHistory?> getMostRecentReadHistory() async {
    try {
      List<ReadHistory> histories =
          await ReadHistoryRepository.getRecentReadHistory();
      if (histories.isNotEmpty) {
        return histories.first;
      }
      return null;
    } catch (e) {
      print('Error fetching most recent read history: $e');
      return null;
    }
  }

  /// Deletes the read history for a specific work.
  ///
  /// Returns true if the deletion was successful, false otherwise.
  Future<bool> deleteReadHistory(Work work) async {
    try {
      await ReadHistoryRepository.deleteReadHistory(work.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Fetches paginated grouped read history.
  ///
  /// Returns a list of maps containing group names and their items.
  Future<Map<int, List<ReadHistory>>> getPaginatedGroupedHistory({
    int offset = 0,
  }) async {
    try {
      List<ReadHistory> list = await ReadHistoryRepository.getReadHistoryList(
        offset: offset,
      );

      return {offset: list};
    } catch (e) {
      print('Error fetching paginated grouped history: $e');
      return {};
    }
  }

  /// Checks if there's more history beyond the current pagination
  Future<bool> hasMoreHistory(int currentOffset) async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final nextDate = today.subtract(Duration(days: currentOffset));

      return await ReadHistoryRepository.hasHistoryBeyondDate(nextDate);
    } catch (e) {
      print('Error checking for more history: $e');
      return false;
    }
  }

  /// Gets the total count of read history entries.
  Future<int> getReadHistoryCount() async {
    try {
      return await ReadHistoryRepository.getReadHistoryCount();
    } catch (e) {
      print('Error fetching read history count: $e');
      return 0;
    }
  }
}
