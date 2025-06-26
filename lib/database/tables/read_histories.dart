import 'package:archiverse/database/tables/chapters.dart';
import 'package:archiverse/database/tables/works.dart';
import 'package:drift/drift.dart';

class DbReadHistories extends Table {
  @override
  String get tableName => 'read_histories';

  // Add auto-increment primary key for better data management
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workId => integer().references(DbWorks, #id)();
  IntColumn get chapterId => integer().references(DbChapters, #id).nullable()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get position => integer()();
  TextColumn get status => text()(); // ReadStatus enum as string
  RealColumn get completion => real()();
  IntColumn get hits => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {id};

  // Add indexes optimized for your date-based offset queries
  @override
  List<String> get customConstraints => [
    // Primary index for date-based queries (most recent first)
    'CREATE INDEX IF NOT EXISTS idx_read_histories_timestamp_desc ON read_histories(timestamp DESC)',
    // Composite index for per-work date queries
    'CREATE INDEX IF NOT EXISTS idx_read_histories_work_timestamp ON read_histories(work_id, timestamp DESC)',
    // Index for filtering by completion status with date
    'CREATE INDEX IF NOT EXISTS idx_read_histories_completion_timestamp ON read_histories(completion, timestamp DESC)',
    // Index for chapter-specific queries
    'CREATE INDEX IF NOT EXISTS idx_read_histories_chapter ON read_histories(chapter_id) WHERE chapter_id IS NOT NULL',
  ];
}
