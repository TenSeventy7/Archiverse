import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/work.dart';

extension WorkRepository on DataRepository {
  static Future<void> saveWork(Work work) async {
    await DataRepository.database.insertWorkComplete(work);
  }

  static Future<Work?> getWork(int workId) async {
    return await DataRepository.database.getWorkComplete(workId);
  }

  static Future<List<Work>> searchWorks(String query) async {
    return await DataRepository.database.searchWorks(query);
  }

  static Future<List<Work>> getAllWorks() async {
    return await DataRepository.database.getAllWorks();
  }

  static Future<List<Work>> getRecentWorks({int limit = 20}) async {
    return await DataRepository.database.getRecentWorks(limit: limit);
  }

  static Future<void> deleteWork(int workId) async {
    await DataRepository.database.deleteWork(workId);
  }

  static Future<void> updateWorkStats(
    int workId, {
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    DateTime? updateDate,
  }) async {
    await DataRepository.database.updateWorkStats(
      workId,
      comments: comments,
      kudos: kudos,
      bookmarks: bookmarks,
      hits: hits,
      updateDate: updateDate,
    );
  }

  static Future<bool> workExists(int workId) async {
    return await DataRepository.database.workExists(workId);
  }

  static Future<int> getWorkCount() async {
    return await DataRepository.database.getWorkCount();
  }
}
