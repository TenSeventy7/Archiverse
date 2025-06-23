import 'dart:convert';
import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:drift/drift.dart';

import 'dao_base.dart';

@DriftAccessor(
  tables: [
    DbWorks,
    DbAuthors,
    DbWorkAuthors,
    DbTags,
    DbWorkFandoms,
    DbWorkRelationships,
    DbWorkCharacters,
    DbWorkTags,
  ],
)
class WorksDao extends BaseDao<DbWorks, DbWork, Work> {
  WorksDao(super.db);

  @override
  TableInfo<DbWorks, DbWork> get table => db.dbWorks;

  @override
  Insertable<DbWork> toCompanion(Work work) {
    return DbWorksCompanion(
      id: Value(work.id),
      title: Value(work.title),
      summary: Value(work.summary),
      requiresAuth: Value(work.requiresAuth),
      updateDate: Value(work.updateDate),
      words: Value(work.words),
      chapters: Value(work.chapters),
      comments: Value(work.comments),
      kudos: Value(work.kudos),
      bookmarks: Value(work.bookmarks),
      hits: Value(work.hits),
      totalChapters: Value(work.totalChapters),
      language: Value(work.language),
      finished: Value(work.finished),
      rating: Value(work.rating.name),
      relationship: Value(
        jsonEncode(work.relationship.map((r) => r.name).toList()),
      ),
      warnings: Value(jsonEncode(work.warnings.map((w) => w.name).toList())),
      publishDate: Value(work.publishDate),
      completedDate: Value(work.completedDate),
      notes: Value(work.notes),
      giftMessage: Value(work.giftMessage),
      subscriptions: Value(work.subscriptions),
    );
  }

  @override
  Work fromRow(DbWork row) {
    // Note: This returns a basic Work without related data
    // Use getWorkComplete for full work with relationships
    return Work(
      id: row.id,
      title: row.title,
      summary: row.summary,
      requiresAuth: row.requiresAuth,
      updateDate: row.updateDate,
      words: row.words,
      chapters: row.chapters,
      comments: row.comments,
      kudos: row.kudos,
      bookmarks: row.bookmarks,
      hits: row.hits,
      totalChapters: row.totalChapters,
      language: row.language,
      finished: row.finished,
      rating: AgeRating.values.firstWhere((r) => r.name == row.rating),
      relationship: (jsonDecode(row.relationship) as List)
          .map((r) => RelationshipType.values.firstWhere((rt) => rt.name == r))
          .toList(),
      warnings: (jsonDecode(row.warnings) as List)
          .map((w) => WarningType.values.firstWhere((wt) => wt.name == w))
          .toList(),
      publishDate: row.publishDate,
      completedDate: row.completedDate,
      notes: row.notes,
      giftMessage: row.giftMessage,
      subscriptions: row.subscriptions,
      // These will be empty - use getWorkComplete for full data
      authors: [],
      fandoms: [],
      relationships: [],
      characters: [],
      tags: [],
      series: [],
    );
  }

  // Custom methods for complex operations
  Future<void> insertOrUpdateWorkComplete(Work work) async {
    await transaction(() async {
      // Insert/update the basic work
      await insertOrUpdate(work);

      // Handle related data
      await _insertWorkAuthors(work);
      await _insertWorkTags(work.id, work.fandoms, 'fandoms');
      await _insertWorkTags(work.id, work.relationships, 'relationships');
      await _insertWorkTags(work.id, work.characters, 'characters');
      await _insertWorkTags(work.id, work.tags, 'tags');
    });
  }

