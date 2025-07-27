import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/models/work.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

part 'dao_library_category.g.dart';

class LibraryCategoryWork {
  final int categoryId;
  final int workId;

  const LibraryCategoryWork({required this.categoryId, required this.workId});

  LibraryCategoryWork copyWith({int? categoryId, int? workId}) {
    return LibraryCategoryWork(
      categoryId: categoryId ?? this.categoryId,
      workId: workId ?? this.workId,
    );
  }
}

@DriftAccessor(tables: [DbLibraryCategories, DbLibraryCategoryWorks])
class LibraryCategoriesDao
    extends BaseDao<DbLibraryCategories, DbLibraryCategory, LibraryCategory> {
  LibraryCategoriesDao(super.db);

  @override
  TableInfo<DbLibraryCategories, DbLibraryCategory> get table =>
      db.dbLibraryCategories;

  @override
  DbLibraryCategoriesCompanion toCompanion(LibraryCategory model) {
    Value<int> id = Value.absent();
    if (model.id != null) {
      id = Value(model.id!);
    }

    return DbLibraryCategoriesCompanion(
      id: id,
      name: Value(model.name),
      icon: Value(model.icon),
      color: Value(model.color),
    );
  }

  @override
  LibraryCategory fromRow(DbLibraryCategory row) {
    return LibraryCategory(
      id: row.id,
      name: row.name,
      icon: row.icon,
      color: row.color,
    );
  }

  LibraryCategory fromRowComplete(DbLibraryCategory row, int count) {
    return LibraryCategory(
      id: row.id,
      name: row.name,
      icon: row.icon,
      color: row.color,
      count: count,
    );
  }

  Future<bool> updateCategory(LibraryCategory category) async {
    final companion = toCompanion(category);
    return await update(table).replace(companion);
  }

  Future<bool> deleteCategory(int id) async {
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.id.equals(id))).go();
    return deletedCount > 0;
  }

  // Specific methods for library categories
  Future<LibraryCategory?> getByName(String name) async {
    final row = await getSingleOrNull((tbl) => tbl.name.equals(name));
    return row != null ? fromRow(row) : null;
  }

  // Fetch all categories
  Future<List<LibraryCategory>> getAllCategories() async {
    final results = await select(db.dbLibraryCategories).get();
    final future = results.map((row) => getWorkCount(row.id));
    final counts = await Future.wait(future);
    return results.asMap().entries.map((entry) {
      final row = entry.value;
      final count = counts[entry.key];
      return fromRowComplete(row, count);
    }).toList();
  }

  Future<List<LibraryCategory>> getCategories(int page) async {
    final query = select(db.dbLibraryCategories)
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

  Future<List<DbLibraryCategoryWork>> getMultipleCategories(
    Expression<bool> Function(DbLibraryCategoryWorks tbl) where,
  ) async {
    final table = db.dbLibraryCategoryWorks;
    return await (select(table)..where(where)).get();
  }

  Future<void> addWorkToCategory(int workId, int categoryId) async {
    final companion = DbLibraryCategoryWorksCompanion(
      categoryId: Value(categoryId),
      workId: Value(workId),
    );
    await into(
      db.dbLibraryCategoryWorks,
    ).insert(companion, mode: InsertMode.insertOrIgnore);
  }

  Future<bool> isWorkInCategory(int workId, int categoryId) async {
    final table = db.dbLibraryCategoryWorks;
    final count =
        await (select(table)..where(
              (tbl) =>
                  tbl.workId.equals(workId) & tbl.categoryId.equals(categoryId),
            ))
            .get()
            .then((rows) => rows.length);
    return count > 0;
  }

  Future<List<Work>> getWorksByCategory(int categoryId) async {
    final results = await getMultipleCategories(
      (tbl) => tbl.categoryId.equals(categoryId),
    );
    final workFutures = results.map(
      (r) => db.worksDao.getWorkComplete(r.workId),
    );
    final works = await Future.wait(workFutures);
    return works.whereType<Work>().toList();
  }

  Future<bool> removeWorkFromAllCategories(int workId) async {
    final table = db.dbLibraryCategoryWorks;
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.workId.equals(workId))).go();
    return deletedCount > 0;
  }

  Future<bool> removeWorkFromCategory(int workId, int categoryId) async {
    final table = db.dbLibraryCategoryWorks;
    final deletedCount =
        await (delete(table)..where(
              (tbl) =>
                  tbl.workId.equals(workId) & tbl.categoryId.equals(categoryId),
            ))
            .go();
    return deletedCount > 0;
  }

  Future<bool> removeAllWorksFromCategory(int categoryId) async {
    final table = db.dbLibraryCategoryWorks;
    final deletedCount = await (delete(
      table,
    )..where((tbl) => tbl.categoryId.equals(categoryId))).go();
    return deletedCount > 0;
  }

  Future<List<LibraryCategory>> getCategoriesForWork(int workId) async {
    final results = await customSelect(
      '''
      SELECT lc.* FROM library_categories lc
      INNER JOIN library_category_works lcw ON lc.id = lcw.category_id
      WHERE lcw.work_id = ?
      ''',
      variables: [Variable.withInt(workId)],
      readsFrom: {db.dbLibraryCategories, db.dbLibraryCategoryWorks},
    ).get();

    return results
        .map(
          (r) => LibraryCategory(
            id: r.data['id'] as int,
            name: r.data['name'] as String,
            icon: r.data['icon'] as String?,
            color: r.data['color'] as String,
          ),
        )
        .toList();
  }

  Future<int> getWorkCount(int categoryId) async {
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM library_category_works WHERE category_id = ?',
      variables: [Variable.withInt(categoryId)],
      readsFrom: {db.dbLibraryCategoryWorks},
    ).getSingle();
    return result.data['count'] as int;
  }

  Future<int> create(LibraryCategory category) async {
    final companion = toCompanion(category);
    return into(table).insert(companion, mode: InsertMode.insertOrReplace);
  }
}
