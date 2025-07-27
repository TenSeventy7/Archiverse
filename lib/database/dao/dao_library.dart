import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/work.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

part 'dao_library.g.dart';

class WorksLibraryEntry {
  final int workId;
  final DateTime timestamp;

  const WorksLibraryEntry({required this.workId, required this.timestamp});

  WorksLibraryEntry copyWith({int? workId, DateTime? timestamp}) {
    return WorksLibraryEntry(
      workId: workId ?? this.workId,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

@DriftAccessor(tables: [DbWorksLibrary])
class LibraryDao
    extends BaseDao<DbWorksLibrary, DbWorksLibraryData, WorksLibraryEntry> {
  LibraryDao(super.db);

  @override
  TableInfo<DbWorksLibrary, DbWorksLibraryData> get table => db.dbWorksLibrary;

  @override
  DbWorksLibraryCompanion toCompanion(WorksLibraryEntry model) {
    return DbWorksLibraryCompanion(
      workId: Value(model.workId),
      timestamp: Value(model.timestamp),
    );
  }

  @override
  WorksLibraryEntry fromRow(DbWorksLibraryData row) {
    return WorksLibraryEntry(workId: row.workId, timestamp: row.timestamp);
  }

  // Specific methods for works library
  Future<void> addWork(int workId, {DateTime? timestamp}) async {
    final entry = WorksLibraryEntry(
      workId: workId,
      timestamp: timestamp ?? DateTime.now(),
    );
    await into(
      table,
    ).insert(toCompanion(entry), mode: InsertMode.insertOrReplace);
  }

  Future<bool> removeWork(int workId) async {
    return await deleteWhere((tbl) => tbl.workId.equals(workId));
  }

  Future<bool> containsWork(int workId) async {
    return await exists((tbl) => tbl.workId.equals(workId));
  }

  Future<List<int>> getAllWorkIds() async {
    final results = await getAll();
    return results.map((w) => w.workId).toList();
  }

  Future<List<Work>> getRecentlyAdded({int? limit, int? offset}) async {
    final query = select(table)
      ..orderBy([(w) => OrderingTerm.desc(w.timestamp)]);
    if (limit != null) query.limit(limit, offset: offset);

    final results = await query.get();
    final workIds = results.map((row) => row.workId).toList();

    // Fetch the actual Work objects using the work IDs
    List<Work> works = [];
    if (workIds.isNotEmpty) {
      for (final workId in workIds) {
        final work = await db.worksDao.getWorkComplete(workId);
        if (work != null) {
          works.add(work);
        }
      }
    }

    return works;
  }

  Future<int> getTotalCount() async {
    return await getCount();
  }
}
