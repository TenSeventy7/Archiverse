import 'dart:io';
import 'package:archiverse/database/dao.dart';
import 'package:archiverse/database/tables/library.dart';
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

// Export all table files
export 'package:archiverse/database/tables/works.dart';
export 'package:archiverse/database/tables/authors.dart';
export 'package:archiverse/database/tables/tags.dart';
export 'package:archiverse/database/tables/chapters.dart';
export 'package:archiverse/database/tables/read_histories.dart';
export 'package:archiverse/database/tables/series.dart';
export 'package:archiverse/database/tables/bookmarks.dart';

part 'database.g.dart';

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
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    // Delete old database file if it exists
    // final oldFile = File(p.join(dbFolder.path, 'archiverse.db'));
    // if (await oldFile.exists()) {
    //   await oldFile.delete();
    // }

    final file = File(p.join(dbFolder.path, 'archiverse.db'));
    return NativeDatabase.createInBackground(file);
  });
}
