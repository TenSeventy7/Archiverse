import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/work.dart';

extension WorkRepository on DataRepository {
  static Future<void> saveWork(Work work) async {
    await DataRepository.database.worksDao.insertOrUpdateWorkComplete(work);
  }

  static Future<Work?> getWork(int workId) async {
    return await DataRepository.database.worksDao.getWorkComplete(workId);
  }

  static Future<List<Work>> searchWorks(String query) async {
    return await DataRepository.database.worksDao.searchWorks(query);
  }

  static Future<List<Work>> getAllWorks() async {
    final works = await DataRepository.database.worksDao.getAll();
    return works
        .map((w) => DataRepository.database.worksDao.fromRow(w))
        .toList();
  }

  static Future<List<Work>> getRecentWorks({int limit = 20}) async {
    return await DataRepository.database.worksDao.getRecentWorks(limit: limit);
  }

  static Future<void> deleteWork(int workId) async {
    await DataRepository.database.worksDao.deleteWhere(
      (w) => w.id.equals(workId),
    );
  }

  static Future<void> updateWorkStats(
    int workId, {
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    DateTime? updateDate,
  }) async {
    await DataRepository.database.worksDao.updateWorkStats(
      workId,
      comments: comments,
      kudos: kudos,
      bookmarks: bookmarks,
      hits: hits,
      updateDate: updateDate,
    );
  }

  static Future<bool> workExists(int workId) async {
    return await DataRepository.database.worksDao.exists(
      (w) => w.id.equals(workId),
    );
  }

  static Future<int> getWorkCount() async {
    return await DataRepository.database.worksDao.getCount();
  }

  // Clean up a work ID that is no longer in use
  // Used in deleting works from a library or read history
  static Future<void> cleanUpWork(int workId) async {
    if (await DataRepository.database.worksDao.exists(
      (w) => w.id.equals(workId),
    )) {
      // Check if the work is still in library or read history
      // For users, must delete it first from library and read history
      final inLibrary = await DataRepository.database.libraryDao.containsWork(
        workId,
      );
      final inReadHistory = await DataRepository.database.readHistoriesDao
          .hasReadHistory(workId);

      if (!inLibrary && !inReadHistory) {
        await DataRepository.database.worksDao.deleteWhere(
          (w) => w.id.equals(workId),
        );
      } else {
        // Optionally, log or handle the case where the work is still in use
        print('Work $workId is still in use in library or read history.');
      }
    }
  }

  // Clean up works that are no longer in the library or read history
  static Future<void> cleanUpOrphanedWorks() async {
    final allWorkIds = await DataRepository.database.worksDao.getAllWorkIds();
    final libraryWorkIds = await DataRepository.database.libraryDao
        .getAllWorkIds();
    final readHistoryWorkIds = await DataRepository.database.readHistoriesDao
        .getAllReadHistoryWorkIds();

    final orphanedWorkIds = allWorkIds
        .where(
          (id) =>
              !libraryWorkIds.contains(id) && !readHistoryWorkIds.contains(id),
        )
        .toList();

    for (final workId in orphanedWorkIds) {
      await DataRepository.database.worksDao.deleteWhere(
        (w) => w.id.equals(workId),
      );
    }
  }
}
