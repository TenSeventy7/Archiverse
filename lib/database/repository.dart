import 'package:archiverse/database/database.dart';

export 'package:archiverse/database/repository/repository_authors.dart';
export 'package:archiverse/database/repository/repository_chapters.dart';
export 'package:archiverse/database/repository/repository_read_histories.dart';
export 'package:archiverse/database/repository/repository_series.dart';
export 'package:archiverse/database/repository/repository_tags.dart';
export 'package:archiverse/database/repository/repository_works.dart';

class DataRepository {
  static final DataRepository _instance = DataRepository._internal();
  static final AppDatabase _database = AppDatabase();

  DataRepository._internal();

  factory DataRepository() => _instance;

  // Get the database instance for extensions
  static AppDatabase get database => _database;

  // Instance getter for the database
  AppDatabase get db => _database;

  // Utility
  static void close() {
    _database.close();
  }

  // Instance method to close
  void closeDb() {
    _database.close();
  }
}
