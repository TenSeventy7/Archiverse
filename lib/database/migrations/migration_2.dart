import 'package:drift/drift.dart';
import 'migration_base.dart';

/// Migration 2 - Remove unique constraint on workId from read_histories table
class Migration2 extends DatabaseMigration {
  @override
  int get targetVersion => 2;

  @override
  Future<void> migrate(
    DatabaseConnectionUser database,
    Migrator migrator,
  ) async {
    final helper = MigrationHelper(database);

    // SQLite doesn't support dropping constraints directly
    // We need to recreate the table without the unique constraint

    // 0. Delete existing read_histories_temp if a migration failed
    await helper.executeStatement('DROP TABLE IF EXISTS read_histories_temp');

    // 1. Create a temporary table with the same structure but without unique constraint
    await helper.executeStatement('''
      CREATE TABLE read_histories_temp (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        work_id INTEGER NOT NULL REFERENCES works(id),
        chapter_id INTEGER REFERENCES chapters(id),
        timestamp INTEGER NOT NULL,
        position INTEGER NOT NULL,
        status TEXT NOT NULL,
        completion REAL NOT NULL
      )
    ''');

    // 2. Copy all data from the original table
    await helper.executeStatement('''
      INSERT INTO read_histories_temp 
      SELECT id, work_id, chapter_id, timestamp, position, status, completion 
      FROM read_histories
    ''');

    // 3. Drop the original table
    await helper.executeStatement('DROP TABLE read_histories');

    // 4. Rename the temporary table
    await helper.executeStatement(
      'ALTER TABLE read_histories_temp RENAME TO read_histories',
    );

    // 5. Recreate the indexes for read_histories
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_read_histories_timestamp_desc ON read_histories(timestamp DESC)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_read_histories_work_timestamp ON read_histories(work_id, timestamp DESC)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_read_histories_completion_timestamp ON read_histories(completion, timestamp DESC)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_read_histories_chapter ON read_histories(chapter_id) WHERE chapter_id IS NOT NULL',
    );
  }
}
