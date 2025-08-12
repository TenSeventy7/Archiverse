import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/models/work.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

part 'dao_library_folder.g.dart';

class LibraryFolderWork {
  final int folderId;
  final int workId;

  const LibraryFolderWork({required this.folderId, required this.workId});

  LibraryFolderWork copyWith({int? folderId, int? workId}) {
    return LibraryFolderWork(
      folderId: folderId ?? this.folderId,
      workId: workId ?? this.workId,
    );
  }
}

@DriftAccessor(tables: [DbLibraryFolders, DbLibraryFolderWorks])
class LibraryFoldersDao
    extends BaseDao<DbLibraryFolders, DbLibraryFolder, LibraryFolder> {
  LibraryFoldersDao(super.db);

  @override
  TableInfo<DbLibraryFolders, DbLibraryFolder> get table => db.dbLibraryFolders;

  @override
  DbLibraryFoldersCompanion toCompanion(LibraryFolder model) {
    Value<int> id = Value.absent();
    if (model.id != null) {
      id = Value(model.id!);
    }

    return DbLibraryFoldersCompanion(
      id: id,
      name: Value(model.name),
      icon: Value(model.icon),
      color: Value(model.color),
    );
  }

  @override
  LibraryFolder fromRow(DbLibraryFolder row) {
    return LibraryFolder(
      id: row.id,
      name: row.name,
      icon: row.icon,
      color: row.color,
    );
  }

  LibraryFolder fromRowComplete(DbLibraryFolder row, int count) {
    return LibraryFolder(
      id: row.id,
      name: row.name,
      icon: row.icon,
      color: row.color,
      count: count,
    );
  }

  Future<bool> updateFolder(LibraryFolder folder) async {
    final companion = toCompanion(folder);
    return await update(table).replace(companion);
  }

  Future<bool> deleteFolder(int id) async {
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.id.equals(id))).go();
    return deletedCount > 0;
  }

  // Specific methods for library folders
  Future<LibraryFolder?> getByName(String name) async {
    final row = await getSingleOrNull((tbl) => tbl.name.equals(name));
    return row != null ? fromRow(row) : null;
  }

  // Fetch all folders
  Future<List<LibraryFolder>> getAllFolders() async {
    final results = await select(db.dbLibraryFolders).get();
    final future = results.map((row) => getWorkCount(row.id));
    final counts = await Future.wait(future);
    return results.asMap().entries.map((entry) {
      final row = entry.value;
      final count = counts[entry.key];
      return fromRowComplete(row, count);
    }).toList();
  }

  Future<List<LibraryFolder>> getFolders(int page) async {
    final query = select(db.dbLibraryFolders)
      ..limit(20, offset: (page - 1) * 20);
    final results = await query.get();
    final future = results.map((row) => getWorkCount(row.id));
    final counts = await Future.wait(future);
    return results.asMap().entries.map((entry) {
      final row = entry.value;
      final count = counts[entry.key];
      return fromRowComplete(row, count);
    }).toList();
  }

  Future<List<DbLibraryFolderWork>> getMultipleFolders(
    Expression<bool> Function(DbLibraryFolderWorks tbl) where,
  ) async {
    final table = db.dbLibraryFolderWorks;
    return await (select(table)..where(where)).get();
  }

  Future<void> addWorkToFolder(int workId, int folderId) async {
    final companion = DbLibraryFolderWorksCompanion(
      folderId: Value(folderId),
      workId: Value(workId),
    );
    await into(
      db.dbLibraryFolderWorks,
    ).insert(companion, mode: InsertMode.insertOrIgnore);
  }

  Future<bool> isWorkInFolder(int workId, int folderId) async {
    final table = db.dbLibraryFolderWorks;
    final count =
        await (select(table)..where(
              (tbl) =>
                  tbl.workId.equals(workId) & tbl.folderId.equals(folderId),
            ))
            .get()
            .then((rows) => rows.length);
    return count > 0;
  }

  Future<List<Work>> getWorksByFolder(int folderId) async {
    final results = await getMultipleFolders(
      (tbl) => tbl.folderId.equals(folderId),
    );
    final workFutures = results.map(
      (r) => db.worksDao.getWorkComplete(r.workId),
    );
    final works = await Future.wait(workFutures);
    return works.whereType<Work>().toList();
  }

  Future<bool> removeWorkFromAllFolders(int workId) async {
    final table = db.dbLibraryFolderWorks;
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.workId.equals(workId))).go();
    return deletedCount > 0;
  }

  Future<bool> removeWorkFromFolder(int workId, int folderId) async {
    final table = db.dbLibraryFolderWorks;
    final deletedCount =
        await (delete(table)..where(
              (tbl) =>
                  tbl.workId.equals(workId) & tbl.folderId.equals(folderId),
            ))
            .go();
    return deletedCount > 0;
  }

  Future<bool> removeAllWorksFromFolder(int folderId) async {
    final table = db.dbLibraryFolderWorks;
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.folderId.equals(folderId))).go();
    return deletedCount > 0;
  }

  Future<List<LibraryFolder>> getFoldersForWork(int workId) async {
    final results = await customSelect(
      '''
      SELECT lf.* FROM library_folders lf
      INNER JOIN library_folder_works lfw ON lf.id = lfw.folder_id
      WHERE lfw.work_id = ?
      ''',
      variables: [Variable.withInt(workId)],
      readsFrom: {db.dbLibraryFolders, db.dbLibraryFolderWorks},
    ).get();

    return results
        .map(
          (r) => LibraryFolder(
            id: r.data['id'] as int,
            name: r.data['name'] as String,
            icon: r.data['icon'] as String?,
            color: r.data['color'] as String,
          ),
        )
        .toList();
  }

  Future<int> getWorkCount(int folderId) async {
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM library_folder_works WHERE folder_id = ?',
      variables: [Variable.withInt(folderId)],
      readsFrom: {db.dbLibraryFolderWorks},
    ).getSingle();
    return result.data['count'] as int;
  }

  Future<int> create(LibraryFolder folder) async {
    final companion = toCompanion(folder);
    return into(table).insert(companion, mode: InsertMode.insertOrReplace);
  }
}
