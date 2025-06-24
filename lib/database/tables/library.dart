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
  Set<Column> get primaryKey => {id}; // Primary key on ID
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
  Set<Column> get primaryKey => {id}; // Primary key on ID
}

class DbDownloadedChapters extends Table {
  @override
  String get tableName => 'downloaded_chapters'; // Keep the actual table name as 'downloaded_chapters'

  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer().references(DbChapters, #id)();

  @override
  Set<Column> get primaryKey => {id}; // Primary key on ID
}
