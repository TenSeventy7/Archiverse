import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

@DriftAccessor(tables: [DbChapters])
class ChaptersDao extends BaseDao<DbChapters, DbChapter, Chapter> {
  ChaptersDao(super.db);

  @override
  TableInfo<DbChapters, DbChapter> get table => db.dbChapters;

  @override
  Insertable<DbChapter> toCompanion(Chapter chapter) {
    return DbChaptersCompanion(
      id: Value(chapter.id),
      workId: Value(chapter.workId),
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
    );
  }

  @override
  Chapter fromRow(DbChapter row) {
    return Chapter(
      id: row.id,
      workId: row.workId,
      chapter: row.chapter,
      title: row.title,
      publishDate: row.publishDate,
      summary: row.summary,
      preface: row.preface,
      postface: row.postface,
      content: row.content,
      words: row.words,
      comments: row.comments,
      oneshot: row.oneshot,
    );
  }

  Future<List<Chapter>> getChaptersByWork(int workId) async {
    final chapters = await getMultiple((c) => c.workId.equals(workId));
    return chapters.map((c) => fromRow(c)).toList();
  }

  Future<Chapter> getChapterById(int chapterId) async {
    final chapter = await getSingle((c) => c.id.equals(chapterId));
    if (chapter == null) {
      throw Exception('Chapter with ID $chapterId not found');
    }

    return fromRow(chapter);
  }

  Future<void> deleteChapter(int chapterId) async {
    final deleted = await deleteWhere((c) => c.id.equals(chapterId));
    if (!deleted) {
      throw Exception('Failed to delete chapter with ID $chapterId');
    }
  }

  Future<bool> chapterExists(int chapterId) async {
    return await exists((c) => c.id.equals(chapterId));
  }

  Future<bool> isChapterUsedInReadHistory(
    int chapterId, {
    int? excludeId,
  }) async {
    final query = selectOnly(db.dbReadHistories)
      ..addColumns([db.dbReadHistories.chapterId])
      ..where(db.dbReadHistories.chapterId.equals(chapterId));

    if (excludeId != null) {
      query.where(db.dbReadHistories.workId.isNotValue(excludeId));
    }

    final result = await query.get();
    return result.isNotEmpty;
  }
}
