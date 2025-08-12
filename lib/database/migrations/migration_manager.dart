import 'package:archiverse/database/migrations/migration_0.dart';
import 'package:archiverse/database/migrations/migration_2.dart';
import 'package:archiverse/database/migrations/migration_3.dart';
import 'package:drift/drift.dart';
import 'migration_base.dart';

/// Manages database migrations
class MigrationManager {
  static final List<DatabaseMigration> _migrations = [
    Migration2(),
    Migration3(),
  ];

  /// Execute all migrations up to the target version
  static Future<void> runMigrations(
    DatabaseConnectionUser database,
    Migrator migrator,
    int targetVersion,
  ) async {
    for (final migration in _migrations) {
      if (migration.targetVersion <= targetVersion) {
        await migration.migrate(database, migrator);
      }
    }
  }

  /// Execute migrations for onCreate
  static Future<void> runOnCreate(
    DatabaseConnectionUser database,
    Migrator migrator,
  ) async {
    // Create all tables first
    await migrator.createAll();

    // Then run only Migration0
    await Migration0().migrate(database, migrator);
  }

  /// Execute migrations for onUpgrade
  static Future<void> runOnUpgrade(
    DatabaseConnectionUser database,
    Migrator migrator,
    int from,
    int to,
  ) async {
    // Only run migrations that are newer than the 'from' version
    for (final migration in _migrations) {
      if (migration.targetVersion > from && migration.targetVersion <= to) {
        await migration.migrate(database, migrator);
      }
    }
  }
}
