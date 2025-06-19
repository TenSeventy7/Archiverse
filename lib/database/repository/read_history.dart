import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/read_history.dart';

extension ReadHistoryRepository on DataRepository {
  static Future<void> saveReadHistory(ReadHistory history) async {
    await DataRepository.database.insertOrUpdateReadHistory(history);
  }

  static Future<ReadHistory?> getReadHistory(int workId) async {
    return await DataRepository.database.getReadHistory(workId);
  }

  static Future<List<ReadHistory>> getAllReadHistory() async {
    return await DataRepository.database.getAllReadHistory();
  }

  static Future<List<ReadHistory>> getRecentReadHistory({
    int limit = 50,
  }) async {
    return await DataRepository.database.getRecentReadHistory(limit: limit);
  }

  static Future<List<ReadHistory>> getReadHistoryByStatus(
    ReadStatus status,
  ) async {
    return await DataRepository.database.getReadHistoryByStatus(status);
  }

  static Future<List<ReadHistory>> getCurrentlyReading() async {
    return await DataRepository.database.getCurrentlyReading();
  }

  static Future<List<ReadHistory>> getCompletedWorks() async {
    return await DataRepository.database.getCompletedWorks();
  }

  static Future<void> startReading(int workId, {int? chapterId}) async {
    await DataRepository.database.startReading(workId, chapterId: chapterId);
  }

  static Future<void> markAsCompleted(int workId) async {
    await DataRepository.database.markAsCompleted(workId);
  }

  static Future<void> updateReadingPosition(
    int workId,
    int position, {
    int? chapterId,
  }) async {
    await DataRepository.database.updateReadingPosition(
      workId,
      position,
      chapterId: chapterId,
    );
  }

  static Future<void> updateReadingStatus(
    int workId,
    ReadStatus status, {
    double? completion,
  }) async {
    await DataRepository.database.updateReadingStatus(
      workId,
      status,
      completion: completion,
    );
  }

  static Future<void> updateCompletion(int workId, double completion) async {
    await DataRepository.database.updateCompletion(workId, completion);
  }

  static Future<void> deleteReadHistory(int workId) async {
    await DataRepository.database.deleteReadHistory(workId);
  }

  static Future<bool> hasReadHistory(int workId) async {
    return await DataRepository.database.hasReadHistory(workId);
  }

  static Future<int> getReadHistoryCount() async {
    return await DataRepository.database.getReadHistoryCount();
  }

  static Future<int> getReadHistoryCountByStatus(ReadStatus status) async {
    return await DataRepository.database.getReadHistoryCountByStatus(status);
  }

  static Future<Map<ReadStatus, int>> getReadingStatistics() async {
    return await DataRepository.database.getReadingStatistics();
  }

  static Future<List<ReadHistory>> getWorksReadInDateRange(
    DateTime start,
    DateTime end,
  ) async {
    return await DataRepository.database.getWorksReadInDateRange(start, end);
  }

  static Future<List<ReadHistory>> searchReadHistory(String query) async {
    return await DataRepository.database.searchReadHistory(query);
  }

  static Future<List<ReadHistory>> getReadHistoryByDateRange(
    DateTime startDate,
    DateTime endDate, {
    int limit = 20,
    int offset = 0,
  }) async {
    return await DataRepository.database.getReadHistoryByDateRange(
      startDate,
      endDate,
      limit: limit,
      offset: offset,
    );
  }

  static Future<Map<String, List<ReadHistory>>> getGroupedReadHistory({
    int daysBack = 30,
    int limit = 20,
    int offset = 0,
  }) async {
    return await DataRepository.database.getGroupedReadHistory(
      daysBack: daysBack,
      limit: limit,
      offset: offset,
    );
  }

  static Future<List<ReadHistory>> getReadHistoryForToday() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await DataRepository.database.getWorksReadInDateRange(
      startOfDay,
      endOfDay,
    );
  }

  static Future<List<ReadHistory>> getReadHistoryForYesterday() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final startOfDay = DateTime(yesterday.year, yesterday.month, yesterday.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await DataRepository.database.getWorksReadInDateRange(
      startOfDay,
      endOfDay,
    );
  }

  static Future<List<ReadHistory>> getReadHistoryForLastWeek() async {
    final now = DateTime.now();
    final lastWeek = now.subtract(const Duration(days: 7));
    final yesterday = now.subtract(const Duration(days: 1));
    final startOfWeek = DateTime(lastWeek.year, lastWeek.month, lastWeek.day);
    final endOfWeek = DateTime(yesterday.year, yesterday.month, yesterday.day);

    return await DataRepository.database.getWorksReadInDateRange(
      startOfWeek,
      endOfWeek,
    );
  }
}
