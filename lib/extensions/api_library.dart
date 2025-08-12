import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/models/work.dart';

extension ApiLibrary on AppApi {
  Future<bool> isWorkInLibrary(Work work) async {
    try {
      return await LibraryRepository.isWorkInLibrary(work.id);
    } catch (e) {
      print('Error checking if work is in library: $e');
      return false;
    }
  }

  Future<bool> isWorkInFolder(Work work, LibraryFolder folder) async {
    try {
      return await LibraryRepository.isWorkInFolder(work, folder);
    } catch (e) {
      print('Error checking if work is in folder ${folder.name}: $e');
      return false;
    }
  }

  Future<void> addWorkToLibrary(Work work) async {
    try {
      // Add work to database if not already present
      if (!(await WorkRepository.workExists(work.id))) {
        await WorkRepository.saveWork(work);
      }

      await LibraryRepository.addWorkToLibrary(
        work.id,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      print('Error adding work to library: $e');
    }
  }

  Future<void> removeWorkFromLibrary(Work work) async {
    try {
      if (!(await WorkRepository.workExists(work.id))) {
        print('Work not found in database, cannot remove from library');
        return;
      }

      if (!(await LibraryRepository.isWorkInLibrary(work.id))) {
        print('Work not found in library, cannot remove');
        return;
      }

      // Remove work from all folders first
      await LibraryRepository.removeWorkFromAllFolders(work.id);

      // Remove work from library
      await LibraryRepository.removeWorkFromLibrary(work.id);

      // Remove work from database if it's not used elsewhere
      await WorkRepository.cleanUpWork(work.id);
    } catch (e) {
      print('Error removing work from library: $e');
    }
  }

  Future<List<Work>> getWorksInLibrary({required int page}) async {
    try {
      return await LibraryRepository.getWorksInLibrary(page);
    } catch (e) {
      print('Error fetching works in library: $e');
      return [];
    }
  }

  Future<List<Work>> getRecentlyAddedToLibrary({
    int? limit,
    int? offset,
  }) async {
    try {
      return await LibraryRepository.getRecentlyAddedToLibrary(
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      print('Error fetching recently added works: $e');
      return [];
    }
  }

  Future<List<LibraryFolder>> getAllLibraryFolders() async {
    try {
      return await LibraryRepository.getAllLibraryFolders();
    } catch (e) {
      print('Error fetching library folders: $e');
      return [];
    }
  }

  Future<List<LibraryFolder>> getLibraryFolders(int page) async {
    try {
      return await LibraryRepository.getLibraryFolders(page);
    } catch (e) {
      print('Error fetching library folders for page $page: $e');
      return [];
    }
  }

  Future<List<Work>> getWorksByFolder(LibraryFolder folder) async {
    try {
      if (folder.id == null) {
        print('Folder ID is null, cannot fetch works');
        return [];
      }

      return await LibraryRepository.getWorksByFolder(folder.id!);
    } catch (e) {
      print('Error fetching works for folder ${folder.name}: $e');
      return [];
    }
  }

  Future<void> addWorkToFolder(Work work, LibraryFolder folder) async {
    try {
      // Check if work is in Library first
      if (!(await LibraryRepository.isWorkInLibrary(work.id))) {
        print('Work not found in library, cannot add to folder');
        return;
      }

      if (folder.id == null) {
        print('Folder ID is null, cannot add work to folder');
        return;
      }

      await LibraryRepository.addWorkToFolder(work.id, folder.id!);
    } catch (e) {
      print('Error adding work to folder ${folder.name}: $e');
    }
  }

  Future<void> removeWorkFromFolder(Work work, LibraryFolder folder) async {
    try {
      if (!(await LibraryRepository.isWorkInLibrary(work.id))) {
        print('Work not found in library, cannot remove from folder');
        return;
      }

      if (folder.id == null) {
        print('Folder ID is null, cannot remove work from folder');
        return;
      }

      await LibraryRepository.removeWorkFromFolder(work.id, folder.id!);
    } catch (e) {
      print('Error removing work from folder ${folder.name}: $e');
    }
  }

  Future<void> createLibraryFolder(
    String name, {
    String? icon,
    required String color,
  }) async {
    try {
      final folder = LibraryFolder(name: name, icon: icon, color: color);
      await LibraryRepository.createLibraryFolder(folder);
    } catch (e) {
      print('Error creating library folder: $e');
    }
  }

  Future<void> updateLibraryFolder(LibraryFolder folder) async {
    try {
      await LibraryRepository.updateLibraryFolder(folder);
    } catch (e) {
      print('Error updating library folder: $e');
    }
  }

  Future<void> deleteLibraryFolder(LibraryFolder folder) async {
    try {
      if (folder.id == null) {
        print('Folder ID is null, cannot delete folder');
        return;
      }

      await LibraryRepository.deleteLibraryFolder(folder.id!);
    } catch (e) {
      print('Error deleting library folder: $e');
    }
  }
}
