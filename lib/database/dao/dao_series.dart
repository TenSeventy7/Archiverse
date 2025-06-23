import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/work.dart' as work;
import 'package:drift/drift.dart';
import 'dao_base.dart';

@DriftAccessor(tables: [DbSeries, DbWorkSeries])
class SeriesDao extends BaseDao<DbSeries, DbSery, Series> {
  SeriesDao(super.db);

  @override
  TableInfo<DbSeries, DbSery> get table => db.dbSeries;

  @override
  Insertable<DbSery> toCompanion(Series series) {
    return DbSeriesCompanion(
      id: Value(series.id),
      title: Value(series.title),
      summary: Value(series.summary),
      words: Value(series.words),
      works: Value(series.works),
      bookmarks: Value(series.bookmarks),
      updateDate: Value(series.updateDate),
      finished: Value(series.finished),
      publishDate: Value(series.publishDate),
      notes: Value(series.notes),
    );
  }

  @override
  Series fromRow(DbSery row) {
    return Series(
      id: row.id,
      title: row.title,
      summary: row.summary,
      words: row.words,
      works: row.works,
      bookmarks: row.bookmarks,
      updateDate: row.updateDate,
      finished: row.finished,
      publishDate: row.publishDate,
      notes: row.notes,
    );
  }

  // Get series by ID
  Future<Series?> getSeriesById(int seriesId) async {
    final series = await getSingle((s) => s.id.equals(seriesId));
    return series != null ? fromRow(series) : null;
  }

  // Search series by title
  Future<List<Series>> searchSeries(String query, {int limit = 50}) async {
    final seriesList =
        await (select(table)
              ..where(
                (s) => s.title.contains(query) | s.summary.contains(query),
              )
              ..orderBy([(s) => OrderingTerm.desc(s.updateDate)])
              ..limit(limit))
            .get();

    return seriesList.map((s) => fromRow(s)).toList();
  }

  // Get popular series (by work count)
  Future<List<Series>> getPopularSeries({int limit = 50}) async {
    final seriesList =
        await (select(table)
              ..orderBy([(s) => OrderingTerm.desc(s.works)])
              ..limit(limit))
            .get();

    return seriesList.map((s) => fromRow(s)).toList();
  }

  // Get recent series (by update date)
  Future<List<Series>> getRecentSeries({int limit = 50}) async {
    final seriesList =
        await (select(table)
              ..orderBy([(s) => OrderingTerm.desc(s.updateDate)])
              ..limit(limit))
            .get();

    return seriesList.map((s) => fromRow(s)).toList();
  }

  // Get completed series
  Future<List<Series>> getCompletedSeries({int limit = 50}) async {
    final seriesList =
        await (select(table)
              ..where((s) => s.finished.equals(true))
              ..orderBy([(s) => OrderingTerm.desc(s.updateDate)])
              ..limit(limit))
            .get();

    return seriesList.map((s) => fromRow(s)).toList();
  }

  // Get ongoing series
  Future<List<Series>> getOngoingSeries({int limit = 50}) async {
    final seriesList =
        await (select(table)
              ..where((s) => s.finished.equals(false) | s.finished.isNull())
              ..orderBy([(s) => OrderingTerm.desc(s.updateDate)])
              ..limit(limit))
            .get();

    return seriesList.map((s) => fromRow(s)).toList();
  }

