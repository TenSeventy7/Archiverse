import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/chapter.dart';

extension ChapterRepository on DataRepository {
  static Future<void> saveChapter(Chapter chapter) async {
    await DataRepository.database.insertOrUpdateChapter(chapter);
  }

  static Future<Chapter?> getChapter(int chapterId) async {
    return await DataRepository.database.getChapter(chapterId);
  }

  static Future<List<Chapter>> getChaptersByWork(int workId) async {
    return await DataRepository.database.getChaptersByWork(workId);
  }

  static Future<void> deleteChapter(int chapterId) async {
    await DataRepository.database.deleteChapter(chapterId);
  }

  static Future<bool> chapterExists(int chapterId) async {
    return await DataRepository.database.chapterExists(chapterId);
  }

  static Future<bool> isChapterUsedInReadHistory(
    int chapterId, {
    int? workId,
  }) async {
    return await DataRepository.database.isChapterUsedInReadHistory(
      chapterId,
      excludeId: workId,
    );
  }
}
