import 'package:drift/drift.dart';
import '../database.dart';

abstract class BaseDao<T extends Table, D extends DataClass, M>
    extends DatabaseAccessor<AppDatabase> {
  BaseDao(super.db);

  // Abstract methods that must be implemented by concrete DAOs
  TableInfo<T, D> get table;

  // Convert from model to database companion
  Insertable<D> toCompanion(M model);

  // Convert from database row to model
  M fromRow(D row);

  // Common CRUD operations
  Future<int> insert(M model) async {
    return await into(table).insert(toCompanion(model));
  }

  Future<void> insertOrUpdate(M model) async {
    await into(table).insertOnConflictUpdate(toCompanion(model));
  }

  Future<bool> updateWhere(
    M model,
    Expression<bool> Function(T tbl) where,
  ) async {
    final result = await (update(
      table,
    )..where(where)).write(toCompanion(model));
    return result > 0;
  }

  Future<bool> deleteWhere(Expression<bool> Function(T tbl) where) async {
    final result = await (delete(table)..where(where)).go();
    return result > 0;
  }

  Future<D?> getSingle(Expression<bool> Function(T tbl) where) async {
    return await (select(table)..where(where)).getSingleOrNull();
  }

  Future<List<D>> getMultiple(Expression<bool> Function(T tbl) where) async {
    return await (select(table)..where(where)).get();
  }

  Future<List<D>> getAll() async {
    return await select(table).get();
  }

  Future<int> getCount([Expression<bool> Function(T tbl)? where]) async {
    final query = selectOnly(table)
      ..addColumns([table.primaryKey.first.count()]);
    if (where != null) {
      query.where(where(table.asDslTable));
    }
    final result = await query.getSingle();
    return result.read(table.primaryKey.first.count()) ?? 0;
  }

  Future<bool> exists(Expression<bool> Function(T tbl) where) async {
    final count = await getCount(where);
    return count > 0;
  }
}
