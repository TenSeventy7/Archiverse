import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/tag.dart';

extension TagRepository on DataRepository {
  static Future<void> saveTag(Tag tag) async {
    await DataRepository.database.tagsDao.insertOrUpdate(tag);
  }

  static Future<Tag?> getTag(String name) async {
    return await DataRepository.database.tagsDao.getTagByName(name);
  }

  static Future<List<Tag>> getTagsByType(TagType type) async {
    return await DataRepository.database.tagsDao.getTagsByType(type);
  }

  static Future<List<Tag>> getPopularTags({
    int limit = 50,
    TagType? type,
  }) async {
    return await DataRepository.database.tagsDao.getPopularTags(
      limit: limit,
      type: type,
    );
  }

  static Future<List<Tag>> searchTags(
    String query, {
    TagType? type,
    int limit = 50,
  }) async {
    return await DataRepository.database.tagsDao.searchTags(
      query,
      type: type,
      limit: limit,
    );
  }

  static Future<List<Tag>> getCanonicalTags({
    TagType? type,
    int limit = 100,
  }) async {
    return await DataRepository.database.tagsDao.getCanonicalTags(
      type: type,
      limit: limit,
    );
  }

  static Future<List<Tag>> getWorkTags(int workId, {TagType? type}) async {
    return await DataRepository.database.tagsDao.getWorkTags(workId, type);
  }

  static Future<void> linkTagToWork(
    int workId,
    String tagName,
    TagType type,
  ) async {
    await DataRepository.database.tagsDao.linkTagToWork(workId, tagName, type);
  }

  static Future<void> unlinkTagFromWork(
    int workId,
    String tagName,
    TagType type,
  ) async {
    await DataRepository.database.tagsDao.unlinkTagFromWork(
      workId,
      tagName,
      type,
    );
  }

  static Future<void> saveWorkTags(
    int workId,
    List<Tag> tags,
    TagType type,
  ) async {
    await DataRepository.database.tagsDao.insertOrUpdateWorkTags(
      workId,
      tags,
      type,
    );
  }

  static Future<void> removeAllWorkTags(int workId, TagType type) async {
    await DataRepository.database.tagsDao.removeAllWorkTags(workId, type);
  }

  static Future<void> updateTagCount(String tagName, int count) async {
    await DataRepository.database.tagsDao.updateTagCount(tagName, count);
  }

  static Future<void> incrementTagCount(
    String tagName, {
    int increment = 1,
  }) async {
    await DataRepository.database.tagsDao.incrementTagCount(
      tagName,
      increment: increment,
    );
  }

  static Future<int> getWorkCountForTag(String tagName) async {
    return await DataRepository.database.tagsDao.getWorkCountForTag(tagName);
  }

  static Future<List<Tag>> getSimilarTags(
    String tagName, {
    int limit = 10,
  }) async {
    return await DataRepository.database.tagsDao.getSimilarTags(
      tagName,
      limit: limit,
    );
  }

  static Future<void> deleteTag(String tagName) async {
    await DataRepository.database.tagsDao.deleteWhere(
      (t) => t.name.equals(tagName),
    );
  }

  static Future<bool> tagExists(String tagName) async {
    return await DataRepository.database.tagsDao.exists(
      (t) => t.name.equals(tagName),
    );
  }

  static Future<int> getTagCount({TagType? type}) async {
    if (type != null) {
      return await DataRepository.database.tagsDao.getCount(
        (t) => t.type.equals(type.name),
      );
    }
    return await DataRepository.database.tagsDao.getCount();
  }

  static Future<List<Tag>> getAllTags() async {
    final tags = await DataRepository.database.tagsDao.getAll();
    return tags.map((t) => DataRepository.database.tagsDao.fromRow(t)).toList();
  }
}
