import 'dart:io';
import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/migrations/migration_manager.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import all table files
import 'package:archiverse/database/tables/works.dart';
import 'package:archiverse/database/tables/authors.dart';
import 'package:archiverse/database/tables/tags.dart';
import 'package:archiverse/database/tables/chapters.dart';
import 'package:archiverse/database/tables/read_histories.dart';
import 'package:archiverse/database/tables/series.dart';
import 'package:archiverse/database/tables/bookmarks.dart';
import 'package:archiverse/database/tables/library.dart';

// Export all table files
export 'package:archiverse/database/tables/works.dart';
export 'package:archiverse/database/tables/authors.dart';
export 'package:archiverse/database/tables/tags.dart';
export 'package:archiverse/database/tables/chapters.dart';
export 'package:archiverse/database/tables/read_histories.dart';
export 'package:archiverse/database/tables/series.dart';
export 'package:archiverse/database/tables/bookmarks.dart';
export 'package:archiverse/database/tables/library.dart';

part 'database.g.dart';

const bool kDeleteDatabaseOnStart = false;

@DriftDatabase(
  tables: [
    DbWorks,
    DbAuthors,
    DbWorkAuthors,
    DbTags,
    DbWorkFandoms,
    DbWorkRelationships,
    DbWorkCharacters,
    DbWorkTags,
    DbChapters,
    DbReadHistories,
    DbSeries,
    DbWorkSeries,
    DbBookmarks,
    DbChapterWorks,
    DbWorksLibrary,
    DbLibraryFolders,
    DbLibraryFolderWorks,
    DbDownloadedWorks,
    DbDownloadedChapters,
  ],
  daos: [
    WorksDao,
    AuthorsDao,
    TagsDao,
    ChaptersDao,
    ReadHistoriesDao,
    SeriesDao,
    LibraryDao,
    LibraryFoldersDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await MigrationManager.runOnCreate(this, m);
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await MigrationManager.runOnUpgrade(this, m, from, to);
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(p.join(dbFolder.path, 'archiverse.db'));
    await _deleteDatabase(file);

    return NativeDatabase.createInBackground(file);
  });
}

Future<void> _deleteDatabase(File file) async {
  if (!kDeleteDatabaseOnStart) return;

  // Delete old database file if it exists
  if (await file.exists()) {
    await file.delete();
  }
}
