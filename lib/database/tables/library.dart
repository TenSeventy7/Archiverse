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

  // Add unique constraint on workId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {workId},
  ];
}

class DbLibraryFolders extends Table {
  @override
  String get tableName => 'library_folders'; // Keep the actual table name as 'library_folders'

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 512)(); // Folder name
  TextColumn get icon => text().nullable()(); // Optional icon for the folder
  TextColumn get color =>
      text().withDefault(const Constant('blue'))(); // Default color
}

class DbLibraryFolderWorks extends Table {
  @override
  String get tableName => 'library_folder_works'; // Keep the actual table name as 'library_folder_works'

  IntColumn get id => integer().autoIncrement()();
  IntColumn get workId =>
      integer().references(DbWorks, #id)(); // Foreign key to works table
  IntColumn get folderId => integer().references(
    DbLibraryFolders,
    #id,
  )(); // Foreign key to folders table

  // Add unique constraint on workId and folderId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {workId, folderId},
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

  // Add unique constraint on workId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {workId},
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

  // Add unique constraint on chapterId to prevent duplicates
  @override
  List<Set<Column>>? get uniqueKeys => [
    {chapterId},
  ];
}
