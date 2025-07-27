import 'package:archiverse/api.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/library_category.dart';
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

  Future<bool> isWorkInCategory(Work work, LibraryCategory category) async {
    try {
      return await LibraryRepository.isWorkInCategory(work, category);
    } catch (e) {
      print('Error checking if work is in category ${category.name}: $e');
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

      // Remove work from all categories first
      await LibraryRepository.removeWorkFromAllCategories(work.id);

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

  Future<List<LibraryCategory>> getAllLibraryCategories() async {
    try {
      return await LibraryRepository.getAllLibraryCategories();
    } catch (e) {
      print('Error fetching library categories: $e');
      return [];
    }
  }

  Future<List<LibraryCategory>> getLibraryCategories(int page) async {
    try {
      return await LibraryRepository.getLibraryCategories(page);
    } catch (e) {
      print('Error fetching library categories for page $page: $e');
      return [];
    }
  }

  Future<List<Work>> getWorksByCategory(LibraryCategory category) async {
    try {
      if (category.id == null) {
        print('Category ID is null, cannot fetch works');
        return [];
      }

      return await LibraryRepository.getWorksByCategory(category.id!);
    } catch (e) {
      print('Error fetching works for category ${category.name}: $e');
      return [];
    }
  }

  Future<void> addWorkToCategory(Work work, LibraryCategory category) async {
    try {
      // Check if work is in Library first
      if (!(await LibraryRepository.isWorkInLibrary(work.id))) {
        print('Work not found in library, cannot add to category');
        return;
      }

      if (category.id == null) {
        print('Category ID is null, cannot add work to category');
        return;
      }

      await LibraryRepository.addWorkToCategory(work.id, category.id!);
    } catch (e) {
      print('Error adding work to category ${category.name}: $e');
    }
  }

  Future<void> removeWorkFromCategory(
    Work work,
    LibraryCategory category,
  ) async {
    try {
      if (!(await LibraryRepository.isWorkInLibrary(work.id))) {
        print('Work not found in library, cannot remove from category');
        return;
      }

      if (category.id == null) {
        print('Category ID is null, cannot remove work from category');
        return;
      }

      await LibraryRepository.removeWorkFromCategory(work.id, category.id!);
    } catch (e) {
      print('Error removing work from category ${category.name}: $e');
    }
  }

  Future<void> createLibraryCategory(
    String name, {
    String? icon,
    required String color,
  }) async {
    try {
      final category = LibraryCategory(name: name, icon: icon, color: color);
      await LibraryRepository.createLibraryCategory(category);
    } catch (e) {
      print('Error creating library category: $e');
    }
  }

  Future<void> updateLibraryCategory(LibraryCategory category) async {
    try {
      await LibraryRepository.updateLibraryCategory(category);
    } catch (e) {
      print('Error updating library category: $e');
    }
  }

  Future<void> deleteLibraryCategory(LibraryCategory category) async {
    try {
      if (category.id == null) {
        print('Category ID is null, cannot delete category');
        return;
      }

      await LibraryRepository.deleteLibraryCategory(category.id!);
    } catch (e) {
      print('Error deleting library category: $e');
    }
  }
}
