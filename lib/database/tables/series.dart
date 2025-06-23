import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class DbSeries extends Table {
  @override
  String get tableName => 'series';

  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get summary => text().withDefault(const Constant(''))();
  IntColumn get words => integer().withDefault(const Constant(0))();
  IntColumn get works => integer().withDefault(const Constant(0))();
  IntColumn get bookmarks => integer().withDefault(const Constant(0))();
  DateTimeColumn get updateDate => dateTime().nullable()();
  BoolColumn get finished => boolean().nullable()();
  DateTimeColumn get publishDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class DbWorkSeries extends Table {
  IntColumn get workId => integer().references(DbWorks, #id)();
  IntColumn get seriesId => integer().references(DbSeries, #id)();
  IntColumn get part => integer()();

  @override
  Set<Column> get primaryKey => {workId, seriesId};
}
