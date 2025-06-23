import 'package:archiverse/database/tables/chapters.dart';
import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class DbReadHistories extends Table {
  @override
  String get tableName => 'read_histories';

  IntColumn get workId => integer().references(DbWorks, #id)();
  IntColumn get chapterId => integer().references(DbChapters, #id).nullable()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get position => integer()();
  TextColumn get status => text()(); // ReadStatus enum as string
  RealColumn get completion => real()();
  IntColumn get hits => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {workId};
}
