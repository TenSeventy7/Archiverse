import 'dart:io';
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
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'archiverse_database.db'));
    return NativeDatabase.createInBackground(file);
  });
}
