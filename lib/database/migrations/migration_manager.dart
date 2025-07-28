import 'package:drift/drift.dart';
import 'migration_base.dart';
import 'migration_1.dart';

/// Manages database migrations
class MigrationManager {
  static final List<DatabaseMigration> _migrations = [Migration1()];

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

    // Then run all migrations
    await runMigrations(database, migrator, _getLatestVersion());
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

  /// Get the latest migration version
  static int _getLatestVersion() {
    if (_migrations.isEmpty) return 1;
    return _migrations
        .map((m) => m.targetVersion)
        .reduce((a, b) => a > b ? a : b);
  }
}
