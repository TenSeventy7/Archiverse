import 'package:archiverse/database/database.dart';
import 'package:drift/drift.dart';

class DbWorksLibrary extends Table {
  @override
  String get tableName => 'library'; // Keep the actual table name as 'library'

  IntColumn get id => integer().autoIncrement()();
  IntColumn get workId =>
      integer().references(DbWorks, #id)(); // Foreign key to works table
  DateTimeColumn get timestamp =>
      dateTime()(); // Timestamp of when the work was added to the library

  @override
  Set<Column> get primaryKey => {id}; // Use auto-increment ID as primary key

  // Add unique constraint on workId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {workId},
  ];

  // Add index for better query performance
  @override
  List<String> get customConstraints => [
    'CREATE INDEX IF NOT EXISTS idx_library_timestamp ON library(timestamp DESC)',
  ];
}

class DbDownloadedWorks extends Table {
  @override
  String get tableName => 'downloaded_works'; // Keep the actual table name as 'downloaded_works'

  IntColumn get id => integer().autoIncrement()();
  IntColumn get workId =>
      integer().references(DbWorks, #id)(); // Foreign key to works table
  DateTimeColumn get timestamp =>
      dateTime()(); // Timestamp of when the work was downloaded
  IntColumn get chapters =>
      integer()(); // Number of chapters downloaded for the work
  BoolColumn get isComplete => boolean().withDefault(
    const Constant(false),
  )(); // Whether the download is complete

  @override
  Set<Column> get primaryKey => {id}; // Use auto-increment ID as primary key

  // Add unique constraint on workId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {workId},
  ];

  // Add indexes for better query performance
  @override
  List<String> get customConstraints => [
    'CREATE INDEX IF NOT EXISTS idx_downloaded_works_timestamp ON downloaded_works(timestamp DESC)',
    'CREATE INDEX IF NOT EXISTS idx_downloaded_works_complete ON downloaded_works(is_complete)',
  ];
}

class DbDownloadedChapters extends Table {
  @override
  String get tableName => 'downloaded_chapters'; // Keep the actual table name as 'downloaded_chapters'

  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer().references(DbChapters, #id)();
  DateTimeColumn get timestamp =>
      dateTime()(); // Timestamp of when the chapter was downloaded
  BoolColumn get isComplete => boolean().withDefault(
    const Constant(false),
  )(); // Whether the download is complete

  @override
  Set<Column> get primaryKey => {id}; // Use auto-increment ID as primary key

  // Add unique constraint on chapterId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {chapterId},
  ];

  // Add indexes for better query performance
  @override
  List<String> get customConstraints => [
    'CREATE INDEX IF NOT EXISTS idx_downloaded_chapters_timestamp ON downloaded_chapters(timestamp DESC)',
    'CREATE INDEX IF NOT EXISTS idx_downloaded_chapters_complete ON downloaded_chapters(is_complete)',
  ];
}
