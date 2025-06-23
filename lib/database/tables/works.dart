import 'package:drift/drift.dart';

class DbWorks extends Table {
  @override
  String get tableName => 'works'; // Keep the actual table name as 'works'

  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get summary => text()();
  BoolColumn get requiresAuth => boolean()();
  DateTimeColumn get updateDate => dateTime()();
  IntColumn get words => integer()();
  IntColumn get chapters => integer()();
  IntColumn get comments => integer()();
  IntColumn get kudos => integer()();
  IntColumn get bookmarks => integer()();
  IntColumn get hits => integer()();
  IntColumn get totalChapters => integer().nullable()();
  TextColumn get language => text()();
  BoolColumn get finished => boolean().nullable()();
  TextColumn get rating => text()(); // Store as string, convert to enum
  TextColumn get relationship => text()(); // JSON array
  TextColumn get warnings => text()(); // JSON array
  DateTimeColumn get publishDate => dateTime().nullable()();
  DateTimeColumn get completedDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get giftMessage => text().nullable()();
  IntColumn get subscriptions => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
