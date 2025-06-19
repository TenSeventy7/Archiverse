import 'package:archiverse/database/tables/chapters.dart';
import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class ReadHistoriesTable extends Table {
  @override
  String get tableName => 'read_histories';

  IntColumn get workId => integer().references(WorksTable, #id)();
  IntColumn get chapterId =>
      integer().references(ChaptersTable, #id).nullable()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get position => integer()();
  TextColumn get status => text()(); // ReadStatus enum as string
  RealColumn get completion => real()();

  @override
  Set<Column> get primaryKey => {workId};
}
