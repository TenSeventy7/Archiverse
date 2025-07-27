import 'package:drift/drift.dart';
import 'migration_base.dart';

/// Initial migration - creates all indexes
class Migration1 extends DatabaseMigration {
  @override
  int get targetVersion => 1;

  @override
  Future<void> migrate(
    DatabaseConnectionUser database,
    Migrator migrator,
  ) async {
    final helper = MigrationHelper(database);

    // Library indexes for timestamp-based queries
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_library_timestamp ON library(timestamp DESC)',
    );

    // Read histories indexes for performance
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

    // Library category works indexes for joins
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_library_category_works_work ON library_category_works(work_id)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_library_category_works_category ON library_category_works(category_id)',
    );

    // Downloaded works indexes
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_downloaded_works_timestamp ON downloaded_works(timestamp DESC)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_downloaded_works_complete ON downloaded_works(is_complete)',
    );

    // Downloaded chapters indexes
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_downloaded_chapters_timestamp ON downloaded_chapters(timestamp DESC)',
    );
    await helper.createIndex(
      'CREATE INDEX IF NOT EXISTS idx_downloaded_chapters_complete ON downloaded_chapters(is_complete)',
    );
  }
}
