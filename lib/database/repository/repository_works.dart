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
}
