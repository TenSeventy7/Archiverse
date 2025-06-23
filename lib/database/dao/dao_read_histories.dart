import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

@DriftAccessor(tables: [DbReadHistories, DbWorks, DbChapters])
class ReadHistoriesDao
    extends BaseDao<DbReadHistories, DbReadHistory, ReadHistory> {
  ReadHistoriesDao(super.db);

  @override
  TableInfo<DbReadHistories, DbReadHistory> get table => db.dbReadHistories;

  @override
  Insertable<DbReadHistory> toCompanion(ReadHistory history) {
    return DbReadHistoriesCompanion(
      workId: Value(history.work.id),
      chapterId: Value(history.chapter?.id),
      timestamp: Value(history.timestamp),
      position: Value(history.position),
      status: Value(history.status.name),
      completion: Value(history.completion),
    );
  }

  @override
  ReadHistory fromRow(DbReadHistory row) {
    // Note: This returns a basic ReadHistory without complete Work/Chapter data
    // Use getReadHistoryComplete for full data with relationships
    throw UnimplementedError(
      'Use getReadHistoryComplete instead - ReadHistory requires Work object',
    );
  }

  // Get read history with complete work and chapter data
  Future<ReadHistory?> getReadHistoryComplete(int workId) async {
    final historyData = await getSingle((h) => h.workId.equals(workId));
    if (historyData == null) return null;

    // Get complete work data using WorksDao
    final work = await db.worksDao.getWorkComplete(workId);
    if (work == null) return null;

    Chapter? chapter;
    if (historyData.chapterId != null) {
      final chapterData = await db.chaptersDao.getSingle(
        (c) => c.id.equals(historyData.chapterId!),
      );
      if (chapterData != null) {
        chapter = db.chaptersDao.fromRow(chapterData);
      }
    }

    return ReadHistory(
      work: work,
      chapter: chapter,
      timestamp: historyData.timestamp,
      position: historyData.position,
      status: ReadStatus.values.firstWhere((s) => s.name == historyData.status),
      completion: historyData.completion,
      hits: historyData.hits ?? 1, // Default to 1 if hits is null
    );
  }

  // Get all read history with complete data
  Future<List<ReadHistory>> getAllReadHistoryComplete() async {
    final historyRecords = await getAll();
    final histories = <ReadHistory>[];

    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get read history ordered by timestamp (most recent first)
  Future<List<ReadHistory>> getRecentReadHistory({int limit = 50}) async {
    final historyRecords =
        await (select(table)
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)])
              ..limit(limit))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get read history by status
  Future<List<ReadHistory>> getReadHistoryByStatus(
    ReadStatus status, {
    int limit = 50,
  }) async {
    final historyRecords =
        await (select(table)
              ..where((h) => h.status.equals(status.name))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)])
              ..limit(limit))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get currently reading works
  Future<List<ReadHistory>> getCurrentlyReading() async {
    return await getReadHistoryByStatus(ReadStatus.IN_PROGRESS);
  }

  // Get completed works
  Future<List<ReadHistory>> getCompletedWorks() async {
    return await getReadHistoryByStatus(ReadStatus.COMPLETED);
  }

  // Update reading position
  Future<void> updateReadingPosition(
    int workId,
    int position, {
    int? chapterId,
  }) async {
    await (update(table)..where((h) => h.workId.equals(workId))).write(
      DbReadHistoriesCompanion(
        position: Value(position),
        chapterId: chapterId != null ? Value(chapterId) : const Value.absent(),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  // Update reading status
  Future<void> updateReadingStatus(
    int workId,
    ReadStatus status, {
    double? completion,
  }) async {
    await (update(table)..where((h) => h.workId.equals(workId))).write(
      DbReadHistoriesCompanion(
        status: Value(status.name),
        completion: completion != null
            ? Value(completion)
            : const Value.absent(),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  // Update completion percentage
  Future<void> updateCompletion(int workId, double completion) async {
    await (update(table)..where((h) => h.workId.equals(workId))).write(
      DbReadHistoriesCompanion(
        completion: Value(completion),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  // Mark work as completed
  Future<void> markAsCompleted(int workId) async {
    await updateReadingStatus(workId, ReadStatus.COMPLETED, completion: 1.0);
  }

  // Start reading a work
  Future<void> startReading(int workId, {int? chapterId}) async {
    final existingHistory = await getReadHistoryComplete(workId);
    if (existingHistory != null) {
      // Update existing history
      await updateReadingStatus(workId, ReadStatus.IN_PROGRESS);
    } else {
      // Create new history entry
      final work = await db.worksDao.getWorkComplete(workId);
      if (work != null) {
        Chapter? chapter;
        if (chapterId != null) {
          final chapterData = await db.chaptersDao.getSingle(
            (c) => c.id.equals(chapterId),
          );
          if (chapterData != null) {
            chapter = db.chaptersDao.fromRow(chapterData);
          }
        }

        final newHistory = ReadHistory(
          work: work,
          chapter: chapter,
          timestamp: DateTime.now(),
          position: 0,
          status: ReadStatus.IN_PROGRESS,
          completion: 0.0,
        );

        await insertOrUpdate(newHistory);
      }
    }
  }

  // Check if work has read history
  Future<bool> hasReadHistory(int workId) async {
    return await exists((h) => h.workId.equals(workId));
  }

  // Get read history count by status
  Future<int> getReadHistoryCountByStatus(ReadStatus status) async {
    return await getCount((h) => h.status.equals(status.name));
  }

  // Get reading statistics
  Future<Map<ReadStatus, int>> getReadingStatistics() async {
    final stats = <ReadStatus, int>{};

    for (final status in ReadStatus.values) {
      final count = await getReadHistoryCountByStatus(status);
      stats[status] = count;
    }

    return stats;
  }

  // Get works read in a date range
  Future<List<ReadHistory>> getWorksReadInDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final historyRecords =
        await (select(table)
              ..where((h) => h.timestamp.isBetweenValues(start, end))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)]))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Search read history by work title
  Future<List<ReadHistory>> searchReadHistory(String query) async {
    final workIds =
        await (select(db.dbWorks)..where(
              (w) => w.title.contains(query) | w.summary.contains(query),
            ))
            .map((w) => w.id)
            .get();

    final histories = <ReadHistory>[];
    for (final workId in workIds) {
      final history = await getReadHistoryComplete(workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get paginated read history grouped by date
  Future<List<ReadHistory>> getReadHistoryList({int offset = 0}) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Calculate the date range for this "page" (specific day)
    final targetDate = today.subtract(Duration(days: offset));
    final startDate = targetDate;
    final endDate = targetDate
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));

    final historyRecords =
        await (select(table)
              ..where((h) => h.timestamp.isBetweenValues(startDate, endDate))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)]))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Helper method to check if there's any history beyond a certain date
  Future<bool> hasHistoryBeyondDate(DateTime date) async {
    final count = await getCount((h) => h.timestamp.isSmallerThanValue(date));
    return count > 0;
  }

  // Add hit to work history
  // Increments the hit count for a work in the read history.
  // This is separate from a work's general hit count, as this is instead used
  // to track how many times a work has been read by the user.
  // This is useful for analytics and personalized recommendations.
  Future<void> addHit(int workId, {int hits = 1}) async {
    await customUpdate(
      'UPDATE read_histories SET hits = hits + ? WHERE work_id = ?',
      variables: [Variable<int>(hits), Variable<int>(workId)],
    );
  }

  // Enhanced insert/update that handles complete ReadHistory with Work
  Future<void> insertOrUpdateReadHistoryComplete(ReadHistory history) async {
    await transaction(() async {
      // Ensure the work exists (insert/update it)
      await db.worksDao.insertOrUpdateWorkComplete(history.work);

      // If there's a chapter, ensure it exists
      if (history.chapter != null) {
        await db.chaptersDao.insertOrUpdate(history.chapter!);
      }

      // Insert/update the read history
      await insertOrUpdate(history);
    });
  }

  // Bulk operations for better performance
  Future<List<ReadHistory>> getReadHistoriesByWorkIds(List<int> workIds) async {
    if (workIds.isEmpty) return [];

    final historyRecords = await (select(
      table,
    )..where((h) => h.workId.isIn(workIds))).get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get read history with lightweight work data (without all relationships)
  Future<List<ReadHistory>> getReadHistoryLightweight({int limit = 50}) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(table.asDslTable.workId),
            ),
          ])
          ..orderBy([OrderingTerm.desc(table.asDslTable.timestamp)])
          ..limit(limit);

    final results = await query.get();

    final histories = <ReadHistory>[];
    for (final row in results) {
      final historyData = row.readTable(table);
      final workData = row.readTable(db.dbWorks);

      // Create a lightweight work object
      final work = db.worksDao.fromRow(workData);

      Chapter? chapter;
      if (historyData.chapterId != null) {
        final chapterData = await db.chaptersDao.getSingle(
          (c) => c.id.equals(historyData.chapterId!),
        );
        if (chapterData != null) {
          chapter = db.chaptersDao.fromRow(chapterData);
        }
      }

      histories.add(
        ReadHistory(
          work: work,
          chapter: chapter,
          timestamp: historyData.timestamp,
          position: historyData.position,
          status: ReadStatus.values.firstWhere(
            (s) => s.name == historyData.status,
          ),
          completion: historyData.completion,
        ),
      );
    }

    return histories;
  }
}
