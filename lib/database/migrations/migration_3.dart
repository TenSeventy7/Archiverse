import 'package:drift/drift.dart';
import 'migration_base.dart';

/// Migration 3 - Rename library categories to folders
/// This migration renames database tables and columns to use "folder" nomenclature instead of "category"
class Migration3 extends DatabaseMigration {
  @override
  int get targetVersion => 3;

  @override
  Future<void> migrate(
    DatabaseConnectionUser database,
    Migrator migrator,
  ) async {
    final helper = MigrationHelper(database);

    // Step 1: Rename library_categories table to library_folders
    await helper.executeStatement(
      'ALTER TABLE library_categories RENAME TO library_folders',
    );

    // Step 2: Rename library_category_works table to library_folder_works
    await helper.executeStatement(
      'ALTER TABLE library_category_works RENAME TO library_folder_works',
    );

    // Step 3: Rename the foreign key column in library_folder_works table
    // SQLite doesn't support renaming columns directly, so we need to recreate the table

    // 3a. Create a new temporary table with the correct column name
    await helper.executeStatement('''
      CREATE TABLE library_folder_works_temp (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        work_id INTEGER NOT NULL REFERENCES works(id),
        folder_id INTEGER NOT NULL REFERENCES library_folders(id)
      )
    ''');

    // 3b. Copy data from old table to new table
    await helper.executeStatement('''
      INSERT INTO library_folder_works_temp (id, work_id, folder_id)
      SELECT id, work_id, category_id FROM library_folder_works
    ''');

    // 3c. Drop the old table
    await helper.executeStatement('DROP TABLE library_folder_works');

    // 3d. Rename the temporary table to the final name
    await helper.executeStatement(
      'ALTER TABLE library_folder_works_temp RENAME TO library_folder_works',
    );

    // Step 4: Recreate indexes with new names
    await helper.executeStatement(
      'DROP INDEX IF EXISTS idx_library_category_works_work',
    );
    await helper.executeStatement(
      'DROP INDEX IF EXISTS idx_library_category_works_category',
    );

    // Create new indexes with folder nomenclature
    await helper.executeStatement(
      'CREATE INDEX IF NOT EXISTS idx_library_folder_works_work ON library_folder_works(work_id)',
    );
    await helper.executeStatement(
      'CREATE INDEX IF NOT EXISTS idx_library_folder_works_folder ON library_folder_works(folder_id)',
    );
  }
}
