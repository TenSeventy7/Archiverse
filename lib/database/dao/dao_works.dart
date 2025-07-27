import 'dart:convert';
import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:drift/drift.dart';

import 'dao_base.dart';

part 'dao_works.g.dart';

@DriftAccessor(tables: [DbWorks])
class WorksDao extends BaseDao<DbWorks, DbWork, Work> {
  WorksDao(super.db);

  @override
  TableInfo<DbWorks, DbWork> get table => db.dbWorks;

  @override
  Insertable<DbWork> toCompanion(Work work) {
    return DbWorksCompanion(
      id: Value(work.id),
      title: Value(work.title),
      summary: Value(work.summary),
      requiresAuth: Value(work.requiresAuth),
      updateDate: Value(work.updateDate),
      words: Value(work.words),
      chapters: Value(work.chapters),
      comments: Value(work.comments),
      kudos: Value(work.kudos),
      bookmarks: Value(work.bookmarks),
      hits: Value(work.hits),
      totalChapters: Value(work.totalChapters),
      language: Value(work.language),
      finished: Value(work.finished),
      rating: Value(work.rating.name),
      relationship: Value(
        jsonEncode(work.relationship.map((r) => r.name).toList()),
      ),
      warnings: Value(jsonEncode(work.warnings.map((w) => w.name).toList())),
      publishDate: Value(work.publishDate),
      completedDate: Value(work.completedDate),
      notes: Value(work.notes),
      giftMessage: Value(work.giftMessage),
      subscriptions: Value(work.subscriptions),
    );
  }

  @override
  Work fromRow(DbWork row) {
    // Note: This returns a basic Work without related data
    // Use getWorkComplete for full work with relationships
    return Work(
      id: row.id,
      title: row.title,
      summary: row.summary,
      requiresAuth: row.requiresAuth,
      updateDate: row.updateDate,
      words: row.words,
      chapters: row.chapters,
      comments: row.comments,
      kudos: row.kudos,
      bookmarks: row.bookmarks,
      hits: row.hits,
      totalChapters: row.totalChapters,
      language: row.language,
      finished: row.finished,
      rating: AgeRating.values.firstWhere((r) => r.name == row.rating),
      relationship: (jsonDecode(row.relationship) as List)
          .map((r) => RelationshipType.values.firstWhere((rt) => rt.name == r))
          .toList(),
      warnings: (jsonDecode(row.warnings) as List)
          .map((w) => WarningType.values.firstWhere((wt) => wt.name == w))
          .toList(),
      publishDate: row.publishDate,
      completedDate: row.completedDate,
      notes: row.notes,
      giftMessage: row.giftMessage,
      subscriptions: row.subscriptions,
      // These will be empty - use getWorkComplete for full data
      authors: [],
      fandoms: [],
      relationships: [],
      characters: [],
      tags: [],
      series: [],
    );
  }

  // Custom methods for complex operations
  Future<void> insertOrUpdateWorkComplete(Work work) async {
    await transaction(() async {
      // Insert/update the basic work
      await insertOrUpdate(work);

      // Use separate DAOs for related data
      await db.authorsDao.insertOrUpdateWorkAuthors(work.id, work.authors);
      await db.tagsDao.insertOrUpdateWorkTags(
        work.id,
        work.fandoms,
        TagType.FANDOM,
      );
      await db.tagsDao.insertOrUpdateWorkTags(
        work.id,
        work.relationships,
        TagType.RELATIONSHIP,
      );
      await db.tagsDao.insertOrUpdateWorkTags(
        work.id,
        work.characters,
        TagType.CHARACTER,
      );
      await db.tagsDao.insertOrUpdateWorkTags(
        work.id,
        work.tags,
        TagType.FREEFORM,
      );

      // Handle series relationships
      if (work.series.isNotEmpty) {
        // Get all Series inside SeriesWork
        var series = work.series.whereType<Series>().toList();
        if (series.isNotEmpty) {
          // Save series and link to work
          await _saveWorkSeries(work.id, series);
        }
      }
    });
  }

  Future<Work?> getWorkComplete(int workId) async {
    final workData = await getSingle((w) => w.id.equals(workId));
    if (workData == null) return null;

    // Use separate DAOs to get related data
    final authors = await db.authorsDao.getWorkAuthors(workId);
    final fandoms = await db.tagsDao.getWorkTags(workId, TagType.FANDOM);
    final relationships = await db.tagsDao.getWorkTags(
      workId,
      TagType.RELATIONSHIP,
    );
    final characters = await db.tagsDao.getWorkTags(workId, TagType.CHARACTER);
    final workTagsList = await db.tagsDao.getWorkTags(workId, TagType.FREEFORM);
    final series = await db.seriesDao.getWorkSeries(workId);

    return Work(
      id: workData.id,
      title: workData.title,
      summary: workData.summary,
      requiresAuth: workData.requiresAuth,
      series: series,
      updateDate: workData.updateDate,
      authors: authors,
      words: workData.words,
      chapters: workData.chapters,
      comments: workData.comments,
      kudos: workData.kudos,
      bookmarks: workData.bookmarks,
      hits: workData.hits,
      totalChapters: workData.totalChapters,
      language: workData.language,
      finished: workData.finished,
      fandoms: fandoms,
      relationships: relationships,
      characters: characters,
      tags: workTagsList,
      rating: AgeRating.values.firstWhere((r) => r.name == workData.rating),
      relationship: (jsonDecode(workData.relationship) as List)
          .map((r) => RelationshipType.values.firstWhere((rt) => rt.name == r))
          .toList(),
      warnings: (jsonDecode(workData.warnings) as List)
          .map((w) => WarningType.values.firstWhere((wt) => wt.name == w))
          .toList(),
      publishDate: workData.publishDate,
      completedDate: workData.completedDate,
      notes: workData.notes,
      giftMessage: workData.giftMessage,
      subscriptions: workData.subscriptions,
    );
  }

