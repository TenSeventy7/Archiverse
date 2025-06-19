import 'dart:convert';
import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/tag.dart';
import 'package:drift/drift.dart';

extension WorksDao on AppDatabase {
  // Insert a Work with all related data
  Future<void> insertWorkComplete(Work work) async {
    await transaction(() async {
      // Insert the work
      await into(worksTable).insertOnConflictUpdate(
        WorksTableCompanion(
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
          warnings: Value(
            jsonEncode(work.warnings.map((w) => w.name).toList()),
          ),
          publishDate: Value(work.publishDate),
          completedDate: Value(work.completedDate),
          notes: Value(work.notes),
          giftMessage: Value(work.giftMessage),
          subscriptions: Value(work.subscriptions),
        ),
      );

      // Insert authors and relationships
      await _insertWorkAuthors(work);

      // Insert tags and relationships
      await _insertWorkTags(work.id, work.fandoms, 'fandoms');
      await _insertWorkTags(work.id, work.relationships, 'relationships');
      await _insertWorkTags(work.id, work.characters, 'characters');
      await _insertWorkTags(work.id, work.tags, 'tags');
    });
  }

  // Insert or update a Work with all related data
  Future<void> insertOrUpdateWorkComplete(Work work) async {
    final exists = await workExists(work.id);

    if (exists) {
      // Update existing work
      await updateWorkComplete(work);
    } else {
      // Insert new work
      await insertWorkComplete(work);
    }
  }

  // Update existing work completely
  Future<void> updateWorkComplete(Work work) async {
    await transaction(() async {
      // Update the work
      await (update(worksTable)..where((w) => w.id.equals(work.id))).write(
        WorksTableCompanion(
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
          warnings: Value(
            jsonEncode(work.warnings.map((w) => w.name).toList()),
          ),
          publishDate: Value(work.publishDate),
          completedDate: Value(work.completedDate),
          notes: Value(work.notes),
          giftMessage: Value(work.giftMessage),
          subscriptions: Value(work.subscriptions),
        ),
      );

      // Delete existing relationships
      await (delete(
        workAuthorsTable,
      )..where((wa) => wa.workId.equals(work.id))).go();
      await (delete(
        workFandomsTable,
      )..where((wf) => wf.workId.equals(work.id))).go();
      await (delete(
        workRelationshipsTable,
      )..where((wr) => wr.workId.equals(work.id))).go();
      await (delete(
        workCharactersTable,
      )..where((wc) => wc.workId.equals(work.id))).go();
      await (delete(
        workTagsTable,
      )..where((wt) => wt.workId.equals(work.id))).go();

      // Re-insert relationships
      await _insertWorkAuthors(work);
      await _insertWorkTags(work.id, work.fandoms, 'fandoms');
      await _insertWorkTags(work.id, work.relationships, 'relationships');
      await _insertWorkTags(work.id, work.characters, 'characters');
      await _insertWorkTags(work.id, work.tags, 'tags');
    });
  }

