import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

part 'dao_read_histories.g.dart';

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
    return getWorkReadHistory(workId, limit: 1).then((histories) {
      if (histories.isNotEmpty) {
        return histories.first;
      }
      return null;
    });
  }

  Future<List<ReadHistory>> getWorkReadHistory(
    int workId, {
    int limit = 10,
  }) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(table.asDslTable.workId),
            ),
            leftOuterJoin(
              db.dbChapters,
              db.dbChapters.id.equalsExp(table.asDslTable.chapterId),
            ),
          ])
          ..where(table.asDslTable.workId.equals(workId))
          ..orderBy([OrderingTerm.desc(table.asDslTable.timestamp)])
          ..limit(limit);

    final results = await query.get();
    return await _buildHistoryListFromJoinResults(results);
  }

  // Get all read history with complete data
  Future<List<ReadHistory>> getAllReadHistoryComplete() async {
    final historyRecords = await getAll();
    final histories = <ReadHistory>[];

    for (final record in historyRecords) {
      final history = await getReadHistoryComplete(record.workId);
      if (history != null) {
        histories.add(history.copyWith(hits: await getHitCount(record.workId)));
      }
    }

    return histories;
  }

  // Get read history ordered by timestamp (most recent first)
  Future<List<ReadHistory>> getRecentReadHistory({int limit = 50}) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(table.asDslTable.workId),
            ),
            leftOuterJoin(
              db.dbChapters,
              db.dbChapters.id.equalsExp(table.asDslTable.chapterId),
            ),
          ])
          ..orderBy([OrderingTerm.desc(table.asDslTable.timestamp)])
          ..limit(limit);

    final results = await query.get();
    return await _buildHistoryListFromJoinResults(results);
  }

  /// Helper method to build ReadHistory list from JOIN results
  Future<List<ReadHistory>> _buildHistoryListFromJoinResults(
    List<TypedResult> results,
  ) async {
    final histories = <ReadHistory>[];

    for (final row in results) {
      final historyData = row.readTable(table);
      final workData = row.readTable(db.dbWorks);
      final chapterData = row.readTableOrNull(db.dbChapters);

      // Get complete work data with tags, fandoms, and authors
      final work = await db.worksDao.getWorkComplete(workData.id);
      if (work == null) continue;

      Chapter? chapter;
      if (chapterData != null) {
        chapter = db.chaptersDao.fromRow(chapterData);
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
          hits: await getHitCount(work.id),
        ),
      );
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
          hits: 1,
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

    final query =
        select(db.dbReadHistories).join([
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(db.dbReadHistories.workId),
            ),
            leftOuterJoin(
              db.dbChapters,
              db.dbChapters.id.equalsExp(db.dbReadHistories.chapterId),
            ),
          ])
          ..where(
            db.dbReadHistories.timestamp.isBetweenValues(startDate, endDate),
          )
          ..orderBy([OrderingTerm.desc(db.dbReadHistories.timestamp)]);

    final results = await query.get();

    final histories = <ReadHistory>[];
    for (final row in results) {
      final historyData = row.readTable(db.dbReadHistories);
      final workData = row.readTable(db.dbWorks);
      final chapterData = row.readTableOrNull(db.dbChapters);

      final work = await db.worksDao.getWorkComplete(workData.id);
      if (work == null) continue;

      Chapter? chapter;
      if (chapterData != null) {
        chapter = db.chaptersDao.fromRow(chapterData);
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
          hits: await getHitCount(work.id),
        ),
      );
    }

    return histories;
  }

  // Helper method to check if there's any history beyond a certain date
  Future<bool> hasHistoryBeyondDate(DateTime date) async {
    final count = await getCount((h) => h.timestamp.isSmallerThanValue(date));
    return count > 0;
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

  // Insert that handles complete ReadHistory with Work
  Future<void> insertReadHistoryComplete(ReadHistory history) async {
    await transaction(() async {
      // Ensure the work exists (insert/update it)
      await db.worksDao.insertOrUpdateWorkComplete(history.work);

      // If there's a chapter, ensure it exists
      if (history.chapter != null) {
        await db.chaptersDao.insertOrUpdate(history.chapter!);
      }

      // Check if an existing read history entry exists
      // We're only going to do an update IFF it is the latest entry
      // i.e. this is an existing session
      final latestEntry = await getLatestReadHistory();

      if (latestEntry != null &&
          _isCurrentSession(latestEntry, history.work.id)) {
        // Update the latest entry if it's from the current session
        await (update(table)..where(
              (h) =>
                  h.workId.equals(history.work.id) &
                  h.timestamp.equals(latestEntry.timestamp),
            ))
            .write(toCompanion(history));
      } else {
        // Insert new entry for a new session
        await insert(history);
      }
    });
  }

  bool _isCurrentSession(DbReadHistory? history, int workId) {
    if (history == null) {
      return false;
    }

    // Check if the work IDs match
    if (workId != history.workId) {
      return false;
    }

    // Check if this is the same day
    final today = DateTime.now();
    return today.year == history.timestamp.year &&
        today.month == history.timestamp.month &&
        today.day == history.timestamp.day;
  }

  // Add method to get latest history entry in the database
  Future<DbReadHistory?> getLatestReadHistory() async {
    final result =
        await (select(table)
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)])
              ..limit(1))
            .get();
    return result.isNotEmpty ? result.first : null;
  }

  // Get hit count for a particular work
  // This pools all counts of history with the same workId
  Future<int> getHitCount(int workId) async {
    final count = await (select(
      table,
    )..where((h) => h.workId.equals(workId))).get();

    // Return how many entries we get
    return count.length;
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
          hits: await getHitCount(work.id),
        ),
      );
    }

    return histories;
  }

  Future<List<int>> getAllReadHistoryWorkIds() async {
    final results = await select(table).get();
    return results.map((h) => h.workId).toList();
  }
}
