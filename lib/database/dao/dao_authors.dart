import 'package:archiverse/database/database.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:drift/drift.dart';
import 'dao_base.dart';

@DriftAccessor(tables: [DbAuthors, DbWorkAuthors])
class AuthorsDao extends BaseDao<DbAuthors, DbAuthor, Pseud> {
  AuthorsDao(super.db);

  @override
  TableInfo<DbAuthors, DbAuthor> get table => db.dbAuthors;

  @override
  Insertable<DbAuthor> toCompanion(Pseud pseud) {
    return DbAuthorsCompanion(
      name: Value(pseud.name),
      pseud: Value(pseud.pseud),
      imageUrl: Value(pseud.imageUrl),
      bio: Value(pseud.bio),
      joinDate: Value(pseud.joinDate),
      works: Value(pseud.works),
      series: Value(pseud.series),
      bookmarks: Value(pseud.bookmarks),
      collections: Value(pseud.collections),
      gifts: Value(pseud.gifts),
      guest: Value(pseud.guest),
    );
  }

  @override
  Pseud fromRow(DbAuthor row) {
    return Pseud(
      name: row.name,
      pseud: row.pseud,
      imageUrl: row.imageUrl,
      bio: row.bio,
      joinDate: row.joinDate,
      works: row.works,
      series: row.series,
      bookmarks: row.bookmarks,
      collections: row.collections,
      gifts: row.gifts,
      guest: row.guest,
    );
  }

  // Get author by ID
  Future<Pseud?> getAuthorById(int authorId) async {
    final author = await getSingle((a) => a.id.equals(authorId));
    return author != null ? fromRow(author) : null;
  }

  // Get author by name and pseud
  Future<Pseud?> getAuthorByNameAndPseud(String name, String pseud) async {
    final author = await getSingleOrNull(
      (a) => a.name.equals(name) & a.pseud.equals(pseud),
    );
    return author != null ? fromRow(author) : null;
  }

  // Search authors by name or pseud
  Future<List<Pseud>> searchAuthors(String query, {int limit = 50}) async {
    final authors =
        await (select(table)
              ..where((a) => a.name.contains(query) | a.pseud.contains(query))
              ..orderBy([(a) => OrderingTerm.desc(a.works)])
              ..limit(limit))
            .get();

    return authors.map((a) => fromRow(a)).toList();
  }

  // Get popular authors (by work count)
  Future<List<Pseud>> getPopularAuthors({int limit = 50}) async {
    final authors =
        await (select(table)
              ..orderBy([(a) => OrderingTerm.desc(a.works)])
              ..limit(limit))
            .get();

    return authors.map((a) => fromRow(a)).toList();
  }

  // Get authors for a specific work
  Future<List<Pseud>> getWorkAuthors(int workId) async {
    final query = select(table).join([
      innerJoin(
        db.dbWorkAuthors,
        db.dbWorkAuthors.authorId.equalsExp(table.asDslTable.id),
      ),
    ])..where(db.dbWorkAuthors.workId.equals(workId));

    final results = await query.get();
    return results.map((row) => fromRow(row.readTable(table))).toList();
  }

  // Link author to work
  Future<void> linkAuthorToWork(int workId, int authorId) async {
    await into(db.dbWorkAuthors).insertOnConflictUpdate(
      DbWorkAuthorsCompanion(workId: Value(workId), authorId: Value(authorId)),
    );
  }

  // Remove author from work
  Future<void> unlinkAuthorFromWork(int workId, int authorId) async {
    await (delete(db.dbWorkAuthors)..where(
          (wa) => wa.workId.equals(workId) & wa.authorId.equals(authorId),
        ))
        .go();
  }

  // Insert author and return the ID
  Future<int> insertAuthorAndGetId(Pseud pseud) async {
    return await into(table).insert(toCompanion(pseud));
  }

  // Insert or update author and return the ID
  Future<int> insertOrUpdateAuthorAndGetId(Pseud pseud) async {
    final authorRecord = await getSingleOrNull(
      (a) => a.name.equals(pseud.name) & a.pseud.equals(pseud.pseud),
    );

    if (authorRecord != null) {
      // Update existing author
      await updateWhere(pseud, (a) => a.id.equals(authorRecord.id));
      return authorRecord.id;
    } else {
      // Insert new author
      return await insertAuthorAndGetId(pseud);
    }
  }