  Future<void> _insertWorkAuthors(Work work) async {
    for (final author in work.authors) {
      // Insert or update the author
      await into(authorsTable).insertOnConflictUpdate(
        AuthorsTableCompanion(
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

      // Get the author record - use getSingleOrNull and handle potential duplicates
      final authorRecord =
          await (select(authorsTable)
                ..where(
                  (a) =>
                      a.name.equals(author.name) & a.pseud.equals(author.pseud),
                )
                ..limit(1))
              .getSingleOrNull();

      if (authorRecord != null) {
        // Link work to author - only insert if the relationship doesn't already exist
        await into(workAuthorsTable).insertOnConflictUpdate(
          WorkAuthorsTableCompanion(
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
    for (final tag in tagList) {
      // Insert the tag (will be ignored if it already exists due to primary key)
      await into(tagsTable).insertOnConflictUpdate(
        TagsTableCompanion(
          name: Value(tag.name),
          localizedName: Value(tag.localizedName),
          count: Value(tag.count),
          canonical: Value(tag.canonical),
          type: Value(tag.type.name),
        ),
      );

      // Link work to tag using tag name directly
      switch (type) {
        case 'fandoms':
          await into(workFandomsTable).insertOnConflictUpdate(
            WorkFandomsTableCompanion(
              workId: Value(workId),
              tagName: Value(tag.name), // Use tag name instead of ID
            ),
          );
          break;
        case 'relationships':
          await into(workRelationshipsTable).insertOnConflictUpdate(
            WorkRelationshipsTableCompanion(
              workId: Value(workId),
              tagName: Value(tag.name), // Use tag name instead of ID
            ),
          );
          break;
        case 'characters':
          await into(workCharactersTable).insertOnConflictUpdate(
            WorkCharactersTableCompanion(
              workId: Value(workId),
              tagName: Value(tag.name), // Use tag name instead of ID
            ),
          );
          break;
        case 'tags':
          await into(workTagsTable).insertOnConflictUpdate(
            WorkTagsTableCompanion(
              workId: Value(workId),
              tagName: Value(tag.name), // Use tag name instead of ID
            ),
          );
          break;
      }
    }
  }

  Future<Work?> getWorkComplete(int workId) async {
    final workData = await (select(
      worksTable,
    )..where((w) => w.id.equals(workId))).getSingleOrNull();
    if (workData == null) return null;

    // Get authors using the renamed tables
    final authorsQuery = select(authorsTable).join([
      innerJoin(
        workAuthorsTable,
        workAuthorsTable.authorId.equalsExp(authorsTable.id),
      ),
    ])..where(workAuthorsTable.workId.equals(workId));

    final authorRecords = await authorsQuery.get();
    final workAuthors = authorRecords.map((row) {
      final author = row.readTable(authorsTable);
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

  Future<List<Tag>> _getWorkTags(int workId, String type) async {
    late JoinedSelectStatement query;

    switch (type) {
      case 'fandoms':
        query = select(tagsTable).join([
          innerJoin(
            workFandomsTable,
            workFandomsTable.tagName.equalsExp(tagsTable.name),
          ),
        ])..where(workFandomsTable.workId.equals(workId));
        break;
      case 'relationships':
        query = select(tagsTable).join([
          innerJoin(
            workRelationshipsTable,
            workRelationshipsTable.tagName.equalsExp(tagsTable.name),
          ),
        ])..where(workRelationshipsTable.workId.equals(workId));
        break;
      case 'characters':
        query = select(tagsTable).join([
          innerJoin(
            workCharactersTable,
            workCharactersTable.tagName.equalsExp(tagsTable.name),
          ),
        ])..where(workCharactersTable.workId.equals(workId));
        break;
      case 'tags':
        query = select(tagsTable).join([
          innerJoin(
            workTagsTable,
            workTagsTable.tagName.equalsExp(tagsTable.name),
          ),
        ])..where(workTagsTable.workId.equals(workId));
        break;
    }

    final tagRecords = await query.get();
    return tagRecords.map((row) {
      final tag = row.readTable(tagsTable);
      return Tag(
        name: tag.name,
        localizedName: tag.localizedName,
        count: tag.count,
        canonical: tag.canonical,
        type: TagType.values.firstWhere((t) => t.name == tag.type),
      );
    }).toList();
  }

  // Search works
  Future<List<Work>> searchWorks(String query) async {
    final workRecords = await (select(
      worksTable,
    )..where((w) => w.title.contains(query) | w.summary.contains(query))).get();

    final works = <Work>[];
    for (final record in workRecords) {
      final work = await getWorkComplete(record.id);
      if (work != null) {
        works.add(work);
      }
    }

    return works;
  }

  // Get all works
  Future<List<Work>> getAllWorks() async {
    final workRecords = await select(worksTable).get();
    final works = <Work>[];

    for (final record in workRecords) {
      final work = await getWorkComplete(record.id);
      if (work != null) {
        works.add(work);
      }
    }

    return works;
  }

  // Get works by author
  Future<List<Work>> getWorksByAuthor(String authorName, String pseud) async {
    final authorQuery = select(authorsTable)
      ..where((a) => a.name.equals(authorName) & a.pseud.equals(pseud));

    final author = await authorQuery.getSingleOrNull();
    if (author == null) return [];

    final workIds =
        await (select(workAuthorsTable)
              ..where((wa) => wa.authorId.equals(author.id)))
            .map((wa) => wa.workId)
            .get();

    final works = <Work>[];
    for (final workId in workIds) {
      final work = await getWorkComplete(workId);
      if (work != null) {
        works.add(work);
      }
    }

    return works;
  }

  // Delete work and all related data
  Future<void> deleteWork(int workId) async {
    await transaction(() async {
      // Delete from relationship tables first (foreign key constraints)
      await (delete(
        workAuthorsTable,
      )..where((wa) => wa.workId.equals(workId))).go();
      await (delete(
        workFandomsTable,
      )..where((wf) => wf.workId.equals(workId))).go();
      await (delete(
        workRelationshipsTable,
      )..where((wr) => wr.workId.equals(workId))).go();
      await (delete(
        workCharactersTable,
      )..where((wc) => wc.workId.equals(workId))).go();
      await (delete(
        workTagsTable,
      )..where((wt) => wt.workId.equals(workId))).go();
      await (delete(chaptersTable)..where((c) => c.workId.equals(workId))).go();
      await (delete(
        readHistoriesTable,
      )..where((rh) => rh.workId.equals(workId))).go();

      // Finally delete the work itself
      await (delete(worksTable)..where((w) => w.id.equals(workId))).go();
    });
  }

  // Update work (without relationships - useful for updating stats like kudos, comments, etc.)
  Future<void> updateWorkStats(
    int workId, {
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    DateTime? updateDate,
  }) async {
    await (update(worksTable)..where((w) => w.id.equals(workId))).write(
      WorksTableCompanion(
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

  // Check if work exists
  Future<bool> workExists(int workId) async {
    final count =
        await (selectOnly(worksTable)
              ..addColumns([worksTable.id.count()])
              ..where(worksTable.id.equals(workId)))
            .getSingle();
    return (count.read(worksTable.id.count()) ?? 0) > 0;
  }

  // Get work count
  Future<int> getWorkCount() async {
    final result = await (selectOnly(
      worksTable,
    )..addColumns([worksTable.id.count()])).getSingle();
    return result.read(worksTable.id.count()) ?? 0;
  }

  // Get recent works (by update date)
  Future<List<Work>> getRecentWorks({int limit = 20}) async {
    final workRecords =
        await (select(worksTable)
              ..orderBy([(w) => OrderingTerm.desc(w.updateDate)])
              ..limit(limit))
            .get();

    final works = <Work>[];
    for (final record in workRecords) {
      final work = await getWorkComplete(record.id);
      if (work != null) {
        works.add(work);
      }
    }

    return works;
  }
}
