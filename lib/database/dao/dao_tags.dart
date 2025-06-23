import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/tag.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

@DriftAccessor(
  tables: [
    DbTags,
    DbWorkFandoms,
    DbWorkRelationships,
    DbWorkCharacters,
    DbWorkTags,
  ],
)
class TagsDao extends BaseDao<DbTags, DbTag, Tag> {
  TagsDao(super.db);

  @override
  TableInfo<DbTags, DbTag> get table => db.dbTags;

  @override
  Insertable<DbTag> toCompanion(Tag tag) {
    return DbTagsCompanion(
      name: Value(tag.name),
      localizedName: Value(tag.localizedName),
      count: Value(tag.count),
      canonical: Value(tag.canonical),
      type: Value(tag.type.name),
    );
  }

  @override
  Tag fromRow(DbTag row) {
    return Tag(
      name: row.name,
      localizedName: row.localizedName,
      count: row.count,
      canonical: row.canonical,
      type: TagType.values.firstWhere((t) => t.name == row.type),
    );
  }

  // Get tags by type
  Future<List<Tag>> getTagsByType(TagType type) async {
    final tags = await getMultiple((t) => t.type.equals(type.name));
    return tags.map((t) => fromRow(t)).toList();
  }

  // Get popular tags (by count)
  Future<List<Tag>> getPopularTags({int limit = 50, TagType? type}) async {
    final query = select(table)..orderBy([(t) => OrderingTerm.desc(t.count)]);

    if (type != null) {
      query.where((t) => t.type.equals(type.name));
    }

    query.limit(limit);

    final tags = await query.get();
    return tags.map((t) => fromRow(t)).toList();
  }

  // Search tags by name
  Future<List<Tag>> searchTags(
    String query, {
    TagType? type,
    int limit = 50,
  }) async {
    final searchQuery = select(table)
      ..where((t) => t.name.contains(query) | t.localizedName.contains(query))
      ..orderBy([(t) => OrderingTerm.desc(t.count)])
      ..limit(limit);

    if (type != null) {
      searchQuery.where((t) => t.type.equals(type.name));
    }

    final tags = await searchQuery.get();
    return tags.map((t) => fromRow(t)).toList();
  }

  // Get tag by name
  Future<Tag?> getTagByName(String name) async {
    final tag = await getSingle((t) => t.name.equals(name));
    return tag != null ? fromRow(tag) : null;
  }

  // Get canonical tags only
  Future<List<Tag>> getCanonicalTags({TagType? type, int limit = 100}) async {
    final query = select(table)
      ..where((t) => t.canonical.equals(true))
      ..orderBy([(t) => OrderingTerm.desc(t.count)])
      ..limit(limit);

    if (type != null) {
      query.where((t) => t.type.equals(type.name));
    }

    final tags = await query.get();
    return tags.map((t) => fromRow(t)).toList();
  }

  // Update tag count
  Future<void> updateTagCount(String tagName, int count) async {
    await (update(table)..where((t) => t.name.equals(tagName))).write(
      DbTagsCompanion(count: Value(count)),
    );
  }

  // Increment tag count
  Future<void> incrementTagCount(String tagName, {int increment = 1}) async {
    await customUpdate(
      'UPDATE tags SET count = count + ? WHERE name = ?',
      variables: [Variable<int>(increment), Variable<String>(tagName)],
    );
  }

  // Get tags for a specific work
  Future<List<Tag>> getWorkTags(int workId, TagType? type) async {
    late JoinedSelectStatement query;

    switch (type) {
      case TagType.FANDOM:
        query = select(table).join([
          innerJoin(
            db.dbWorkFandoms,
            db.dbWorkFandoms.tagName.equalsExp(table.asDslTable.name),
          ),
        ])..where(db.dbWorkFandoms.workId.equals(workId));
        break;
      case TagType.RELATIONSHIP:
        query = select(table).join([
          innerJoin(
            db.dbWorkRelationships,
            db.dbWorkRelationships.tagName.equalsExp(table.asDslTable.name),
          ),
        ])..where(db.dbWorkRelationships.workId.equals(workId));
        break;
      case TagType.CHARACTER:
        query = select(table).join([
          innerJoin(
            db.dbWorkCharacters,
            db.dbWorkCharacters.tagName.equalsExp(table.asDslTable.name),
          ),
        ])..where(db.dbWorkCharacters.workId.equals(workId));
        break;
      case TagType.FREEFORM:
        query = select(table).join([
          innerJoin(
            db.dbWorkTags,
            db.dbWorkTags.tagName.equalsExp(table.asDslTable.name),
          ),
        ])..where(db.dbWorkTags.workId.equals(workId));
        break;
      case null:
        // Get all tags for work from all categories
        final fandoms = await getWorkTags(workId, TagType.FANDOM);
        final relationships = await getWorkTags(workId, TagType.RELATIONSHIP);
        final characters = await getWorkTags(workId, TagType.CHARACTER);
        final freeform = await getWorkTags(workId, TagType.FREEFORM);
        return [...fandoms, ...relationships, ...characters, ...freeform];
    }

    final results = await query.get();
    return results.map((row) => fromRow(row.readTable(table))).toList();
  }