  Future<Work?> getWorkComplete(int workId) async {
    final workData = await getSingle((w) => w.id.equals(workId));
    if (workData == null) return null;

    // Get authors
    final workAuthors = await _getWorkAuthors(workId);

    // Get tags for each category
    final fandoms = await _getWorkTags(workId, 'fandoms');
    final relationships = await _getWorkTags(workId, 'relationships');
    final characters = await _getWorkTags(workId, 'characters');
    final workTagsList = await _getWorkTags(workId, 'tags');

    return Work(
      id: workData.id,
      title: workData.title,
      summary: workData.summary,
      requiresAuth: workData.requiresAuth,
      series: [], // TODO: Implement series loading
      updateDate: workData.updateDate,
      authors: workAuthors,
      words: workData.words,
      chapters: workData.chapters,
      comments: workData.comments,
      kudos: workData.kudos,
      bookmarks: workData.bookmarks,
      hits: workData.hits,
      totalChapters: workData.totalChapters,
      language: workData.language,
      finished: workData.finished,
      fandoms: fandoms,
      relationships: relationships,
      characters: characters,
      tags: workTagsList,
      rating: AgeRating.values.firstWhere((r) => r.name == workData.rating),
      relationship: (jsonDecode(workData.relationship) as List)
          .map((r) => RelationshipType.values.firstWhere((rt) => rt.name == r))
          .toList(),
      warnings: (jsonDecode(workData.warnings) as List)
          .map((w) => WarningType.values.firstWhere((wt) => wt.name == w))
          .toList(),
      publishDate: workData.publishDate,
      completedDate: workData.completedDate,
      notes: workData.notes,
      giftMessage: workData.giftMessage,
      subscriptions: workData.subscriptions,
    );
  }

  Future<List<Work>> searchWorks(String query) async {
    final works = await (select(
      table,
    )..where((w) => w.title.contains(query) | w.summary.contains(query))).get();

    return works.map((w) => fromRow(w)).toList();
  }

  Future<List<Work>> getRecentWorks({int limit = 20}) async {
    final works =
        await (select(table)
              ..orderBy([(w) => OrderingTerm.desc(w.updateDate)])
              ..limit(limit))
            .get();

    return works.map((w) => fromRow(w)).toList();
  }

  Future<void> updateWorkStats(
    int workId, {
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    DateTime? updateDate,
  }) async {
    await (update(table)..where((w) => w.id.equals(workId))).write(
      DbWorksCompanion(
        comments: comments != null ? Value(comments) : const Value.absent(),
        kudos: kudos != null ? Value(kudos) : const Value.absent(),
        bookmarks: bookmarks != null ? Value(bookmarks) : const Value.absent(),
        hits: hits != null ? Value(hits) : const Value.absent(),
        updateDate: updateDate != null
            ? Value(updateDate)
            : const Value.absent(),
      ),
    );
  }

  // Private helper methods
  Future<List<Pseud>> _getWorkAuthors(int workId) async {
    dynamic dbAuthors = db.dbAuthors;
    DbWorkAuthors dbWorkAuthors = db.dbWorkAuthors;
    final query = select(dbAuthors).join([
      innerJoin(dbWorkAuthors, dbWorkAuthors.authorId.equalsExp(dbAuthors.id)),
    ])..where(dbWorkAuthors.workId.equals(workId));

    final results = await query.get();
    return results.map((row) {
      final author = row.readTable(dbAuthors);
      return Pseud(
        name: author.name,
        pseud: author.pseud,
        imageUrl: author.imageUrl,
        bio: author.bio,
        joinDate: author.joinDate,
        works: author.works,
        series: author.series,
        bookmarks: author.bookmarks,
        collections: author.collections,
        gifts: author.gifts,
        guest: author.guest,
      );
    }).toList();
  }

