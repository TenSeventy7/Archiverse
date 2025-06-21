import 'dart:io';
import 'package:archiverse/database/dao.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import all table files
import 'tables/works.dart';
import 'tables/authors.dart';
import 'tables/tags.dart';
import 'tables/chapters.dart';
import 'tables/read_histories.dart';
import 'tables/series.dart';
import 'tables/bookmarks.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    WorksTable,
    AuthorsTable,
    WorkAuthorsTable,
    TagsTable,
    WorkFandomsTable,
    WorkRelationshipsTable,
    WorkCharactersTable,
    WorkTagsTable,
    ChaptersTable,
    ReadHistoriesTable,
    SeriesTable,
    WorkSeries,
    BookmarksTable,
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
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // Migration for adding hits column
          await m.addColumn(readHistoriesTable, readHistoriesTable.hits);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'archiverse_database.db'));
    return NativeDatabase.createInBackground(file);
  });
}
