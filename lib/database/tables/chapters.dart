import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class DbChapters extends Table {
  @override
  String get tableName => 'chapters';

  IntColumn get id => integer()();
  IntColumn get workId => integer().references(DbWorks, #id)();
  IntColumn get chapter => integer()();
  TextColumn get title => text()();
  DateTimeColumn get publishDate => dateTime().nullable()();
  TextColumn get summary => text().nullable()();
  TextColumn get preface => text().nullable()();
  TextColumn get postface => text().nullable()();
  TextColumn get content => text().nullable()();
  IntColumn get words => integer().withDefault(const Constant(0))();
  IntColumn get comments => integer().withDefault(const Constant(0))();
  BoolColumn get oneshot => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