  // Bulk insert/update authors with work association
  Future<void> insertOrUpdateWorkAuthors(
    int workId,
    List<Pseud> authors,
  ) async {
    await transaction(() async {
      for (final author in authors) {
        // Insert/update author and get ID
        final authorId = await insertOrUpdateAuthorAndGetId(author);

        // Link to work
        await linkAuthorToWork(workId, authorId);
      }
    });
  }

  // Remove all authors from a work
  Future<void> removeAllWorkAuthors(int workId) async {
    await (delete(
      db.dbWorkAuthors,
    )..where((wa) => wa.workId.equals(workId))).go();
  }

  // Update author statistics
  Future<void> updateAuthorStats(
    int authorId, {
    int? works,
    int? series,
    int? bookmarks,
    int? collections,
    int? gifts,
  }) async {
    await (update(table)..where((a) => a.id.equals(authorId))).write(
      DbAuthorsCompanion(
        works: works != null ? Value(works) : const Value.absent(),
        series: series != null ? Value(series) : const Value.absent(),
        bookmarks: bookmarks != null ? Value(bookmarks) : const Value.absent(),
        collections: collections != null
            ? Value(collections)
            : const Value.absent(),
        gifts: gifts != null ? Value(gifts) : const Value.absent(),
      ),
    );
  }

  // Get authors by guest status
  Future<List<Pseud>> getAuthorsByGuestStatus(
    bool isGuest, {
    int limit = 50,
  }) async {
    final authors =
        await (select(table)
              ..where((a) => a.guest.equals(isGuest))
              ..orderBy([(a) => OrderingTerm.desc(a.works)])
              ..limit(limit))
            .get();

    return authors.map((a) => fromRow(a)).toList();
  }

  // Get guest authors
  Future<List<Pseud>> getGuestAuthors({int limit = 50}) async {
    return await getAuthorsByGuestStatus(true, limit: limit);
  }

  // Get registered authors
  Future<List<Pseud>> getRegisteredAuthors({int limit = 50}) async {
    return await getAuthorsByGuestStatus(false, limit: limit);
  }

  // Get works count for an author
  Future<int> getWorkCountForAuthor(int authorId) async {
    final count =
        await (selectOnly(db.dbWorkAuthors)
              ..addColumns([db.dbWorkAuthors.workId.count()])
              ..where(db.dbWorkAuthors.authorId.equals(authorId)))
            .getSingle();

    return count.read(db.dbWorkAuthors.workId.count()) ?? 0;
  }

  // Get recently active authors (by latest work update)
  Future<List<Pseud>> getRecentlyActiveAuthors({int limit = 50}) async {
    final query =
        select(table).join([
            innerJoin(
              db.dbWorkAuthors,
              db.dbWorkAuthors.authorId.equalsExp(table.asDslTable.id),
            ),
            innerJoin(
              db.dbWorks,
              db.dbWorks.id.equalsExp(db.dbWorkAuthors.workId),
            ),
          ])
          ..orderBy([OrderingTerm.desc(db.dbWorks.updateDate)])
          ..limit(limit);

    final results = await query.get();
    final seenAuthors = <int>{};
    final uniqueAuthors = <Pseud>[];

    for (final row in results) {
      final author = row.readTable(table);
      if (!seenAuthors.contains(author.id)) {
        seenAuthors.add(author.id);
        uniqueAuthors.add(fromRow(author));
      }
    }

    return uniqueAuthors;
  }

  // Check if author has any works
  Future<bool> authorHasWorks(int authorId) async {
    return await exists((a) => a.id.equals(authorId));
  }

  // Get author statistics
  Future<Map<String, int>> getAuthorStatistics() async {
    final totalAuthors = await getCount();
    final guestAuthors = await getCount((a) => a.guest.equals(true));
    final registeredAuthors = await getCount((a) => a.guest.equals(false));

    return {
      'total': totalAuthors,
      'guest': guestAuthors,
      'registered': registeredAuthors,
    };
  }
}
