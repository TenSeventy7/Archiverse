import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/chapter.dart';

extension ChapterRepository on DataRepository {
  static Future<void> saveChapter(Chapter chapter) async {
    await DataRepository.database.chaptersDao.insertOrUpdate(chapter);
  }

  static Future<Chapter?> getChapter(int chapterId) async {
    return await DataRepository.database.chaptersDao.getChapterById(chapterId);
  }

  static Future<List<Chapter>> getChaptersByWork(int workId) async {
    return await DataRepository.database.chaptersDao.getChaptersByWork(workId);
  }

  static Future<void> deleteChapter(int chapterId) async {
    await DataRepository.database.chaptersDao.deleteChapter(chapterId);
  }

  static Future<bool> chapterExists(int chapterId) async {
    return await DataRepository.database.chaptersDao.chapterExists(chapterId);
  }

  static Future<bool> isChapterUsedInReadHistory(
    int chapterId, {
    int? workId,
  }) async {
    return await DataRepository.database.chaptersDao.isChapterUsedInReadHistory(
      chapterId,
      excludeId: workId,
    );
  }
}