  Future<List<Tag>> _getWorkTags(int workId, String type) async {
    late JoinedSelectStatement query;

    dynamic dbTags = db.dbTags;
    DbWorkFandoms dbWorkFandoms = db.dbWorkFandoms;
    DbWorkRelationships dbWorkRelationships = db.dbWorkRelationships;
    DbWorkCharacters dbWorkCharacters = db.dbWorkCharacters;
    DbWorkTags dbWorkTags = db.dbWorkTags;

    switch (type) {
      case 'fandoms':
        query = select(dbTags).join([
          innerJoin(
            dbWorkFandoms,
            dbWorkFandoms.tagName.equalsExp(dbTags.name),
          ),
        ])..where(dbWorkFandoms.workId.equals(workId));
        break;
      case 'relationships':
        query = select(dbTags).join([
          innerJoin(
            dbWorkRelationships,
            dbWorkRelationships.tagName.equalsExp(dbTags.name),
          ),
        ])..where(dbWorkRelationships.workId.equals(workId));
        break;
      case 'characters':
        query = select(dbTags).join([
          innerJoin(
            dbWorkCharacters,
            dbWorkCharacters.tagName.equalsExp(dbTags.name),
          ),
        ])..where(dbWorkCharacters.workId.equals(workId));
        break;
      case 'tags':
        query = select(dbTags).join([
          innerJoin(dbWorkTags, dbWorkTags.tagName.equalsExp(dbTags.name)),
        ])..where(dbWorkTags.workId.equals(workId));
        break;
      default:
        throw ArgumentError('Invalid tag type: $type');
    }

    final results = await query.get();
    return results.map((row) {
      final tag = row.readTable(dbTags);
      return Tag(
        name: tag.name,
        localizedName: tag.localizedName,
        count: tag.count,
        canonical: tag.canonical,
        type: TagType.values.firstWhere((t) => t.name == tag.type),
      );
    }).toList();
  }

  Future<void> _insertWorkAuthors(Work work) async {
    for (final author in work.authors) {
      // Insert or update the author
      await into(db.dbAuthors).insertOnConflictUpdate(
        DbAuthorsCompanion(
          name: Value(author.name),
          pseud: Value(author.pseud),
          imageUrl: Value(author.imageUrl),
          bio: Value(author.bio),
          joinDate: Value(author.joinDate),
          works: Value(author.works),
          series: Value(author.series),
          bookmarks: Value(author.bookmarks),
          collections: Value(author.collections),
          gifts: Value(author.gifts),
          guest: Value(author.guest),
        ),
      );

      // Get the author record
      final authorRecord =
          await (select(db.dbAuthors)
                ..where(
                  (a) =>
                      a.name.equals(author.name) & a.pseud.equals(author.pseud),
                )
                ..limit(1))
              .getSingleOrNull();

      if (authorRecord != null) {
        // Link work to author
        await into(db.dbWorkAuthors).insertOnConflictUpdate(
          DbWorkAuthorsCompanion(
            workId: Value(work.id),
            authorId: Value(authorRecord.id),
          ),
        );
      }
    }
  }

  Future<void> _insertWorkTags(
    int workId,
    List<Tag> tagList,
    String type,
  ) async {
    dynamic dbTags = db.dbTags;
    dynamic dbWorkFandoms = db.dbWorkFandoms;
    dynamic dbWorkRelationships = db.dbWorkRelationships;
    dynamic dbWorkCharacters = db.dbWorkCharacters;
    dynamic dbWorkTags = db.dbWorkTags;

    for (final tag in tagList) {
      // Insert the tag
      await into(dbTags).insertOnConflictUpdate(
        DbTagsCompanion(
          name: Value(tag.name),
          localizedName: Value(tag.localizedName),
          count: Value(tag.count),
          canonical: Value(tag.canonical),
          type: Value(tag.type.name),
        ),
      );

      // Link to work based on type
      switch (type) {
        case 'fandoms':
          await into(dbWorkFandoms).insertOnConflictUpdate(
            DbWorkFandomsCompanion(
              workId: Value(workId),
              tagName: Value(tag.name),
            ),
          );
          break;
        case 'relationships':
          await into(dbWorkRelationships).insertOnConflictUpdate(
            DbWorkRelationshipsCompanion(
              workId: Value(workId),
              tagName: Value(tag.name),
            ),
          );
          break;
        case 'characters':
          await into(dbWorkCharacters).insertOnConflictUpdate(
            DbWorkCharactersCompanion(
              workId: Value(workId),
              tagName: Value(tag.name),
            ),
          );
          break;
        case 'tags':
          await into(dbWorkTags).insertOnConflictUpdate(
            DbWorkTagsCompanion(
              workId: Value(workId),
              tagName: Value(tag.name),
            ),
          );
          break;
      }
    }
  }
}
