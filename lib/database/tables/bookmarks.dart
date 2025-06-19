import 'package:archiverse/database/tables/authors.dart';
import 'package:archiverse/database/tables/series.dart';
import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class BookmarksTable extends Table {
  @override
  String get tableName => 'bookmarks';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get workId => integer().references(WorksTable, #id).nullable()();
  IntColumn get seriesId => integer().references(SeriesTable, #id).nullable()();
  IntColumn get userId => integer().references(AuthorsTable, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()(); // BookmarkType enum as string
  TextColumn get notes => text().nullable()();
  TextColumn get privateNotes => text().nullable()();
  TextColumn get recNotes => text().nullable()();
}
