import 'package:drift/drift.dart';
import 'migration_base.dart';

/// Migration for version 2 - Add any new indexes or schema changes here
class Migration2 extends DatabaseMigration {
  @override
  int get targetVersion => 2;

  @override
  Future<void> migrate(
    DatabaseConnectionUser database,
    Migrator migrator,
  ) async {
    // Add any new migrations for version 2 here
    // For example:
    // final helper = MigrationHelper(database);
    // await helper.createIndex(
    //   'CREATE INDEX IF NOT EXISTS idx_new_feature ON some_table(column)',
    // );

    // Since we're currently at version 2, this can be empty for now
    // but provides a template for future migrations
  }
}
