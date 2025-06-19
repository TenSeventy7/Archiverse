import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:drift/drift.dart';

extension ReadHistoryDao on AppDatabase {
  // Insert or update read history
  Future<void> insertOrUpdateReadHistory(ReadHistory history) async {
    await into(readHistoriesTable).insertOnConflictUpdate(
      ReadHistoriesTableCompanion(
        workId: Value(history.work.id),
        chapterId: Value(history.chapter?.id),
        timestamp: Value(history.timestamp),
        position: Value(history.position),
        status: Value(history.status.name),
        completion: Value(history.completion),
      ),
    );
  }

  // Get read history for a specific work
  Future<ReadHistory?> getReadHistory(int workId) async {
    final historyData = await (select(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).getSingleOrNull();

    if (historyData == null) return null;

    final work = await getWorkComplete(workId);
    if (work == null) return null;

    Chapter? chapter;
    if (historyData.chapterId != null) {
      final chapterData = await (select(
        chaptersTable,
      )..where((c) => c.id.equals(historyData.chapterId!))).getSingleOrNull();
      if (chapterData != null) {
        chapter = Chapter(
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
    }

    return ReadHistory(
      work: work,
      chapter: chapter,
      timestamp: historyData.timestamp,
      position: historyData.position,
      status: ReadStatus.values.firstWhere((s) => s.name == historyData.status),
      completion: historyData.completion,
    );
  }

  // Get all read history
  Future<List<ReadHistory>> getAllReadHistory() async {
    final historyRecords = await select(readHistoriesTable).get();
    final histories = <ReadHistory>[];

    for (final record in historyRecords) {
      final history = await getReadHistory(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get read history ordered by timestamp (most recent first)
  Future<List<ReadHistory>> getRecentReadHistory({int limit = 50}) async {
    final historyRecords =
        await (select(readHistoriesTable)
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)])
              ..limit(limit))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistory(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get read history by status
  Future<List<ReadHistory>> getReadHistoryByStatus(ReadStatus status) async {
    final historyRecords =
        await (select(readHistoriesTable)
              ..where((h) => h.status.equals(status.name))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)]))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistory(record.workId);
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
    await (update(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).write(
      ReadHistoriesTableCompanion(
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
    await (update(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).write(
      ReadHistoriesTableCompanion(
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
    await (update(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).write(
      ReadHistoriesTableCompanion(
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
    final existingHistory = await getReadHistory(workId);
    if (existingHistory != null) {
      // Update existing history
      await updateReadingStatus(workId, ReadStatus.IN_PROGRESS);
    } else {
      // Create new history entry
      final work = await getWorkComplete(workId);
      if (work != null) {
        Chapter? chapter;
        if (chapterId != null) {
          final chapterData = await (select(
            chaptersTable,
          )..where((c) => c.id.equals(chapterId))).getSingleOrNull();
          if (chapterData != null) {
            chapter = Chapter(
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
        }

        final newHistory = ReadHistory(
          work: work,
          chapter: chapter,
          timestamp: DateTime.now(),
          position: 0,
          status: ReadStatus.IN_PROGRESS,
          completion: 0.0,
        );

        await insertOrUpdateReadHistory(newHistory);
      }
    }
  }

  // Delete read history
  Future<void> deleteReadHistory(int workId) async {
    await (delete(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).go();
  }

  // Check if work has read history
  Future<bool> hasReadHistory(int workId) async {
    final history = await (select(
      readHistoriesTable,
    )..where((h) => h.workId.equals(workId))).getSingleOrNull();
    return history != null;
  }

  // Get read history count
  Future<int> getReadHistoryCount() async {
    final result = await (selectOnly(
      readHistoriesTable,
    )..addColumns([readHistoriesTable.workId.count()])).getSingle();
    return result.read(readHistoriesTable.workId.count()) ?? 0;
  }

  // Get read history count by status
  Future<int> getReadHistoryCountByStatus(ReadStatus status) async {
    final result =
        await (selectOnly(readHistoriesTable)
              ..addColumns([readHistoriesTable.workId.count()])
              ..where(readHistoriesTable.status.equals(status.name)))
            .getSingle();
    return result.read(readHistoriesTable.workId.count()) ?? 0;
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
        await (select(readHistoriesTable)
              ..where((h) => h.timestamp.isBetweenValues(start, end))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)]))
            .get();

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistory(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Search read history by work title
  Future<List<ReadHistory>> searchReadHistory(String query) async {
    final workIds =
        await (select(worksTable)..where(
              (w) => w.title.contains(query) | w.summary.contains(query),
            ))
            .map((w) => w.id)
            .get();

    final histories = <ReadHistory>[];
    for (final workId in workIds) {
      final history = await getReadHistory(workId);
      if (history != null) {
        histories.add(history);
      }
    }

    return histories;
  }

  // Get paginated read history grouped by date
  Future<List<ReadHistory>> getReadHistoryList({int offset = 0}) async {
    final now = DateTime.now().toUtc();
    final today = DateTime.utc(now.year, now.month, now.day);

    // Calculate the date range for this "page" (relative day)
    final targetDate = today.subtract(Duration(days: offset));
    final startDate = targetDate;
    final endDate = targetDate.add(const Duration(days: 1, seconds: -1));

    print('Fetching history for day $offset ago'); // Debug log
    print(
      'Date range: ${startDate.toIso8601String()} to ${endDate.toIso8601String()}',
    ); // Debug log

    final historyRecords =
        await (select(readHistoriesTable)
              ..where((h) => h.timestamp.isBetweenValues(startDate, endDate))
              ..orderBy([(h) => OrderingTerm.desc(h.timestamp)]))
            .get();

    print('Found ${historyRecords.length} history records'); // Debug log

    if (historyRecords.isEmpty) {
      return [];
    }

    final histories = <ReadHistory>[];
    for (final record in historyRecords) {
      final history = await getReadHistory(record.workId);
      if (history != null) {
        histories.add(history);
      }
    }

    if (histories.isEmpty) {
      return [];
    }

    // Return single group with the target date as header
    return histories;
  }
}
