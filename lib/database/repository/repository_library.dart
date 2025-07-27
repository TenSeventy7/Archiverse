import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/models/work.dart';

extension LibraryRepository on DataRepository {
  // Library operations
  static Future<void> addWorkToLibrary(
    int workId, {
    DateTime? timestamp,
  }) async {
    await DataRepository.database.libraryDao.addWork(
      workId,
      timestamp: timestamp,
    );
  }

  static Future<bool> removeWorkFromLibrary(int workId) async {
    return await DataRepository.database.libraryDao.removeWork(workId);
  }

  static Future<bool> isWorkInLibrary(int workId) async {
    return await DataRepository.database.libraryDao.containsWork(workId);
  }

  static Future<List<int>> getAllLibraryWorkIds() async {
    return await DataRepository.database.libraryDao.getAllWorkIds();
  }

  static Future<List<Work>> getRecentlyAddedToLibrary({
    int? limit,
    int? offset,
  }) async {
    return await DataRepository.database.libraryDao.getRecentlyAdded(
      limit: limit,
      offset: offset,
    );
  }

  static Future<int> getLibraryWorkCount() async {
    return await DataRepository.database.libraryDao.getTotalCount();
  }

  // Library category operations
  static Future<LibraryCategory> createLibraryCategory(
    LibraryCategory category,
  ) async {
    final id = await DataRepository.database.libraryCategoriesDao.create(
      category,
    );
    return category.copyWith(id: id);
  }

  static Future<LibraryCategory?> getLibraryCategoryByName(String name) async {
    return await DataRepository.database.libraryCategoriesDao.getByName(name);
  }

  static Future<List<LibraryCategory>> getAllLibraryCategories() async {
    return await DataRepository.database.libraryCategoriesDao
        .getAllCategories();
  }

  static Future<bool> updateLibraryCategory(LibraryCategory category) async {
    return await DataRepository.database.libraryCategoriesDao.updateCategory(
      category,
    );
  }

  static Future<bool> deleteLibraryCategory(int id) async {
    // Remove all works from category first
    await DataRepository.database.libraryCategoriesDao
        .removeAllWorksFromCategory(id);
    return await DataRepository.database.libraryCategoriesDao.deleteCategory(
      id,
    );
  }

  // Work-category relationship operations
  static Future<void> addWorkToCategory(int workId, int categoryId) async {
    await DataRepository.database.libraryCategoriesDao.addWorkToCategory(
      workId,
      categoryId,
    );
  }

  static Future<bool> removeWorkFromCategory(int workId, int categoryId) async {
    return await DataRepository.database.libraryCategoriesDao
        .removeWorkFromCategory(workId, categoryId);
  }

  static Future<List<Work>> getWorksByCategory(int categoryId) async {
    return await DataRepository.database.libraryCategoriesDao
        .getWorksByCategory(categoryId);
  }

  static Future<List<LibraryCategory>> getCategoriesForWork(int workId) async {
    return await DataRepository.database.libraryCategoriesDao
        .getCategoriesForWork(workId);
  }

  static Future<int> getCategoryWorkCount(int categoryId) async {
    return await DataRepository.database.libraryCategoriesDao.getWorkCount(
      categoryId,
    );
  }

  static Future<bool> removeAllWorksFromCategory(int categoryId) async {
    return await DataRepository.database.libraryCategoriesDao
        .removeAllWorksFromCategory(categoryId);
  }
}
