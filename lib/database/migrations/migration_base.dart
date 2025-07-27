import 'package:drift/drift.dart';

/// Base class for database migrations
abstract class DatabaseMigration {
  /// The version this migration targets
  int get targetVersion;

  /// Execute the migration
  Future<void> migrate(DatabaseConnectionUser database, Migrator migrator);
}

/// Helper class to execute custom SQL statements
class MigrationHelper {
  final DatabaseConnectionUser database;

  MigrationHelper(this.database);

  Future<void> createIndex(String indexSql) async {
    await database.customStatement(indexSql);
  }

  Future<void> executeStatement(String sql) async {
    await database.customStatement(sql);
  }
}