  // Link tag to work based on type
  Future<void> linkTagToWork(int workId, String tagName, TagType type) async {
    switch (type) {
      case TagType.FANDOM:
        await into(db.dbWorkFandoms).insertOnConflictUpdate(
          DbWorkFandomsCompanion(
            workId: Value(workId),
            tagName: Value(tagName),
          ),
        );
        break;
      case TagType.RELATIONSHIP:
        await into(db.dbWorkRelationships).insertOnConflictUpdate(
          DbWorkRelationshipsCompanion(
            workId: Value(workId),
            tagName: Value(tagName),
          ),
        );
        break;
      case TagType.CHARACTER:
        await into(db.dbWorkCharacters).insertOnConflictUpdate(
          DbWorkCharactersCompanion(
            workId: Value(workId),
            tagName: Value(tagName),
          ),
        );
        break;
      case TagType.FREEFORM:
        await into(db.dbWorkTags).insertOnConflictUpdate(
          DbWorkTagsCompanion(workId: Value(workId), tagName: Value(tagName)),
        );
        break;
    }
  }

  // Remove tag from work
  Future<void> unlinkTagFromWork(
    int workId,
    String tagName,
    TagType type,
  ) async {
    switch (type) {
      case TagType.FANDOM:
        await (delete(db.dbWorkFandoms)..where(
              (wf) => wf.workId.equals(workId) & wf.tagName.equals(tagName),
            ))
            .go();
        break;
      case TagType.RELATIONSHIP:
        await (delete(db.dbWorkRelationships)..where(
              (wr) => wr.workId.equals(workId) & wr.tagName.equals(tagName),
            ))
            .go();
        break;
      case TagType.CHARACTER:
        await (delete(db.dbWorkCharacters)..where(
              (wc) => wc.workId.equals(workId) & wc.tagName.equals(tagName),
            ))
            .go();
        break;
      case TagType.FREEFORM:
        await (delete(db.dbWorkTags)..where(
              (wt) => wt.workId.equals(workId) & wt.tagName.equals(tagName),
            ))
            .go();
        break;
    }
  }

  // Bulk insert/update tags with their work associations
  Future<void> insertOrUpdateWorkTags(
    int workId,
    List<Tag> tags,
    TagType type,
  ) async {
    await transaction(() async {
      for (final tag in tags) {
        // Insert/update the tag
        await insertOrUpdate(tag);

        // Link to work
        await linkTagToWork(workId, tag.name, type);
      }
    });
  }

  // Remove all tags of a type from a work
  Future<void> removeAllWorkTags(int workId, TagType type) async {
    switch (type) {
      case TagType.FANDOM:
        await (delete(
          db.dbWorkFandoms,
        )..where((wf) => wf.workId.equals(workId))).go();
        break;
      case TagType.RELATIONSHIP:
        await (delete(
          db.dbWorkRelationships,
        )..where((wr) => wr.workId.equals(workId))).go();
        break;
      case TagType.CHARACTER:
        await (delete(
          db.dbWorkCharacters,
        )..where((wc) => wc.workId.equals(workId))).go();
        break;
      case TagType.FREEFORM:
        await (delete(
          db.dbWorkTags,
        )..where((wt) => wt.workId.equals(workId))).go();
        break;
    }
  }

  // Get works count for a tag
  Future<int> getWorkCountForTag(String tagName) async {
    final fandomCount =
        await (selectOnly(db.dbWorkFandoms)
              ..addColumns([db.dbWorkFandoms.workId.count()])
              ..where(db.dbWorkFandoms.tagName.equals(tagName)))
            .getSingle();

    final relationshipCount =
        await (selectOnly(db.dbWorkRelationships)
              ..addColumns([db.dbWorkRelationships.workId.count()])
              ..where(db.dbWorkRelationships.tagName.equals(tagName)))
            .getSingle();

    final characterCount =
        await (selectOnly(db.dbWorkCharacters)
              ..addColumns([db.dbWorkCharacters.workId.count()])
              ..where(db.dbWorkCharacters.tagName.equals(tagName)))
            .getSingle();

    final additionalCount =
        await (selectOnly(db.dbWorkTags)
              ..addColumns([db.dbWorkTags.workId.count()])
              ..where(db.dbWorkTags.tagName.equals(tagName)))
            .getSingle();

    return ((fandomCount.read(db.dbWorkFandoms.workId.count()) ?? 0) +
            (relationshipCount.read(db.dbWorkRelationships.workId.count()) ??
                0) +
            (characterCount.read(db.dbWorkCharacters.workId.count()) ?? 0) +
            (additionalCount.read(db.dbWorkTags.workId.count()) ?? 0))
        .toInt();
  }

  // Get similar tags (by name similarity)
  Future<List<Tag>> getSimilarTags(String tagName, {int limit = 10}) async {
    final tags =
        await (select(table)
              ..where(
                (t) => t.name.contains(tagName) & t.name.isNotValue(tagName),
              )
              ..orderBy([(t) => OrderingTerm.desc(t.count)])
              ..limit(limit))
            .get();

    return tags.map((t) => fromRow(t)).toList();
  }
}
