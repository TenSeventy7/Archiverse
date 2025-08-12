import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/library_folder.dart';
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

  static Future<bool> removeWorkFromAllFolders(int workId) async {
    return await DataRepository.database.libraryFoldersDao
        .removeWorkFromAllFolders(workId);
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

  // Library folder operations
  static Future<LibraryFolder> createLibraryFolder(LibraryFolder folder) async {
    final id = await DataRepository.database.libraryFoldersDao.create(folder);
    return folder.copyWith(id: id);
  }

  static Future<LibraryFolder?> getLibraryFolderByName(String name) async {
    return await DataRepository.database.libraryFoldersDao.getByName(name);
  }

  static Future<List<LibraryFolder>> getAllLibraryFolders() async {
    return await DataRepository.database.libraryFoldersDao.getAllFolders();
  }

  static Future<List<LibraryFolder>> getLibraryFolders(int page) async {
    return await DataRepository.database.libraryFoldersDao.getFolders(page);
  }

  static Future<bool> updateLibraryFolder(LibraryFolder folder) async {
    return await DataRepository.database.libraryFoldersDao.updateFolder(folder);
  }

  static Future<bool> deleteLibraryFolder(int id) async {
    // Remove all works from folder first
    await DataRepository.database.libraryFoldersDao.removeAllWorksFromFolder(
      id,
    );
    return await DataRepository.database.libraryFoldersDao.deleteFolder(id);
  }

  // Work-folder relationship operations
  static Future<void> addWorkToFolder(int workId, int folderId) async {
    await DataRepository.database.libraryFoldersDao.addWorkToFolder(
      workId,
      folderId,
    );
  }

  static Future<bool> removeWorkFromFolder(int workId, int folderId) async {
    return await DataRepository.database.libraryFoldersDao.removeWorkFromFolder(
      workId,
      folderId,
    );
  }

  static Future<List<Work>> getWorksByFolder(int folderId) async {
    return await DataRepository.database.libraryFoldersDao.getWorksByFolder(
      folderId,
    );
  }

  static Future<bool> isWorkInFolder(Work work, LibraryFolder folder) async {
    return await DataRepository.database.libraryFoldersDao.isWorkInFolder(
      work.id,
      folder.id!,
    );
  }

  static Future<List<LibraryFolder>> getFoldersForWork(int workId) async {
    return await DataRepository.database.libraryFoldersDao.getFoldersForWork(
      workId,
    );
  }

  static Future<int> getFolderWorkCount(int folderId) async {
    return await DataRepository.database.libraryFoldersDao.getWorkCount(
      folderId,
    );
  }

  static Future<bool> removeAllWorksFromFolder(int folderId) async {
    return await DataRepository.database.libraryFoldersDao
        .removeAllWorksFromFolder(folderId);
  }

  static Future<List<Work>> getWorksInLibrary(int page) async {
    return await DataRepository.database.libraryDao.getWorksInLibrary(
      page: page,
    );
  }
}