  // Get series for a specific work
  Future<List<work.SeriesWork>> getWorkSeries(int workId) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorkSeries,
              db.dbWorkSeries.seriesId.equalsExp(table.asDslTable.id),
            ),
          ])
          ..where(db.dbWorkSeries.workId.equals(workId))
          ..orderBy([OrderingTerm.asc(db.dbWorkSeries.part)]);

    final results = await query.get();

    return results.map((row) {
      final series = fromRow(row.readTable(table));
      final workSeries = row.readTable(db.dbWorkSeries);
      return work.SeriesWork(part: workSeries.part, series: series);
    }).toList();
  }

  // Get works in a series (ordered by part number)
  Future<List<SeriesWork>> getSeriesWorks(int seriesId) async {
    final query =
        select(db.dbWorkSeries).join([
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(db.dbWorkSeries.workId),
            ),
          ])
          ..where(db.dbWorkSeries.seriesId.equals(seriesId))
          ..orderBy([OrderingTerm.asc(db.dbWorkSeries.part)]);

    final results = await query.get();
    return results.map((row) {
      final workSeries = row.readTable(db.dbWorkSeries);
      final work = row.readTable(db.dbWorks);
      return SeriesWork(
        workId: workSeries.workId,
        seriesId: workSeries.seriesId,
        part: workSeries.part,
        workTitle: work.title,
        workSummary: work.summary,
      );
    }).toList();
  }

  // Link work to series
  Future<void> linkWorkToSeries(int workId, int seriesId, int part) async {
    await into(db.dbWorkSeries).insertOnConflictUpdate(
      DbWorkSeriesCompanion(
        workId: Value(workId),
        seriesId: Value(seriesId),
        part: Value(part),
      ),
    );
  }

  // Remove work from series
  Future<void> unlinkWorkFromSeries(int workId, int seriesId) async {
    await (delete(db.dbWorkSeries)..where(
          (ws) => ws.workId.equals(workId) & ws.seriesId.equals(seriesId),
        ))
        .go();
  }

  // Update work's part in series
  Future<void> updateWorkPartInSeries(
    int workId,
    int seriesId,
    int newPart,
  ) async {
    await (update(db.dbWorkSeries)..where(
          (ws) => ws.workId.equals(workId) & ws.seriesId.equals(seriesId),
        ))
        .write(DbWorkSeriesCompanion(part: Value(newPart)));
  }

  // Get work's part number in series
  Future<int?> getWorkPartInSeries(int workId, int seriesId) async {
    final workSeries =
        await (select(db.dbWorkSeries)..where(
              (ws) => ws.workId.equals(workId) & ws.seriesId.equals(seriesId),
            ))
            .getSingleOrNull();

    return workSeries?.part;
  }

  // Insert series and return the ID
  Future<int> insertSeriesAndGetId(Series series) async {
    return await into(table).insert(toCompanion(series));
  }

  // Insert or update series and return the ID
  Future<int> insertOrUpdateSeriesAndGetId(Series series) async {
    // Try to find existing series
    final existing = await getSeriesById(series.id);

    if (existing != null) {
      // Update the existing series
      await insertOrUpdate(series);
      return series.id;
    } else {
      // Insert new series
      return await insertSeriesAndGetId(series);
    }
  }

  // Update series statistics
  Future<void> updateSeriesStats(
    int seriesId, {
    int? words,
    int? works,
    int? bookmarks,
    DateTime? updateDate,
    bool? finished,
  }) async {
    await (update(table)..where((s) => s.id.equals(seriesId))).write(
      DbSeriesCompanion(
        words: words != null ? Value(words) : const Value.absent(),
        works: works != null ? Value(works) : const Value.absent(),
        bookmarks: bookmarks != null ? Value(bookmarks) : const Value.absent(),
        updateDate: updateDate != null
            ? Value(updateDate)
            : const Value.absent(),
        finished: finished != null ? Value(finished) : const Value.absent(),
      ),
    );
  }

  // Calculate and update series statistics based on its works
  Future<void> recalculateSeriesStats(int seriesId) async {
    final seriesWorks = await getSeriesWorks(seriesId);

    if (seriesWorks.isEmpty) return;

    // Get full work data for calculations
    final workIds = seriesWorks.map((sw) => sw.workId).toList();
    final works = await (select(
      db.dbWorks,
    )..where((w) => w.id.isIn(workIds))).get();

    final totalWords = works.fold<int>(0, (sum, work) => sum + work.words);
    final workCount = works.length;
    final latestUpdate = works
        .map((w) => w.updateDate)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    // Series is finished if all works are finished
    final allFinished = works.every((w) => w.finished == true);

    await updateSeriesStats(
      seriesId,
      words: totalWords,
      works: workCount,
      updateDate: latestUpdate,
      finished: allFinished,
    );
  }

  // Remove all works from a series
  Future<void> removeAllWorksFromSeries(int seriesId) async {
    await (delete(
      db.dbWorkSeries,
    )..where((ws) => ws.seriesId.equals(seriesId))).go();
  }

  // Get series count
  Future<int> getSeriesCount() async {
    return await getCount();
  }

  // Check if series exists
  Future<bool> seriesExists(int seriesId) async {
    return await exists((s) => s.id.equals(seriesId));
  }

  // Get next available part number for a series
  Future<int> getNextPartNumber(int seriesId) async {
    final maxPart =
        await (selectOnly(db.dbWorkSeries)
              ..addColumns([db.dbWorkSeries.part.max()])
              ..where(db.dbWorkSeries.seriesId.equals(seriesId)))
            .getSingleOrNull();

    final currentMax = maxPart?.read(db.dbWorkSeries.part.max()) ?? 0;
    return currentMax + 1;
  }

  // Reorder works in series (update part numbers)
  Future<void> reorderSeriesWorks(
    int seriesId,
    List<int> workIdsInOrder,
  ) async {
    await transaction(() async {
      for (int i = 0; i < workIdsInOrder.length; i++) {
        await updateWorkPartInSeries(workIdsInOrder[i], seriesId, i + 1);
      }
    });
  }

  // Get series statistics
  Future<Map<String, int>> getSeriesStatistics() async {
    final totalSeries = await getCount();
    final completedSeries = await getCount((s) => s.finished.equals(true));
    final ongoingSeries = await getCount(
      (s) => s.finished.equals(false) | s.finished.isNull(),
    );

    return {
      'total': totalSeries,
      'completed': completedSeries,
      'ongoing': ongoingSeries,
    };
  }
}

// Helper class for series work information
class SeriesWork {
  final int workId;
  final int seriesId;
  final int part;
  final String workTitle;
  final String workSummary;

  SeriesWork({
    required this.workId,
    required this.seriesId,
    required this.part,
    required this.workTitle,
    required this.workSummary,
  });
}
