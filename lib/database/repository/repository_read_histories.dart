import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/read_history.dart';

extension ReadHistoryRepository on DataRepository {
  static Future<void> saveReadHistory(ReadHistory history) async {
    await DataRepository.database.readHistoriesDao.insertReadHistoryComplete(
      history,
    );
  }

  static Future<ReadHistory?> getReadHistory(int workId) async {
    return await DataRepository.database.readHistoriesDao
        .getReadHistoryComplete(workId);
  }

  static Future<List<ReadHistory>> getAllReadHistory() async {
    return await DataRepository.database.readHistoriesDao
        .getAllReadHistoryComplete();
  }

  static Future<List<ReadHistory>> getRecentReadHistory({
    int limit = 50,
  }) async {
    return await DataRepository.database.readHistoriesDao.getRecentReadHistory(
      limit: limit,
    );
  }

  static Future<List<ReadHistory>> getCurrentlyReading() async {
    return await DataRepository.database.readHistoriesDao.getCurrentlyReading();
  }

  static Future<List<ReadHistory>> getCompletedWorks() async {
    return await DataRepository.database.readHistoriesDao.getCompletedWorks();
  }

  static Future<void> updateReadingPosition(
    int workId,
    int position, {
    int? chapterId,
  }) async {
    await DataRepository.database.readHistoriesDao.updateReadingPosition(
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
    await DataRepository.database.readHistoriesDao.updateReadingStatus(
      workId,
      status,
      completion: completion,
    );
  }

  static Future<void> markAsCompleted(int workId) async {
    await DataRepository.database.readHistoriesDao.markAsCompleted(workId);
  }

  static Future<void> startReading(int workId, {int? chapterId}) async {
    await DataRepository.database.readHistoriesDao.startReading(
      workId,
      chapterId: chapterId,
    );
  }

  static Future<void> deleteReadHistory(int workId) async {
    await DataRepository.database.readHistoriesDao.deleteWhere(
      (h) => h.workId.equals(workId),
    );
  }

  static Future<bool> hasReadHistory(int workId) async {
    return await DataRepository.database.readHistoriesDao.hasReadHistory(
      workId,
    );
  }

  static Future<Map<ReadStatus, int>> getReadingStatistics() async {
    return await DataRepository.database.readHistoriesDao
        .getReadingStatistics();
  }

  static Future<List<ReadHistory>> searchReadHistory(String query) async {
    return await DataRepository.database.readHistoriesDao.searchReadHistory(
      query,
    );
  }

  // Performance-optimized method for UI lists
  static Future<List<ReadHistory>> getReadHistoryLightweight({
    int limit = 50,
  }) async {
    return await DataRepository.database.readHistoriesDao
        .getReadHistoryLightweight(limit: limit);
  }

  static Future<List<ReadHistory>> getReadHistoryByStatus(
    ReadStatus status, {
    int limit = 50,
  }) async {
    return await DataRepository.database.readHistoriesDao
        .getReadHistoryByStatus(status, limit: limit);
  }

  static Future<List<ReadHistory>> getReadHistoryList({int offset = 0}) async {
    return await DataRepository.database.readHistoriesDao.getReadHistoryList(
      offset: offset,
    );
  }

  static Future<bool> hasHistoryBeyondDate(
    DateTime date, {
    ReadStatus? status,
  }) async {
    return await DataRepository.database.readHistoriesDao.hasHistoryBeyondDate(
      date,
    );
  }

  static Future<int> getReadHistoryCount() async {
    return await DataRepository.database.readHistoriesDao.getCount();
  }
}
