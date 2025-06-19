import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class TagsTable extends Table {
  @override
  String get tableName => 'tags';

  TextColumn get name => text()(); // Primary key - tag names are unique in AO3
  TextColumn get localizedName => text()();
  IntColumn get count => integer().withDefault(const Constant(0))();
  BoolColumn get canonical => boolean().withDefault(const Constant(false))();
  TextColumn get type => text()(); // TagType enum as string

  @override
  Set<Column> get primaryKey => {name}; // Use name as primary key
}

class WorkFandomsTable extends Table {
  @override
  String get tableName => 'work_fandoms';

  IntColumn get workId => integer().references(WorksTable, #id)();
  TextColumn get tagName =>
      text().references(TagsTable, #name)(); // Reference tag by name

  @override
  Set<Column> get primaryKey => {workId, tagName};
}

class WorkRelationshipsTable extends Table {
  @override
  String get tableName => 'work_relationships';

  IntColumn get workId => integer().references(WorksTable, #id)();
  TextColumn get tagName =>
      text().references(TagsTable, #name)(); // Reference tag by name

  @override
  Set<Column> get primaryKey => {workId, tagName};
}

class WorkCharactersTable extends Table {
  @override
  String get tableName => 'work_characters';

  IntColumn get workId => integer().references(WorksTable, #id)();
  TextColumn get tagName =>
      text().references(TagsTable, #name)(); // Reference tag by name

  @override
  Set<Column> get primaryKey => {workId, tagName};
}

class WorkTagsTable extends Table {
  @override
  String get tableName => 'work_tags';

  IntColumn get workId => integer().references(WorksTable, #id)();
  TextColumn get tagName =>
      text().references(TagsTable, #name)(); // Reference tag by name

  @override
  Set<Column> get primaryKey => {workId, tagName};
}
