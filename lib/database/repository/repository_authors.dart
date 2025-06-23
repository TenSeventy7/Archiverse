import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/pseud.dart';

extension AuthorRepository on DataRepository {
  static Future<void> saveAuthor(Pseud author) async {
    await DataRepository.database.authorsDao.insertOrUpdate(author);
  }

  static Future<Pseud?> getAuthor(int authorId) async {
    return await DataRepository.database.authorsDao.getAuthorById(authorId);
  }

  static Future<Pseud?> getAuthorByNameAndPseud(
    String name,
    String pseud,
  ) async {
    return await DataRepository.database.authorsDao.getAuthorByNameAndPseud(
      name,
      pseud,
    );
  }

  static Future<List<Pseud>> searchAuthors(
    String query, {
    int limit = 50,
  }) async {
    return await DataRepository.database.authorsDao.searchAuthors(
      query,
      limit: limit,
    );
  }

  static Future<List<Pseud>> getPopularAuthors({int limit = 50}) async {
    return await DataRepository.database.authorsDao.getPopularAuthors(
      limit: limit,
    );
  }

  static Future<List<Pseud>> getWorkAuthors(int workId) async {
    return await DataRepository.database.authorsDao.getWorkAuthors(workId);
  }

  static Future<void> linkAuthorToWork(int workId, int authorId) async {
    await DataRepository.database.authorsDao.linkAuthorToWork(workId, authorId);
  }

  static Future<void> unlinkAuthorFromWork(int workId, int authorId) async {
    await DataRepository.database.authorsDao.unlinkAuthorFromWork(
      workId,
      authorId,
    );
  }

  static Future<int> saveAuthorAndGetId(Pseud author) async {
    return await DataRepository.database.authorsDao
        .insertOrUpdateAuthorAndGetId(author);
  }

  static Future<void> saveWorkAuthors(int workId, List<Pseud> authors) async {
    await DataRepository.database.authorsDao.insertOrUpdateWorkAuthors(
      workId,
      authors,
    );
  }

  static Future<void> removeAllWorkAuthors(int workId) async {
    await DataRepository.database.authorsDao.removeAllWorkAuthors(workId);
  }

  static Future<void> updateAuthorStats(
    int authorId, {
    int? works,
    int? series,
    int? bookmarks,
    int? collections,
    int? gifts,
  }) async {
    await DataRepository.database.authorsDao.updateAuthorStats(
      authorId,
      works: works,
      series: series,
      bookmarks: bookmarks,
      collections: collections,
      gifts: gifts,
    );
  }

  static Future<List<Pseud>> getGuestAuthors({int limit = 50}) async {
    return await DataRepository.database.authorsDao.getGuestAuthors(
      limit: limit,
    );
  }

  static Future<List<Pseud>> getRegisteredAuthors({int limit = 50}) async {
    return await DataRepository.database.authorsDao.getRegisteredAuthors(
      limit: limit,
    );
  }

  static Future<List<Pseud>> getRecentlyActiveAuthors({int limit = 50}) async {
    return await DataRepository.database.authorsDao.getRecentlyActiveAuthors(
      limit: limit,
    );
  }

  static Future<int> getWorkCountForAuthor(int authorId) async {
    return await DataRepository.database.authorsDao.getWorkCountForAuthor(
      authorId,
    );
  }

  static Future<bool> authorHasWorks(int authorId) async {
    return await DataRepository.database.authorsDao.authorHasWorks(authorId);
  }

  static Future<Map<String, int>> getAuthorStatistics() async {
    return await DataRepository.database.authorsDao.getAuthorStatistics();
  }

  static Future<void> deleteAuthor(int authorId) async {
    await DataRepository.database.authorsDao.deleteWhere(
      (a) => a.id.equals(authorId),
    );
  }

  static Future<bool> authorExists(int authorId) async {
    return await DataRepository.database.authorsDao.exists(
      (a) => a.id.equals(authorId),
    );
  }

  static Future<int> getAuthorCount() async {
    return await DataRepository.database.authorsDao.getCount();
  }

  static Future<List<Pseud>> getAllAuthors() async {
    final authors = await DataRepository.database.authorsDao.getAll();
    return authors
        .map((a) => DataRepository.database.authorsDao.fromRow(a))
        .toList();
  }
}