  // Helper method to save work series relationships
  Future<void> _saveWorkSeries(int workId, List<Series> seriesList) async {
    // Remove existing series relationships for this work
    await (delete(
      db.dbWorkSeries,
    )..where((ws) => ws.workId.equals(workId))).go();

    // Add new series relationships
    for (final series in seriesList) {
      // Save/update the series itself
      final seriesId = await db.seriesDao.insertOrUpdateSeriesAndGetId(series);

      // Get the next part number for this series
      final partNumber = await db.seriesDao.getNextPartNumber(seriesId);

      // Link work to series
      await db.seriesDao.linkWorkToSeries(workId, seriesId, partNumber);
    }
  }

  Future<List<Work>> searchWorks(String query) async {
    final works = await (select(
      table,
    )..where((w) => w.title.contains(query) | w.summary.contains(query))).get();

    return works.map((w) => fromRow(w)).toList();
  }

  Future<List<Work>> getRecentWorks({int limit = 20}) async {
    final works =
        await (select(table)
              ..orderBy([(w) => OrderingTerm.desc(w.updateDate)])
              ..limit(limit))
            .get();

    return works.map((w) => fromRow(w)).toList();
  }

  Future<void> updateWorkStats(
    int workId, {
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    DateTime? updateDate,
  }) async {
    await (update(table)..where((w) => w.id.equals(workId))).write(
      DbWorksCompanion(
        comments: comments != null ? Value(comments) : const Value.absent(),
        kudos: kudos != null ? Value(kudos) : const Value.absent(),
        bookmarks: bookmarks != null ? Value(bookmarks) : const Value.absent(),
        hits: hits != null ? Value(hits) : const Value.absent(),
        updateDate: updateDate != null
            ? Value(updateDate)
            : const Value.absent(),
      ),
    );

    // If the work was updated, recalculate series stats
    if (updateDate != null) {
      await _updateSeriesStatsForWork(workId);
    }
  }

  // Helper method to update series statistics when a work changes
  Future<void> _updateSeriesStatsForWork(int workId) async {
    final seriesList = await db.seriesDao.getWorkSeries(workId);
    for (final series in seriesList) {
      await db.seriesDao.recalculateSeriesStats(series.series.id);
    }
  }

  // Get works in a series (ordered by part number)
  Future<List<Work>> getWorksInSeries(int seriesId) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorkSeries,
              db.dbWorkSeries.workId.equalsExp(table.asDslTable.id),
            ),
          ])
          ..where(db.dbWorkSeries.seriesId.equals(seriesId))
          ..orderBy([OrderingTerm.asc(db.dbWorkSeries.part)]);

    final results = await query.get();
    return results.map((row) => fromRow(row.readTable(table))).toList();
  }

  // Get works by author that are part of series
  Future<List<Work>> getAuthorWorksInSeries(int authorId) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorkAuthors,
              db.dbWorkAuthors.workId.equalsExp(table.asDslTable.id),
            ),
            innerJoin(
              db.dbWorkSeries,
              db.dbWorkSeries.workId.equalsExp(table.asDslTable.id),
            ),
          ])
          ..where(db.dbWorkAuthors.authorId.equals(authorId))
          ..orderBy([
            OrderingTerm.asc(db.dbWorkSeries.seriesId),
            OrderingTerm.asc(db.dbWorkSeries.part),
          ]);

    final results = await query.get();
    return results.map((row) => fromRow(row.readTable(table))).toList();
  }

  // Check if work is part of any series
  Future<bool> isWorkInSeries(int workId) async {
    final count =
        await (selectOnly(db.dbWorkSeries)
              ..addColumns([db.dbWorkSeries.workId.count()])
              ..where(db.dbWorkSeries.workId.equals(workId)))
            .getSingle();

    return (count.read(db.dbWorkSeries.workId.count()) ?? 0) > 0;
  }

  // Get standalone works (not part of any series)
  Future<List<Work>> getStandaloneWorks({int limit = 50}) async {
    final query =
        select(table).join([
            leftOuterJoin(
              db.dbWorkSeries,
              db.dbWorkSeries.workId.equalsExp(table.asDslTable.id),
            ),
          ])
          ..where(db.dbWorkSeries.workId.isNull())
          ..orderBy([OrderingTerm.desc(table.asDslTable.updateDate)])
          ..limit(limit);

    final results = await query.get();
    return results.map((row) => fromRow(row.readTable(table))).toList();
  }

  Future<List<int>> getAllWorkIds() async {
    final results = await select(table).get();
    return results.map((w) => w.id).toList();
  }
}
