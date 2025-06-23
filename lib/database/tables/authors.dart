import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class DbAuthors extends Table {
  @override
  String get tableName => 'authors';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get pseud => text()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get bio => text().nullable()();
  DateTimeColumn get joinDate => dateTime().nullable()();
  IntColumn get works => integer().nullable()();
  IntColumn get series => integer().nullable()();
  IntColumn get bookmarks => integer().nullable()();
  IntColumn get collections => integer().nullable()();
  IntColumn get gifts => integer().nullable()();
  BoolColumn get guest => boolean().withDefault(const Constant(false))();
}

class DbWorkAuthors extends Table {
  @override
  String get tableName => 'work_authors';

  IntColumn get workId => integer().references(DbWorks, #id)();
  IntColumn get authorId => integer().references(DbAuthors, #id)();

  @override
  Set<Column> get primaryKey => {workId, authorId};
}
