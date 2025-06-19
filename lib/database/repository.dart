import 'package:archiverse/database/database.dart';

export 'package:archiverse/database/repository/read_history.dart';
export 'package:archiverse/database/repository/work.dart';

class DataRepository {
  static final AppDatabase _database = AppDatabase();

  // Get the database instance for extensions
  static AppDatabase get database => _database;

  // Utility
  static void close() {
    _database.close();
  }
}
