import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:drift/drift.dart';

extension ChaptersDao on AppDatabase {
  // Insert or update chapter
  Future<void> insertOrUpdateChapter(Chapter chapter) async {
    await into(chaptersTable).insertOnConflictUpdate(
      ChaptersTableCompanion(
        workId: Value(chapter.workId),
        id: Value(chapter.id),
        chapter: Value(chapter.chapter),
        title: Value(chapter.title),
        publishDate: Value(chapter.publishDate),
        summary: Value(chapter.summary),
        preface: Value(chapter.preface),
        postface: Value(chapter.postface),
        content: Value(chapter.content),
        words: Value(chapter.words),
        comments: Value(chapter.comments),
        oneshot: Value(chapter.oneshot),
      ),
    );
  }

  // Get chapter by ID
  Future<Chapter?> getChapter(int chapterId) async {
    final chapterData = await (select(
      chaptersTable,
    )..where((c) => c.id.equals(chapterId))).getSingleOrNull();

    if (chapterData == null) return null;

    return Chapter(
      oneshot: chapterData.oneshot,
      workId: chapterData.workId,
      id: chapterData.id,
      chapter: chapterData.chapter,
      title: chapterData.title,
      publishDate: chapterData.publishDate,
      summary: chapterData.summary,
      preface: chapterData.preface,
      postface: chapterData.postface,
      content: chapterData.content,
      words: chapterData.words,
      comments: chapterData.comments,
    );
  }

  // Get all chapters for a work
  Future<List<Chapter>> getChaptersByWork(int workId) async {
    final chapterDataList = await (select(
      chaptersTable,
    )..where((c) => c.workId.equals(workId))).get();

    return chapterDataList.map((data) {
      return Chapter(
        oneshot: data.oneshot,
        workId: data.workId,
        id: data.id,
        chapter: data.chapter,
        title: data.title,
        publishDate: data.publishDate,
        summary: data.summary,
        preface: data.preface,
        postface: data.postface,
        content: data.content,
        words: data.words,
        comments: data.comments,
      );
    }).toList();
  }

  // Delete a chapter by ID
  Future<void> deleteChapter(int chapterId) async {
    await (delete(chaptersTable)..where((c) => c.id.equals(chapterId))).go();
  }

  // Check if a chapter exists
  Future<bool> chapterExists(int chapterId) async {
    final result = await (select(
      chaptersTable,
    )..where((c) => c.id.equals(chapterId))).get();
    return result.isNotEmpty;
  }

  // Check if chapter is used by any read history except given ID
  Future<bool> isChapterUsedInReadHistory(
    int chapterId, {
    int? excludeId,
  }) async {
    final query = select(readHistoriesTable)
      ..where((h) => h.chapterId.equals(chapterId));

    if (excludeId != null) {
      query.where((h) => h.workId.isNotValue(excludeId));
    }

    final result = await query.get();
    return result.isNotEmpty;
  }
}
