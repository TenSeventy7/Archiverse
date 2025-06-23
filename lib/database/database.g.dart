// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DbWorksTable extends DbWorks with TableInfo<$DbWorksTable, DbWork> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiresAuthMeta = const VerificationMeta(
    'requiresAuth',
  );
  @override
  late final GeneratedColumn<bool> requiresAuth = GeneratedColumn<bool>(
    'requires_auth',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("requires_auth" IN (0, 1))',
    ),
  );
  static const VerificationMeta _updateDateMeta = const VerificationMeta(
    'updateDate',
  );
  @override
  late final GeneratedColumn<DateTime> updateDate = GeneratedColumn<DateTime>(
    'update_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordsMeta = const VerificationMeta('words');
  @override
  late final GeneratedColumn<int> words = GeneratedColumn<int>(
    'words',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chaptersMeta = const VerificationMeta(
    'chapters',
  );
  @override
  late final GeneratedColumn<int> chapters = GeneratedColumn<int>(
    'chapters',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentsMeta = const VerificationMeta(
    'comments',
  );
  @override
  late final GeneratedColumn<int> comments = GeneratedColumn<int>(
    'comments',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kudosMeta = const VerificationMeta('kudos');
  @override
  late final GeneratedColumn<int> kudos = GeneratedColumn<int>(
    'kudos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookmarksMeta = const VerificationMeta(
    'bookmarks',
  );
  @override
  late final GeneratedColumn<int> bookmarks = GeneratedColumn<int>(
    'bookmarks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hitsMeta = const VerificationMeta('hits');
  @override
  late final GeneratedColumn<int> hits = GeneratedColumn<int>(
    'hits',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalChaptersMeta = const VerificationMeta(
    'totalChapters',
  );
  @override
  late final GeneratedColumn<int> totalChapters = GeneratedColumn<int>(
    'total_chapters',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedMeta = const VerificationMeta(
    'finished',
  );
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
    'finished',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("finished" IN (0, 1))',
    ),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String> rating = GeneratedColumn<String>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationshipMeta = const VerificationMeta(
    'relationship',
  );
  @override
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
    'relationship',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warningsMeta = const VerificationMeta(
    'warnings',
  );
  @override
  late final GeneratedColumn<String> warnings = GeneratedColumn<String>(
    'warnings',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishDateMeta = const VerificationMeta(
    'publishDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
    'publish_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedDateMeta = const VerificationMeta(
    'completedDate',
  );
  @override
  late final GeneratedColumn<DateTime> completedDate =
      GeneratedColumn<DateTime>(
        'completed_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _giftMessageMeta = const VerificationMeta(
    'giftMessage',
  );
  @override
  late final GeneratedColumn<String> giftMessage = GeneratedColumn<String>(
    'gift_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subscriptionsMeta = const VerificationMeta(
    'subscriptions',
  );
  @override
  late final GeneratedColumn<int> subscriptions = GeneratedColumn<int>(
    'subscriptions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    summary,
    requiresAuth,
    updateDate,
    words,
    chapters,
    comments,
    kudos,
    bookmarks,
    hits,
    totalChapters,
    language,
    finished,
    rating,
    relationship,
    warnings,
    publishDate,
    completedDate,
    notes,
    giftMessage,
    subscriptions,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'works';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWork> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('requires_auth')) {
      context.handle(
        _requiresAuthMeta,
        requiresAuth.isAcceptableOrUnknown(
          data['requires_auth']!,
          _requiresAuthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requiresAuthMeta);
    }
    if (data.containsKey('update_date')) {
      context.handle(
        _updateDateMeta,
        updateDate.isAcceptableOrUnknown(data['update_date']!, _updateDateMeta),
      );
    } else if (isInserting) {
      context.missing(_updateDateMeta);
    }
    if (data.containsKey('words')) {
      context.handle(
        _wordsMeta,
        words.isAcceptableOrUnknown(data['words']!, _wordsMeta),
      );
    } else if (isInserting) {
      context.missing(_wordsMeta);
    }
    if (data.containsKey('chapters')) {
      context.handle(
        _chaptersMeta,
        chapters.isAcceptableOrUnknown(data['chapters']!, _chaptersMeta),
      );
    } else if (isInserting) {
      context.missing(_chaptersMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(
        _commentsMeta,
        comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta),
      );
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    if (data.containsKey('kudos')) {
      context.handle(
        _kudosMeta,
        kudos.isAcceptableOrUnknown(data['kudos']!, _kudosMeta),
      );
    } else if (isInserting) {
      context.missing(_kudosMeta);
    }
    if (data.containsKey('bookmarks')) {
      context.handle(
        _bookmarksMeta,
        bookmarks.isAcceptableOrUnknown(data['bookmarks']!, _bookmarksMeta),
      );
    } else if (isInserting) {
      context.missing(_bookmarksMeta);
    }
    if (data.containsKey('hits')) {
      context.handle(
        _hitsMeta,
        hits.isAcceptableOrUnknown(data['hits']!, _hitsMeta),
      );
    } else if (isInserting) {
      context.missing(_hitsMeta);
    }
    if (data.containsKey('total_chapters')) {
      context.handle(
        _totalChaptersMeta,
        totalChapters.isAcceptableOrUnknown(
          data['total_chapters']!,
          _totalChaptersMeta,
        ),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('finished')) {
      context.handle(
        _finishedMeta,
        finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
        _relationshipMeta,
        relationship.isAcceptableOrUnknown(
          data['relationship']!,
          _relationshipMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('warnings')) {
      context.handle(
        _warningsMeta,
        warnings.isAcceptableOrUnknown(data['warnings']!, _warningsMeta),
      );
    } else if (isInserting) {
      context.missing(_warningsMeta);
    }
    if (data.containsKey('publish_date')) {
      context.handle(
        _publishDateMeta,
        publishDate.isAcceptableOrUnknown(
          data['publish_date']!,
          _publishDateMeta,
        ),
      );
    }
    if (data.containsKey('completed_date')) {
      context.handle(
        _completedDateMeta,
        completedDate.isAcceptableOrUnknown(
          data['completed_date']!,
          _completedDateMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('gift_message')) {
      context.handle(
        _giftMessageMeta,
        giftMessage.isAcceptableOrUnknown(
          data['gift_message']!,
          _giftMessageMeta,
        ),
      );
    }
    if (data.containsKey('subscriptions')) {
      context.handle(
        _subscriptionsMeta,
        subscriptions.isAcceptableOrUnknown(
          data['subscriptions']!,
          _subscriptionsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWork map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWork(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      requiresAuth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}requires_auth'],
      )!,
      updateDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}update_date'],
      )!,
      words: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}words'],
      )!,
      chapters: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapters'],
      )!,
      comments: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}comments'],
      )!,
      kudos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kudos'],
      )!,
      bookmarks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bookmarks'],
      )!,
      hits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hits'],
      )!,
      totalChapters: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_chapters'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      finished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}finished'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rating'],
      )!,
      relationship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship'],
      )!,
      warnings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warnings'],
      )!,
      publishDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publish_date'],
      ),
      completedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      giftMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gift_message'],
      ),
      subscriptions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscriptions'],
      )!,
    );
  }

  @override
  $DbWorksTable createAlias(String alias) {
    return $DbWorksTable(attachedDatabase, alias);
  }
}

class DbWork extends DataClass implements Insertable<DbWork> {
  final int id;
  final String title;
  final String summary;
  final bool requiresAuth;
  final DateTime updateDate;
  final int words;
  final int chapters;
  final int comments;
  final int kudos;
  final int bookmarks;
  final int hits;
  final int? totalChapters;
  final String language;
  final bool? finished;
  final String rating;
  final String relationship;
  final String warnings;
  final DateTime? publishDate;
  final DateTime? completedDate;
  final String? notes;
  final String? giftMessage;
  final int subscriptions;
  const DbWork({
    required this.id,
    required this.title,
    required this.summary,
    required this.requiresAuth,
    required this.updateDate,
    required this.words,
    required this.chapters,
    required this.comments,
    required this.kudos,
    required this.bookmarks,
    required this.hits,
    this.totalChapters,
    required this.language,
    this.finished,
    required this.rating,
    required this.relationship,
    required this.warnings,
    this.publishDate,
    this.completedDate,
    this.notes,
    this.giftMessage,
    required this.subscriptions,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['requires_auth'] = Variable<bool>(requiresAuth);
    map['update_date'] = Variable<DateTime>(updateDate);
    map['words'] = Variable<int>(words);
    map['chapters'] = Variable<int>(chapters);
    map['comments'] = Variable<int>(comments);
    map['kudos'] = Variable<int>(kudos);
    map['bookmarks'] = Variable<int>(bookmarks);
    map['hits'] = Variable<int>(hits);
    if (!nullToAbsent || totalChapters != null) {
      map['total_chapters'] = Variable<int>(totalChapters);
    }
    map['language'] = Variable<String>(language);
    if (!nullToAbsent || finished != null) {
      map['finished'] = Variable<bool>(finished);
    }
    map['rating'] = Variable<String>(rating);
    map['relationship'] = Variable<String>(relationship);
    map['warnings'] = Variable<String>(warnings);
    if (!nullToAbsent || publishDate != null) {
      map['publish_date'] = Variable<DateTime>(publishDate);
    }
    if (!nullToAbsent || completedDate != null) {
      map['completed_date'] = Variable<DateTime>(completedDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || giftMessage != null) {
      map['gift_message'] = Variable<String>(giftMessage);
    }
    map['subscriptions'] = Variable<int>(subscriptions);
    return map;
  }

  DbWorksCompanion toCompanion(bool nullToAbsent) {
    return DbWorksCompanion(
      id: Value(id),
      title: Value(title),
      summary: Value(summary),
      requiresAuth: Value(requiresAuth),
      updateDate: Value(updateDate),
      words: Value(words),
      chapters: Value(chapters),
      comments: Value(comments),
      kudos: Value(kudos),
      bookmarks: Value(bookmarks),
      hits: Value(hits),
      totalChapters: totalChapters == null && nullToAbsent
          ? const Value.absent()
          : Value(totalChapters),
      language: Value(language),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
      rating: Value(rating),
      relationship: Value(relationship),
      warnings: Value(warnings),
      publishDate: publishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishDate),
      completedDate: completedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(completedDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      giftMessage: giftMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(giftMessage),
      subscriptions: Value(subscriptions),
    );
  }

  factory DbWork.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWork(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      requiresAuth: serializer.fromJson<bool>(json['requiresAuth']),
      updateDate: serializer.fromJson<DateTime>(json['updateDate']),
      words: serializer.fromJson<int>(json['words']),
      chapters: serializer.fromJson<int>(json['chapters']),
      comments: serializer.fromJson<int>(json['comments']),
      kudos: serializer.fromJson<int>(json['kudos']),
      bookmarks: serializer.fromJson<int>(json['bookmarks']),
      hits: serializer.fromJson<int>(json['hits']),
      totalChapters: serializer.fromJson<int?>(json['totalChapters']),
      language: serializer.fromJson<String>(json['language']),
      finished: serializer.fromJson<bool?>(json['finished']),
      rating: serializer.fromJson<String>(json['rating']),
      relationship: serializer.fromJson<String>(json['relationship']),
      warnings: serializer.fromJson<String>(json['warnings']),
      publishDate: serializer.fromJson<DateTime?>(json['publishDate']),
      completedDate: serializer.fromJson<DateTime?>(json['completedDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      giftMessage: serializer.fromJson<String?>(json['giftMessage']),
      subscriptions: serializer.fromJson<int>(json['subscriptions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'requiresAuth': serializer.toJson<bool>(requiresAuth),
      'updateDate': serializer.toJson<DateTime>(updateDate),
      'words': serializer.toJson<int>(words),
      'chapters': serializer.toJson<int>(chapters),
      'comments': serializer.toJson<int>(comments),
      'kudos': serializer.toJson<int>(kudos),
      'bookmarks': serializer.toJson<int>(bookmarks),
      'hits': serializer.toJson<int>(hits),
      'totalChapters': serializer.toJson<int?>(totalChapters),
      'language': serializer.toJson<String>(language),
      'finished': serializer.toJson<bool?>(finished),
      'rating': serializer.toJson<String>(rating),
      'relationship': serializer.toJson<String>(relationship),
      'warnings': serializer.toJson<String>(warnings),
      'publishDate': serializer.toJson<DateTime?>(publishDate),
      'completedDate': serializer.toJson<DateTime?>(completedDate),
      'notes': serializer.toJson<String?>(notes),
      'giftMessage': serializer.toJson<String?>(giftMessage),
      'subscriptions': serializer.toJson<int>(subscriptions),
    };
  }

  DbWork copyWith({
    int? id,
    String? title,
    String? summary,
    bool? requiresAuth,
    DateTime? updateDate,
    int? words,
    int? chapters,
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    Value<int?> totalChapters = const Value.absent(),
    String? language,
    Value<bool?> finished = const Value.absent(),
    String? rating,
    String? relationship,
    String? warnings,
    Value<DateTime?> publishDate = const Value.absent(),
    Value<DateTime?> completedDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> giftMessage = const Value.absent(),
    int? subscriptions,
  }) => DbWork(
    id: id ?? this.id,
    title: title ?? this.title,
    summary: summary ?? this.summary,
    requiresAuth: requiresAuth ?? this.requiresAuth,
    updateDate: updateDate ?? this.updateDate,
    words: words ?? this.words,
    chapters: chapters ?? this.chapters,
    comments: comments ?? this.comments,
    kudos: kudos ?? this.kudos,
    bookmarks: bookmarks ?? this.bookmarks,
    hits: hits ?? this.hits,
    totalChapters: totalChapters.present
        ? totalChapters.value
        : this.totalChapters,
    language: language ?? this.language,
    finished: finished.present ? finished.value : this.finished,
    rating: rating ?? this.rating,
    relationship: relationship ?? this.relationship,
    warnings: warnings ?? this.warnings,
    publishDate: publishDate.present ? publishDate.value : this.publishDate,
    completedDate: completedDate.present
        ? completedDate.value
        : this.completedDate,
    notes: notes.present ? notes.value : this.notes,
    giftMessage: giftMessage.present ? giftMessage.value : this.giftMessage,
    subscriptions: subscriptions ?? this.subscriptions,
  );
  DbWork copyWithCompanion(DbWorksCompanion data) {
    return DbWork(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      requiresAuth: data.requiresAuth.present
          ? data.requiresAuth.value
          : this.requiresAuth,
      updateDate: data.updateDate.present
          ? data.updateDate.value
          : this.updateDate,
      words: data.words.present ? data.words.value : this.words,
      chapters: data.chapters.present ? data.chapters.value : this.chapters,
      comments: data.comments.present ? data.comments.value : this.comments,
      kudos: data.kudos.present ? data.kudos.value : this.kudos,
      bookmarks: data.bookmarks.present ? data.bookmarks.value : this.bookmarks,
      hits: data.hits.present ? data.hits.value : this.hits,
      totalChapters: data.totalChapters.present
          ? data.totalChapters.value
          : this.totalChapters,
      language: data.language.present ? data.language.value : this.language,
      finished: data.finished.present ? data.finished.value : this.finished,
      rating: data.rating.present ? data.rating.value : this.rating,
      relationship: data.relationship.present
          ? data.relationship.value
          : this.relationship,
      warnings: data.warnings.present ? data.warnings.value : this.warnings,
      publishDate: data.publishDate.present
          ? data.publishDate.value
          : this.publishDate,
      completedDate: data.completedDate.present
          ? data.completedDate.value
          : this.completedDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      giftMessage: data.giftMessage.present
          ? data.giftMessage.value
          : this.giftMessage,
      subscriptions: data.subscriptions.present
          ? data.subscriptions.value
          : this.subscriptions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWork(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('updateDate: $updateDate, ')
          ..write('words: $words, ')
          ..write('chapters: $chapters, ')
          ..write('comments: $comments, ')
          ..write('kudos: $kudos, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('hits: $hits, ')
          ..write('totalChapters: $totalChapters, ')
          ..write('language: $language, ')
          ..write('finished: $finished, ')
          ..write('rating: $rating, ')
          ..write('relationship: $relationship, ')
          ..write('warnings: $warnings, ')
          ..write('publishDate: $publishDate, ')
          ..write('completedDate: $completedDate, ')
          ..write('notes: $notes, ')
          ..write('giftMessage: $giftMessage, ')
          ..write('subscriptions: $subscriptions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    summary,
    requiresAuth,
    updateDate,
    words,
    chapters,
    comments,
    kudos,
    bookmarks,
    hits,
    totalChapters,
    language,
    finished,
    rating,
    relationship,
    warnings,
    publishDate,
    completedDate,
    notes,
    giftMessage,
    subscriptions,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWork &&
          other.id == this.id &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.requiresAuth == this.requiresAuth &&
          other.updateDate == this.updateDate &&
          other.words == this.words &&
          other.chapters == this.chapters &&
          other.comments == this.comments &&
          other.kudos == this.kudos &&
          other.bookmarks == this.bookmarks &&
          other.hits == this.hits &&
          other.totalChapters == this.totalChapters &&
          other.language == this.language &&
          other.finished == this.finished &&
          other.rating == this.rating &&
          other.relationship == this.relationship &&
          other.warnings == this.warnings &&
          other.publishDate == this.publishDate &&
          other.completedDate == this.completedDate &&
          other.notes == this.notes &&
          other.giftMessage == this.giftMessage &&
          other.subscriptions == this.subscriptions);
}

class DbWorksCompanion extends UpdateCompanion<DbWork> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> summary;
  final Value<bool> requiresAuth;
  final Value<DateTime> updateDate;
  final Value<int> words;
  final Value<int> chapters;
  final Value<int> comments;
  final Value<int> kudos;
  final Value<int> bookmarks;
  final Value<int> hits;
  final Value<int?> totalChapters;
  final Value<String> language;
  final Value<bool?> finished;
  final Value<String> rating;
  final Value<String> relationship;
  final Value<String> warnings;
  final Value<DateTime?> publishDate;
  final Value<DateTime?> completedDate;
  final Value<String?> notes;
  final Value<String?> giftMessage;
  final Value<int> subscriptions;
  const DbWorksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.requiresAuth = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.words = const Value.absent(),
    this.chapters = const Value.absent(),
    this.comments = const Value.absent(),
    this.kudos = const Value.absent(),
    this.bookmarks = const Value.absent(),
    this.hits = const Value.absent(),
    this.totalChapters = const Value.absent(),
    this.language = const Value.absent(),
    this.finished = const Value.absent(),
    this.rating = const Value.absent(),
    this.relationship = const Value.absent(),
    this.warnings = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.giftMessage = const Value.absent(),
    this.subscriptions = const Value.absent(),
  });
  DbWorksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String summary,
    required bool requiresAuth,
    required DateTime updateDate,
    required int words,
    required int chapters,
    required int comments,
    required int kudos,
    required int bookmarks,
    required int hits,
    this.totalChapters = const Value.absent(),
    required String language,
    this.finished = const Value.absent(),
    required String rating,
    required String relationship,
    required String warnings,
    this.publishDate = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.giftMessage = const Value.absent(),
    this.subscriptions = const Value.absent(),
  }) : title = Value(title),
       summary = Value(summary),
       requiresAuth = Value(requiresAuth),
       updateDate = Value(updateDate),
       words = Value(words),
       chapters = Value(chapters),
       comments = Value(comments),
       kudos = Value(kudos),
       bookmarks = Value(bookmarks),
       hits = Value(hits),
       language = Value(language),
       rating = Value(rating),
       relationship = Value(relationship),
       warnings = Value(warnings);
  static Insertable<DbWork> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<bool>? requiresAuth,
    Expression<DateTime>? updateDate,
    Expression<int>? words,
    Expression<int>? chapters,
    Expression<int>? comments,
    Expression<int>? kudos,
    Expression<int>? bookmarks,
    Expression<int>? hits,
    Expression<int>? totalChapters,
    Expression<String>? language,
    Expression<bool>? finished,
    Expression<String>? rating,
    Expression<String>? relationship,
    Expression<String>? warnings,
    Expression<DateTime>? publishDate,
    Expression<DateTime>? completedDate,
    Expression<String>? notes,
    Expression<String>? giftMessage,
    Expression<int>? subscriptions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (requiresAuth != null) 'requires_auth': requiresAuth,
      if (updateDate != null) 'update_date': updateDate,
      if (words != null) 'words': words,
      if (chapters != null) 'chapters': chapters,
      if (comments != null) 'comments': comments,
      if (kudos != null) 'kudos': kudos,
      if (bookmarks != null) 'bookmarks': bookmarks,
      if (hits != null) 'hits': hits,
      if (totalChapters != null) 'total_chapters': totalChapters,
      if (language != null) 'language': language,
      if (finished != null) 'finished': finished,
      if (rating != null) 'rating': rating,
      if (relationship != null) 'relationship': relationship,
      if (warnings != null) 'warnings': warnings,
      if (publishDate != null) 'publish_date': publishDate,
      if (completedDate != null) 'completed_date': completedDate,
      if (notes != null) 'notes': notes,
      if (giftMessage != null) 'gift_message': giftMessage,
      if (subscriptions != null) 'subscriptions': subscriptions,
    });
  }

  DbWorksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? summary,
    Value<bool>? requiresAuth,
    Value<DateTime>? updateDate,
    Value<int>? words,
    Value<int>? chapters,
    Value<int>? comments,
    Value<int>? kudos,
    Value<int>? bookmarks,
    Value<int>? hits,
    Value<int?>? totalChapters,
    Value<String>? language,
    Value<bool?>? finished,
    Value<String>? rating,
    Value<String>? relationship,
    Value<String>? warnings,
    Value<DateTime?>? publishDate,
    Value<DateTime?>? completedDate,
    Value<String?>? notes,
    Value<String?>? giftMessage,
    Value<int>? subscriptions,
  }) {
    return DbWorksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      updateDate: updateDate ?? this.updateDate,
      words: words ?? this.words,
      chapters: chapters ?? this.chapters,
      comments: comments ?? this.comments,
      kudos: kudos ?? this.kudos,
      bookmarks: bookmarks ?? this.bookmarks,
      hits: hits ?? this.hits,
      totalChapters: totalChapters ?? this.totalChapters,
      language: language ?? this.language,
      finished: finished ?? this.finished,
      rating: rating ?? this.rating,
      relationship: relationship ?? this.relationship,
      warnings: warnings ?? this.warnings,
      publishDate: publishDate ?? this.publishDate,
      completedDate: completedDate ?? this.completedDate,
      notes: notes ?? this.notes,
      giftMessage: giftMessage ?? this.giftMessage,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (requiresAuth.present) {
      map['requires_auth'] = Variable<bool>(requiresAuth.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<DateTime>(updateDate.value);
    }
    if (words.present) {
      map['words'] = Variable<int>(words.value);
    }
    if (chapters.present) {
      map['chapters'] = Variable<int>(chapters.value);
    }
    if (comments.present) {
      map['comments'] = Variable<int>(comments.value);
    }
    if (kudos.present) {
      map['kudos'] = Variable<int>(kudos.value);
    }
    if (bookmarks.present) {
      map['bookmarks'] = Variable<int>(bookmarks.value);
    }
    if (hits.present) {
      map['hits'] = Variable<int>(hits.value);
    }
    if (totalChapters.present) {
      map['total_chapters'] = Variable<int>(totalChapters.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (warnings.present) {
      map['warnings'] = Variable<String>(warnings.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (completedDate.present) {
      map['completed_date'] = Variable<DateTime>(completedDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (giftMessage.present) {
      map['gift_message'] = Variable<String>(giftMessage.value);
    }
    if (subscriptions.present) {
      map['subscriptions'] = Variable<int>(subscriptions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('updateDate: $updateDate, ')
          ..write('words: $words, ')
          ..write('chapters: $chapters, ')
          ..write('comments: $comments, ')
          ..write('kudos: $kudos, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('hits: $hits, ')
          ..write('totalChapters: $totalChapters, ')
          ..write('language: $language, ')
          ..write('finished: $finished, ')
          ..write('rating: $rating, ')
          ..write('relationship: $relationship, ')
          ..write('warnings: $warnings, ')
          ..write('publishDate: $publishDate, ')
          ..write('completedDate: $completedDate, ')
          ..write('notes: $notes, ')
          ..write('giftMessage: $giftMessage, ')
          ..write('subscriptions: $subscriptions')
          ..write(')'))
        .toString();
  }
}

class $DbAuthorsTable extends DbAuthors
    with TableInfo<$DbAuthorsTable, DbAuthor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbAuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pseudMeta = const VerificationMeta('pseud');
  @override
  late final GeneratedColumn<String> pseud = GeneratedColumn<String>(
    'pseud',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _joinDateMeta = const VerificationMeta(
    'joinDate',
  );
  @override
  late final GeneratedColumn<DateTime> joinDate = GeneratedColumn<DateTime>(
    'join_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _worksMeta = const VerificationMeta('works');
  @override
  late final GeneratedColumn<int> works = GeneratedColumn<int>(
    'works',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<int> series = GeneratedColumn<int>(
    'series',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookmarksMeta = const VerificationMeta(
    'bookmarks',
  );
  @override
  late final GeneratedColumn<int> bookmarks = GeneratedColumn<int>(
    'bookmarks',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _collectionsMeta = const VerificationMeta(
    'collections',
  );
  @override
  late final GeneratedColumn<int> collections = GeneratedColumn<int>(
    'collections',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _giftsMeta = const VerificationMeta('gifts');
  @override
  late final GeneratedColumn<int> gifts = GeneratedColumn<int>(
    'gifts',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guestMeta = const VerificationMeta('guest');
  @override
  late final GeneratedColumn<bool> guest = GeneratedColumn<bool>(
    'guest',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("guest" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    pseud,
    imageUrl,
    bio,
    joinDate,
    works,
    series,
    bookmarks,
    collections,
    gifts,
    guest,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbAuthor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pseud')) {
      context.handle(
        _pseudMeta,
        pseud.isAcceptableOrUnknown(data['pseud']!, _pseudMeta),
      );
    } else if (isInserting) {
      context.missing(_pseudMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('join_date')) {
      context.handle(
        _joinDateMeta,
        joinDate.isAcceptableOrUnknown(data['join_date']!, _joinDateMeta),
      );
    }
    if (data.containsKey('works')) {
      context.handle(
        _worksMeta,
        works.isAcceptableOrUnknown(data['works']!, _worksMeta),
      );
    }
    if (data.containsKey('series')) {
      context.handle(
        _seriesMeta,
        series.isAcceptableOrUnknown(data['series']!, _seriesMeta),
      );
    }
    if (data.containsKey('bookmarks')) {
      context.handle(
        _bookmarksMeta,
        bookmarks.isAcceptableOrUnknown(data['bookmarks']!, _bookmarksMeta),
      );
    }
    if (data.containsKey('collections')) {
      context.handle(
        _collectionsMeta,
        collections.isAcceptableOrUnknown(
          data['collections']!,
          _collectionsMeta,
        ),
      );
    }
    if (data.containsKey('gifts')) {
      context.handle(
        _giftsMeta,
        gifts.isAcceptableOrUnknown(data['gifts']!, _giftsMeta),
      );
    }
    if (data.containsKey('guest')) {
      context.handle(
        _guestMeta,
        guest.isAcceptableOrUnknown(data['guest']!, _guestMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAuthor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAuthor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      pseud: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pseud'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      joinDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}join_date'],
      ),
      works: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}works'],
      ),
      series: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series'],
      ),
      bookmarks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bookmarks'],
      ),
      collections: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}collections'],
      ),
      gifts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gifts'],
      ),
      guest: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}guest'],
      )!,
    );
  }

  @override
  $DbAuthorsTable createAlias(String alias) {
    return $DbAuthorsTable(attachedDatabase, alias);
  }
}

class DbAuthor extends DataClass implements Insertable<DbAuthor> {
  final int id;
  final String name;
  final String pseud;
  final String? imageUrl;
  final String? bio;
  final DateTime? joinDate;
  final int? works;
  final int? series;
  final int? bookmarks;
  final int? collections;
  final int? gifts;
  final bool guest;
  const DbAuthor({
    required this.id,
    required this.name,
    required this.pseud,
    this.imageUrl,
    this.bio,
    this.joinDate,
    this.works,
    this.series,
    this.bookmarks,
    this.collections,
    this.gifts,
    required this.guest,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['pseud'] = Variable<String>(pseud);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || joinDate != null) {
      map['join_date'] = Variable<DateTime>(joinDate);
    }
    if (!nullToAbsent || works != null) {
      map['works'] = Variable<int>(works);
    }
    if (!nullToAbsent || series != null) {
      map['series'] = Variable<int>(series);
    }
    if (!nullToAbsent || bookmarks != null) {
      map['bookmarks'] = Variable<int>(bookmarks);
    }
    if (!nullToAbsent || collections != null) {
      map['collections'] = Variable<int>(collections);
    }
    if (!nullToAbsent || gifts != null) {
      map['gifts'] = Variable<int>(gifts);
    }
    map['guest'] = Variable<bool>(guest);
    return map;
  }

  DbAuthorsCompanion toCompanion(bool nullToAbsent) {
    return DbAuthorsCompanion(
      id: Value(id),
      name: Value(name),
      pseud: Value(pseud),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      joinDate: joinDate == null && nullToAbsent
          ? const Value.absent()
          : Value(joinDate),
      works: works == null && nullToAbsent
          ? const Value.absent()
          : Value(works),
      series: series == null && nullToAbsent
          ? const Value.absent()
          : Value(series),
      bookmarks: bookmarks == null && nullToAbsent
          ? const Value.absent()
          : Value(bookmarks),
      collections: collections == null && nullToAbsent
          ? const Value.absent()
          : Value(collections),
      gifts: gifts == null && nullToAbsent
          ? const Value.absent()
          : Value(gifts),
      guest: Value(guest),
    );
  }

  factory DbAuthor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAuthor(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pseud: serializer.fromJson<String>(json['pseud']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      bio: serializer.fromJson<String?>(json['bio']),
      joinDate: serializer.fromJson<DateTime?>(json['joinDate']),
      works: serializer.fromJson<int?>(json['works']),
      series: serializer.fromJson<int?>(json['series']),
      bookmarks: serializer.fromJson<int?>(json['bookmarks']),
      collections: serializer.fromJson<int?>(json['collections']),
      gifts: serializer.fromJson<int?>(json['gifts']),
      guest: serializer.fromJson<bool>(json['guest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'pseud': serializer.toJson<String>(pseud),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'bio': serializer.toJson<String?>(bio),
      'joinDate': serializer.toJson<DateTime?>(joinDate),
      'works': serializer.toJson<int?>(works),
      'series': serializer.toJson<int?>(series),
      'bookmarks': serializer.toJson<int?>(bookmarks),
      'collections': serializer.toJson<int?>(collections),
      'gifts': serializer.toJson<int?>(gifts),
      'guest': serializer.toJson<bool>(guest),
    };
  }

  DbAuthor copyWith({
    int? id,
    String? name,
    String? pseud,
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> bio = const Value.absent(),
    Value<DateTime?> joinDate = const Value.absent(),
    Value<int?> works = const Value.absent(),
    Value<int?> series = const Value.absent(),
    Value<int?> bookmarks = const Value.absent(),
    Value<int?> collections = const Value.absent(),
    Value<int?> gifts = const Value.absent(),
    bool? guest,
  }) => DbAuthor(
    id: id ?? this.id,
    name: name ?? this.name,
    pseud: pseud ?? this.pseud,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    bio: bio.present ? bio.value : this.bio,
    joinDate: joinDate.present ? joinDate.value : this.joinDate,
    works: works.present ? works.value : this.works,
    series: series.present ? series.value : this.series,
    bookmarks: bookmarks.present ? bookmarks.value : this.bookmarks,
    collections: collections.present ? collections.value : this.collections,
    gifts: gifts.present ? gifts.value : this.gifts,
    guest: guest ?? this.guest,
  );
  DbAuthor copyWithCompanion(DbAuthorsCompanion data) {
    return DbAuthor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pseud: data.pseud.present ? data.pseud.value : this.pseud,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      bio: data.bio.present ? data.bio.value : this.bio,
      joinDate: data.joinDate.present ? data.joinDate.value : this.joinDate,
      works: data.works.present ? data.works.value : this.works,
      series: data.series.present ? data.series.value : this.series,
      bookmarks: data.bookmarks.present ? data.bookmarks.value : this.bookmarks,
      collections: data.collections.present
          ? data.collections.value
          : this.collections,
      gifts: data.gifts.present ? data.gifts.value : this.gifts,
      guest: data.guest.present ? data.guest.value : this.guest,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAuthor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pseud: $pseud, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('bio: $bio, ')
          ..write('joinDate: $joinDate, ')
          ..write('works: $works, ')
          ..write('series: $series, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('collections: $collections, ')
          ..write('gifts: $gifts, ')
          ..write('guest: $guest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    pseud,
    imageUrl,
    bio,
    joinDate,
    works,
    series,
    bookmarks,
    collections,
    gifts,
    guest,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAuthor &&
          other.id == this.id &&
          other.name == this.name &&
          other.pseud == this.pseud &&
          other.imageUrl == this.imageUrl &&
          other.bio == this.bio &&
          other.joinDate == this.joinDate &&
          other.works == this.works &&
          other.series == this.series &&
          other.bookmarks == this.bookmarks &&
          other.collections == this.collections &&
          other.gifts == this.gifts &&
          other.guest == this.guest);
}

class DbAuthorsCompanion extends UpdateCompanion<DbAuthor> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> pseud;
  final Value<String?> imageUrl;
  final Value<String?> bio;
  final Value<DateTime?> joinDate;
  final Value<int?> works;
  final Value<int?> series;
  final Value<int?> bookmarks;
  final Value<int?> collections;
  final Value<int?> gifts;
  final Value<bool> guest;
  const DbAuthorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pseud = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.bio = const Value.absent(),
    this.joinDate = const Value.absent(),
    this.works = const Value.absent(),
    this.series = const Value.absent(),
    this.bookmarks = const Value.absent(),
    this.collections = const Value.absent(),
    this.gifts = const Value.absent(),
    this.guest = const Value.absent(),
  });
  DbAuthorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String pseud,
    this.imageUrl = const Value.absent(),
    this.bio = const Value.absent(),
    this.joinDate = const Value.absent(),
    this.works = const Value.absent(),
    this.series = const Value.absent(),
    this.bookmarks = const Value.absent(),
    this.collections = const Value.absent(),
    this.gifts = const Value.absent(),
    this.guest = const Value.absent(),
  }) : name = Value(name),
       pseud = Value(pseud);
  static Insertable<DbAuthor> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? pseud,
    Expression<String>? imageUrl,
    Expression<String>? bio,
    Expression<DateTime>? joinDate,
    Expression<int>? works,
    Expression<int>? series,
    Expression<int>? bookmarks,
    Expression<int>? collections,
    Expression<int>? gifts,
    Expression<bool>? guest,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pseud != null) 'pseud': pseud,
      if (imageUrl != null) 'image_url': imageUrl,
      if (bio != null) 'bio': bio,
      if (joinDate != null) 'join_date': joinDate,
      if (works != null) 'works': works,
      if (series != null) 'series': series,
      if (bookmarks != null) 'bookmarks': bookmarks,
      if (collections != null) 'collections': collections,
      if (gifts != null) 'gifts': gifts,
      if (guest != null) 'guest': guest,
    });
  }

  DbAuthorsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? pseud,
    Value<String?>? imageUrl,
    Value<String?>? bio,
    Value<DateTime?>? joinDate,
    Value<int?>? works,
    Value<int?>? series,
    Value<int?>? bookmarks,
    Value<int?>? collections,
    Value<int?>? gifts,
    Value<bool>? guest,
  }) {
    return DbAuthorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pseud: pseud ?? this.pseud,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
      joinDate: joinDate ?? this.joinDate,
      works: works ?? this.works,
      series: series ?? this.series,
      bookmarks: bookmarks ?? this.bookmarks,
      collections: collections ?? this.collections,
      gifts: gifts ?? this.gifts,
      guest: guest ?? this.guest,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pseud.present) {
      map['pseud'] = Variable<String>(pseud.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (joinDate.present) {
      map['join_date'] = Variable<DateTime>(joinDate.value);
    }
    if (works.present) {
      map['works'] = Variable<int>(works.value);
    }
    if (series.present) {
      map['series'] = Variable<int>(series.value);
    }
    if (bookmarks.present) {
      map['bookmarks'] = Variable<int>(bookmarks.value);
    }
    if (collections.present) {
      map['collections'] = Variable<int>(collections.value);
    }
    if (gifts.present) {
      map['gifts'] = Variable<int>(gifts.value);
    }
    if (guest.present) {
      map['guest'] = Variable<bool>(guest.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAuthorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pseud: $pseud, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('bio: $bio, ')
          ..write('joinDate: $joinDate, ')
          ..write('works: $works, ')
          ..write('series: $series, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('collections: $collections, ')
          ..write('gifts: $gifts, ')
          ..write('guest: $guest')
          ..write(')'))
        .toString();
  }
}

class $DbWorkAuthorsTable extends DbWorkAuthors
    with TableInfo<$DbWorkAuthorsTable, DbWorkAuthor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkAuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authors (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [workId, authorId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_authors';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkAuthor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, authorId};
  @override
  DbWorkAuthor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkAuthor(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}author_id'],
      )!,
    );
  }

  @override
  $DbWorkAuthorsTable createAlias(String alias) {
    return $DbWorkAuthorsTable(attachedDatabase, alias);
  }
}

class DbWorkAuthor extends DataClass implements Insertable<DbWorkAuthor> {
  final int workId;
  final int authorId;
  const DbWorkAuthor({required this.workId, required this.authorId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['author_id'] = Variable<int>(authorId);
    return map;
  }

  DbWorkAuthorsCompanion toCompanion(bool nullToAbsent) {
    return DbWorkAuthorsCompanion(
      workId: Value(workId),
      authorId: Value(authorId),
    );
  }

  factory DbWorkAuthor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkAuthor(
      workId: serializer.fromJson<int>(json['workId']),
      authorId: serializer.fromJson<int>(json['authorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'authorId': serializer.toJson<int>(authorId),
    };
  }

  DbWorkAuthor copyWith({int? workId, int? authorId}) => DbWorkAuthor(
    workId: workId ?? this.workId,
    authorId: authorId ?? this.authorId,
  );
  DbWorkAuthor copyWithCompanion(DbWorkAuthorsCompanion data) {
    return DbWorkAuthor(
      workId: data.workId.present ? data.workId.value : this.workId,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkAuthor(')
          ..write('workId: $workId, ')
          ..write('authorId: $authorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, authorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkAuthor &&
          other.workId == this.workId &&
          other.authorId == this.authorId);
}

class DbWorkAuthorsCompanion extends UpdateCompanion<DbWorkAuthor> {
  final Value<int> workId;
  final Value<int> authorId;
  final Value<int> rowid;
  const DbWorkAuthorsCompanion({
    this.workId = const Value.absent(),
    this.authorId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkAuthorsCompanion.insert({
    required int workId,
    required int authorId,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       authorId = Value(authorId);
  static Insertable<DbWorkAuthor> custom({
    Expression<int>? workId,
    Expression<int>? authorId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (authorId != null) 'author_id': authorId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkAuthorsCompanion copyWith({
    Value<int>? workId,
    Value<int>? authorId,
    Value<int>? rowid,
  }) {
    return DbWorkAuthorsCompanion(
      workId: workId ?? this.workId,
      authorId: authorId ?? this.authorId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkAuthorsCompanion(')
          ..write('workId: $workId, ')
          ..write('authorId: $authorId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbTagsTable extends DbTags with TableInfo<$DbTagsTable, DbTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localizedNameMeta = const VerificationMeta(
    'localizedName',
  );
  @override
  late final GeneratedColumn<String> localizedName = GeneratedColumn<String>(
    'localized_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _canonicalMeta = const VerificationMeta(
    'canonical',
  );
  @override
  late final GeneratedColumn<bool> canonical = GeneratedColumn<bool>(
    'canonical',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("canonical" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    name,
    localizedName,
    count,
    canonical,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('localized_name')) {
      context.handle(
        _localizedNameMeta,
        localizedName.isAcceptableOrUnknown(
          data['localized_name']!,
          _localizedNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localizedNameMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    if (data.containsKey('canonical')) {
      context.handle(
        _canonicalMeta,
        canonical.isAcceptableOrUnknown(data['canonical']!, _canonicalMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  DbTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbTag(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      localizedName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}localized_name'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      canonical: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}canonical'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $DbTagsTable createAlias(String alias) {
    return $DbTagsTable(attachedDatabase, alias);
  }
}

class DbTag extends DataClass implements Insertable<DbTag> {
  final String name;
  final String localizedName;
  final int count;
  final bool canonical;
  final String type;
  const DbTag({
    required this.name,
    required this.localizedName,
    required this.count,
    required this.canonical,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['localized_name'] = Variable<String>(localizedName);
    map['count'] = Variable<int>(count);
    map['canonical'] = Variable<bool>(canonical);
    map['type'] = Variable<String>(type);
    return map;
  }

  DbTagsCompanion toCompanion(bool nullToAbsent) {
    return DbTagsCompanion(
      name: Value(name),
      localizedName: Value(localizedName),
      count: Value(count),
      canonical: Value(canonical),
      type: Value(type),
    );
  }

  factory DbTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbTag(
      name: serializer.fromJson<String>(json['name']),
      localizedName: serializer.fromJson<String>(json['localizedName']),
      count: serializer.fromJson<int>(json['count']),
      canonical: serializer.fromJson<bool>(json['canonical']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'localizedName': serializer.toJson<String>(localizedName),
      'count': serializer.toJson<int>(count),
      'canonical': serializer.toJson<bool>(canonical),
      'type': serializer.toJson<String>(type),
    };
  }

  DbTag copyWith({
    String? name,
    String? localizedName,
    int? count,
    bool? canonical,
    String? type,
  }) => DbTag(
    name: name ?? this.name,
    localizedName: localizedName ?? this.localizedName,
    count: count ?? this.count,
    canonical: canonical ?? this.canonical,
    type: type ?? this.type,
  );
  DbTag copyWithCompanion(DbTagsCompanion data) {
    return DbTag(
      name: data.name.present ? data.name.value : this.name,
      localizedName: data.localizedName.present
          ? data.localizedName.value
          : this.localizedName,
      count: data.count.present ? data.count.value : this.count,
      canonical: data.canonical.present ? data.canonical.value : this.canonical,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbTag(')
          ..write('name: $name, ')
          ..write('localizedName: $localizedName, ')
          ..write('count: $count, ')
          ..write('canonical: $canonical, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, localizedName, count, canonical, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbTag &&
          other.name == this.name &&
          other.localizedName == this.localizedName &&
          other.count == this.count &&
          other.canonical == this.canonical &&
          other.type == this.type);
}

class DbTagsCompanion extends UpdateCompanion<DbTag> {
  final Value<String> name;
  final Value<String> localizedName;
  final Value<int> count;
  final Value<bool> canonical;
  final Value<String> type;
  final Value<int> rowid;
  const DbTagsCompanion({
    this.name = const Value.absent(),
    this.localizedName = const Value.absent(),
    this.count = const Value.absent(),
    this.canonical = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbTagsCompanion.insert({
    required String name,
    required String localizedName,
    this.count = const Value.absent(),
    this.canonical = const Value.absent(),
    required String type,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       localizedName = Value(localizedName),
       type = Value(type);
  static Insertable<DbTag> custom({
    Expression<String>? name,
    Expression<String>? localizedName,
    Expression<int>? count,
    Expression<bool>? canonical,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (localizedName != null) 'localized_name': localizedName,
      if (count != null) 'count': count,
      if (canonical != null) 'canonical': canonical,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbTagsCompanion copyWith({
    Value<String>? name,
    Value<String>? localizedName,
    Value<int>? count,
    Value<bool>? canonical,
    Value<String>? type,
    Value<int>? rowid,
  }) {
    return DbTagsCompanion(
      name: name ?? this.name,
      localizedName: localizedName ?? this.localizedName,
      count: count ?? this.count,
      canonical: canonical ?? this.canonical,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (localizedName.present) {
      map['localized_name'] = Variable<String>(localizedName.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (canonical.present) {
      map['canonical'] = Variable<bool>(canonical.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbTagsCompanion(')
          ..write('name: $name, ')
          ..write('localizedName: $localizedName, ')
          ..write('count: $count, ')
          ..write('canonical: $canonical, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbWorkFandomsTable extends DbWorkFandoms
    with TableInfo<$DbWorkFandomsTable, DbWorkFandom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkFandomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tag_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (name)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [workId, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_fandoms';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkFandom> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('tag_name')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, tagName};
  @override
  DbWorkFandom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkFandom(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_name'],
      )!,
    );
  }

  @override
  $DbWorkFandomsTable createAlias(String alias) {
    return $DbWorkFandomsTable(attachedDatabase, alias);
  }
}

class DbWorkFandom extends DataClass implements Insertable<DbWorkFandom> {
  final int workId;
  final String tagName;
  const DbWorkFandom({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  DbWorkFandomsCompanion toCompanion(bool nullToAbsent) {
    return DbWorkFandomsCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory DbWorkFandom.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkFandom(
      workId: serializer.fromJson<int>(json['workId']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  DbWorkFandom copyWith({int? workId, String? tagName}) => DbWorkFandom(
    workId: workId ?? this.workId,
    tagName: tagName ?? this.tagName,
  );
  DbWorkFandom copyWithCompanion(DbWorkFandomsCompanion data) {
    return DbWorkFandom(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkFandom(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkFandom &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class DbWorkFandomsCompanion extends UpdateCompanion<DbWorkFandom> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const DbWorkFandomsCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkFandomsCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<DbWorkFandom> custom({
    Expression<int>? workId,
    Expression<String>? tagName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (tagName != null) 'tag_name': tagName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkFandomsCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return DbWorkFandomsCompanion(
      workId: workId ?? this.workId,
      tagName: tagName ?? this.tagName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkFandomsCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbWorkRelationshipsTable extends DbWorkRelationships
    with TableInfo<$DbWorkRelationshipsTable, DbWorkRelationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkRelationshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tag_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (name)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [workId, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_relationships';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkRelationship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('tag_name')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, tagName};
  @override
  DbWorkRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkRelationship(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_name'],
      )!,
    );
  }

  @override
  $DbWorkRelationshipsTable createAlias(String alias) {
    return $DbWorkRelationshipsTable(attachedDatabase, alias);
  }
}

class DbWorkRelationship extends DataClass
    implements Insertable<DbWorkRelationship> {
  final int workId;
  final String tagName;
  const DbWorkRelationship({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  DbWorkRelationshipsCompanion toCompanion(bool nullToAbsent) {
    return DbWorkRelationshipsCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory DbWorkRelationship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkRelationship(
      workId: serializer.fromJson<int>(json['workId']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  DbWorkRelationship copyWith({int? workId, String? tagName}) =>
      DbWorkRelationship(
        workId: workId ?? this.workId,
        tagName: tagName ?? this.tagName,
      );
  DbWorkRelationship copyWithCompanion(DbWorkRelationshipsCompanion data) {
    return DbWorkRelationship(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkRelationship(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkRelationship &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class DbWorkRelationshipsCompanion extends UpdateCompanion<DbWorkRelationship> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const DbWorkRelationshipsCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkRelationshipsCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<DbWorkRelationship> custom({
    Expression<int>? workId,
    Expression<String>? tagName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (tagName != null) 'tag_name': tagName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkRelationshipsCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return DbWorkRelationshipsCompanion(
      workId: workId ?? this.workId,
      tagName: tagName ?? this.tagName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkRelationshipsCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbWorkCharactersTable extends DbWorkCharacters
    with TableInfo<$DbWorkCharactersTable, DbWorkCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tag_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (name)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [workId, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('tag_name')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, tagName};
  @override
  DbWorkCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkCharacter(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_name'],
      )!,
    );
  }

  @override
  $DbWorkCharactersTable createAlias(String alias) {
    return $DbWorkCharactersTable(attachedDatabase, alias);
  }
}

class DbWorkCharacter extends DataClass implements Insertable<DbWorkCharacter> {
  final int workId;
  final String tagName;
  const DbWorkCharacter({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  DbWorkCharactersCompanion toCompanion(bool nullToAbsent) {
    return DbWorkCharactersCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory DbWorkCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkCharacter(
      workId: serializer.fromJson<int>(json['workId']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  DbWorkCharacter copyWith({int? workId, String? tagName}) => DbWorkCharacter(
    workId: workId ?? this.workId,
    tagName: tagName ?? this.tagName,
  );
  DbWorkCharacter copyWithCompanion(DbWorkCharactersCompanion data) {
    return DbWorkCharacter(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkCharacter(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkCharacter &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class DbWorkCharactersCompanion extends UpdateCompanion<DbWorkCharacter> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const DbWorkCharactersCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkCharactersCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<DbWorkCharacter> custom({
    Expression<int>? workId,
    Expression<String>? tagName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (tagName != null) 'tag_name': tagName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkCharactersCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return DbWorkCharactersCompanion(
      workId: workId ?? this.workId,
      tagName: tagName ?? this.tagName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkCharactersCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbWorkTagsTable extends DbWorkTags
    with TableInfo<$DbWorkTagsTable, DbWorkTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tag_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (name)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [workId, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('tag_name')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, tagName};
  @override
  DbWorkTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkTag(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_name'],
      )!,
    );
  }

  @override
  $DbWorkTagsTable createAlias(String alias) {
    return $DbWorkTagsTable(attachedDatabase, alias);
  }
}

class DbWorkTag extends DataClass implements Insertable<DbWorkTag> {
  final int workId;
  final String tagName;
  const DbWorkTag({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  DbWorkTagsCompanion toCompanion(bool nullToAbsent) {
    return DbWorkTagsCompanion(workId: Value(workId), tagName: Value(tagName));
  }

  factory DbWorkTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkTag(
      workId: serializer.fromJson<int>(json['workId']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  DbWorkTag copyWith({int? workId, String? tagName}) => DbWorkTag(
    workId: workId ?? this.workId,
    tagName: tagName ?? this.tagName,
  );
  DbWorkTag copyWithCompanion(DbWorkTagsCompanion data) {
    return DbWorkTag(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkTag(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkTag &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class DbWorkTagsCompanion extends UpdateCompanion<DbWorkTag> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const DbWorkTagsCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkTagsCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<DbWorkTag> custom({
    Expression<int>? workId,
    Expression<String>? tagName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (tagName != null) 'tag_name': tagName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkTagsCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return DbWorkTagsCompanion(
      workId: workId ?? this.workId,
      tagName: tagName ?? this.tagName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkTagsCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbChaptersTable extends DbChapters
    with TableInfo<$DbChaptersTable, DbChapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _chapterMeta = const VerificationMeta(
    'chapter',
  );
  @override
  late final GeneratedColumn<int> chapter = GeneratedColumn<int>(
    'chapter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishDateMeta = const VerificationMeta(
    'publishDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
    'publish_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prefaceMeta = const VerificationMeta(
    'preface',
  );
  @override
  late final GeneratedColumn<String> preface = GeneratedColumn<String>(
    'preface',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postfaceMeta = const VerificationMeta(
    'postface',
  );
  @override
  late final GeneratedColumn<String> postface = GeneratedColumn<String>(
    'postface',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wordsMeta = const VerificationMeta('words');
  @override
  late final GeneratedColumn<int> words = GeneratedColumn<int>(
    'words',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _commentsMeta = const VerificationMeta(
    'comments',
  );
  @override
  late final GeneratedColumn<int> comments = GeneratedColumn<int>(
    'comments',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _oneshotMeta = const VerificationMeta(
    'oneshot',
  );
  @override
  late final GeneratedColumn<bool> oneshot = GeneratedColumn<bool>(
    'oneshot',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("oneshot" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workId,
    chapter,
    title,
    publishDate,
    summary,
    preface,
    postface,
    content,
    words,
    comments,
    oneshot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbChapter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('chapter')) {
      context.handle(
        _chapterMeta,
        chapter.isAcceptableOrUnknown(data['chapter']!, _chapterMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('publish_date')) {
      context.handle(
        _publishDateMeta,
        publishDate.isAcceptableOrUnknown(
          data['publish_date']!,
          _publishDateMeta,
        ),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('preface')) {
      context.handle(
        _prefaceMeta,
        preface.isAcceptableOrUnknown(data['preface']!, _prefaceMeta),
      );
    }
    if (data.containsKey('postface')) {
      context.handle(
        _postfaceMeta,
        postface.isAcceptableOrUnknown(data['postface']!, _postfaceMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('words')) {
      context.handle(
        _wordsMeta,
        words.isAcceptableOrUnknown(data['words']!, _wordsMeta),
      );
    }
    if (data.containsKey('comments')) {
      context.handle(
        _commentsMeta,
        comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta),
      );
    }
    if (data.containsKey('oneshot')) {
      context.handle(
        _oneshotMeta,
        oneshot.isAcceptableOrUnknown(data['oneshot']!, _oneshotMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbChapter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      chapter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      publishDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publish_date'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      preface: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preface'],
      ),
      postface: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}postface'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      words: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}words'],
      )!,
      comments: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}comments'],
      )!,
      oneshot: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}oneshot'],
      )!,
    );
  }

  @override
  $DbChaptersTable createAlias(String alias) {
    return $DbChaptersTable(attachedDatabase, alias);
  }
}

class DbChapter extends DataClass implements Insertable<DbChapter> {
  final int id;
  final int workId;
  final int chapter;
  final String title;
  final DateTime? publishDate;
  final String? summary;
  final String? preface;
  final String? postface;
  final String? content;
  final int words;
  final int comments;
  final bool oneshot;
  const DbChapter({
    required this.id,
    required this.workId,
    required this.chapter,
    required this.title,
    this.publishDate,
    this.summary,
    this.preface,
    this.postface,
    this.content,
    required this.words,
    required this.comments,
    required this.oneshot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['work_id'] = Variable<int>(workId);
    map['chapter'] = Variable<int>(chapter);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || publishDate != null) {
      map['publish_date'] = Variable<DateTime>(publishDate);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || preface != null) {
      map['preface'] = Variable<String>(preface);
    }
    if (!nullToAbsent || postface != null) {
      map['postface'] = Variable<String>(postface);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['words'] = Variable<int>(words);
    map['comments'] = Variable<int>(comments);
    map['oneshot'] = Variable<bool>(oneshot);
    return map;
  }

  DbChaptersCompanion toCompanion(bool nullToAbsent) {
    return DbChaptersCompanion(
      id: Value(id),
      workId: Value(workId),
      chapter: Value(chapter),
      title: Value(title),
      publishDate: publishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishDate),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      preface: preface == null && nullToAbsent
          ? const Value.absent()
          : Value(preface),
      postface: postface == null && nullToAbsent
          ? const Value.absent()
          : Value(postface),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      words: Value(words),
      comments: Value(comments),
      oneshot: Value(oneshot),
    );
  }

  factory DbChapter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbChapter(
      id: serializer.fromJson<int>(json['id']),
      workId: serializer.fromJson<int>(json['workId']),
      chapter: serializer.fromJson<int>(json['chapter']),
      title: serializer.fromJson<String>(json['title']),
      publishDate: serializer.fromJson<DateTime?>(json['publishDate']),
      summary: serializer.fromJson<String?>(json['summary']),
      preface: serializer.fromJson<String?>(json['preface']),
      postface: serializer.fromJson<String?>(json['postface']),
      content: serializer.fromJson<String?>(json['content']),
      words: serializer.fromJson<int>(json['words']),
      comments: serializer.fromJson<int>(json['comments']),
      oneshot: serializer.fromJson<bool>(json['oneshot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workId': serializer.toJson<int>(workId),
      'chapter': serializer.toJson<int>(chapter),
      'title': serializer.toJson<String>(title),
      'publishDate': serializer.toJson<DateTime?>(publishDate),
      'summary': serializer.toJson<String?>(summary),
      'preface': serializer.toJson<String?>(preface),
      'postface': serializer.toJson<String?>(postface),
      'content': serializer.toJson<String?>(content),
      'words': serializer.toJson<int>(words),
      'comments': serializer.toJson<int>(comments),
      'oneshot': serializer.toJson<bool>(oneshot),
    };
  }

  DbChapter copyWith({
    int? id,
    int? workId,
    int? chapter,
    String? title,
    Value<DateTime?> publishDate = const Value.absent(),
    Value<String?> summary = const Value.absent(),
    Value<String?> preface = const Value.absent(),
    Value<String?> postface = const Value.absent(),
    Value<String?> content = const Value.absent(),
    int? words,
    int? comments,
    bool? oneshot,
  }) => DbChapter(
    id: id ?? this.id,
    workId: workId ?? this.workId,
    chapter: chapter ?? this.chapter,
    title: title ?? this.title,
    publishDate: publishDate.present ? publishDate.value : this.publishDate,
    summary: summary.present ? summary.value : this.summary,
    preface: preface.present ? preface.value : this.preface,
    postface: postface.present ? postface.value : this.postface,
    content: content.present ? content.value : this.content,
    words: words ?? this.words,
    comments: comments ?? this.comments,
    oneshot: oneshot ?? this.oneshot,
  );
  DbChapter copyWithCompanion(DbChaptersCompanion data) {
    return DbChapter(
      id: data.id.present ? data.id.value : this.id,
      workId: data.workId.present ? data.workId.value : this.workId,
      chapter: data.chapter.present ? data.chapter.value : this.chapter,
      title: data.title.present ? data.title.value : this.title,
      publishDate: data.publishDate.present
          ? data.publishDate.value
          : this.publishDate,
      summary: data.summary.present ? data.summary.value : this.summary,
      preface: data.preface.present ? data.preface.value : this.preface,
      postface: data.postface.present ? data.postface.value : this.postface,
      content: data.content.present ? data.content.value : this.content,
      words: data.words.present ? data.words.value : this.words,
      comments: data.comments.present ? data.comments.value : this.comments,
      oneshot: data.oneshot.present ? data.oneshot.value : this.oneshot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbChapter(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('chapter: $chapter, ')
          ..write('title: $title, ')
          ..write('publishDate: $publishDate, ')
          ..write('summary: $summary, ')
          ..write('preface: $preface, ')
          ..write('postface: $postface, ')
          ..write('content: $content, ')
          ..write('words: $words, ')
          ..write('comments: $comments, ')
          ..write('oneshot: $oneshot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workId,
    chapter,
    title,
    publishDate,
    summary,
    preface,
    postface,
    content,
    words,
    comments,
    oneshot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbChapter &&
          other.id == this.id &&
          other.workId == this.workId &&
          other.chapter == this.chapter &&
          other.title == this.title &&
          other.publishDate == this.publishDate &&
          other.summary == this.summary &&
          other.preface == this.preface &&
          other.postface == this.postface &&
          other.content == this.content &&
          other.words == this.words &&
          other.comments == this.comments &&
          other.oneshot == this.oneshot);
}

class DbChaptersCompanion extends UpdateCompanion<DbChapter> {
  final Value<int> id;
  final Value<int> workId;
  final Value<int> chapter;
  final Value<String> title;
  final Value<DateTime?> publishDate;
  final Value<String?> summary;
  final Value<String?> preface;
  final Value<String?> postface;
  final Value<String?> content;
  final Value<int> words;
  final Value<int> comments;
  final Value<bool> oneshot;
  const DbChaptersCompanion({
    this.id = const Value.absent(),
    this.workId = const Value.absent(),
    this.chapter = const Value.absent(),
    this.title = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.summary = const Value.absent(),
    this.preface = const Value.absent(),
    this.postface = const Value.absent(),
    this.content = const Value.absent(),
    this.words = const Value.absent(),
    this.comments = const Value.absent(),
    this.oneshot = const Value.absent(),
  });
  DbChaptersCompanion.insert({
    this.id = const Value.absent(),
    required int workId,
    required int chapter,
    required String title,
    this.publishDate = const Value.absent(),
    this.summary = const Value.absent(),
    this.preface = const Value.absent(),
    this.postface = const Value.absent(),
    this.content = const Value.absent(),
    this.words = const Value.absent(),
    this.comments = const Value.absent(),
    this.oneshot = const Value.absent(),
  }) : workId = Value(workId),
       chapter = Value(chapter),
       title = Value(title);
  static Insertable<DbChapter> custom({
    Expression<int>? id,
    Expression<int>? workId,
    Expression<int>? chapter,
    Expression<String>? title,
    Expression<DateTime>? publishDate,
    Expression<String>? summary,
    Expression<String>? preface,
    Expression<String>? postface,
    Expression<String>? content,
    Expression<int>? words,
    Expression<int>? comments,
    Expression<bool>? oneshot,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workId != null) 'work_id': workId,
      if (chapter != null) 'chapter': chapter,
      if (title != null) 'title': title,
      if (publishDate != null) 'publish_date': publishDate,
      if (summary != null) 'summary': summary,
      if (preface != null) 'preface': preface,
      if (postface != null) 'postface': postface,
      if (content != null) 'content': content,
      if (words != null) 'words': words,
      if (comments != null) 'comments': comments,
      if (oneshot != null) 'oneshot': oneshot,
    });
  }

  DbChaptersCompanion copyWith({
    Value<int>? id,
    Value<int>? workId,
    Value<int>? chapter,
    Value<String>? title,
    Value<DateTime?>? publishDate,
    Value<String?>? summary,
    Value<String?>? preface,
    Value<String?>? postface,
    Value<String?>? content,
    Value<int>? words,
    Value<int>? comments,
    Value<bool>? oneshot,
  }) {
    return DbChaptersCompanion(
      id: id ?? this.id,
      workId: workId ?? this.workId,
      chapter: chapter ?? this.chapter,
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      summary: summary ?? this.summary,
      preface: preface ?? this.preface,
      postface: postface ?? this.postface,
      content: content ?? this.content,
      words: words ?? this.words,
      comments: comments ?? this.comments,
      oneshot: oneshot ?? this.oneshot,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (chapter.present) {
      map['chapter'] = Variable<int>(chapter.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (preface.present) {
      map['preface'] = Variable<String>(preface.value);
    }
    if (postface.present) {
      map['postface'] = Variable<String>(postface.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (words.present) {
      map['words'] = Variable<int>(words.value);
    }
    if (comments.present) {
      map['comments'] = Variable<int>(comments.value);
    }
    if (oneshot.present) {
      map['oneshot'] = Variable<bool>(oneshot.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChaptersCompanion(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('chapter: $chapter, ')
          ..write('title: $title, ')
          ..write('publishDate: $publishDate, ')
          ..write('summary: $summary, ')
          ..write('preface: $preface, ')
          ..write('postface: $postface, ')
          ..write('content: $content, ')
          ..write('words: $words, ')
          ..write('comments: $comments, ')
          ..write('oneshot: $oneshot')
          ..write(')'))
        .toString();
  }
}

class $DbReadHistoriesTable extends DbReadHistories
    with TableInfo<$DbReadHistoriesTable, DbReadHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbReadHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
    'chapter_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id)',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completionMeta = const VerificationMeta(
    'completion',
  );
  @override
  late final GeneratedColumn<double> completion = GeneratedColumn<double>(
    'completion',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hitsMeta = const VerificationMeta('hits');
  @override
  late final GeneratedColumn<int> hits = GeneratedColumn<int>(
    'hits',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    workId,
    chapterId,
    timestamp,
    position,
    status,
    completion,
    hits,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'read_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbReadHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('completion')) {
      context.handle(
        _completionMeta,
        completion.isAcceptableOrUnknown(data['completion']!, _completionMeta),
      );
    } else if (isInserting) {
      context.missing(_completionMeta);
    }
    if (data.containsKey('hits')) {
      context.handle(
        _hitsMeta,
        hits.isAcceptableOrUnknown(data['hits']!, _hitsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId};
  @override
  DbReadHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbReadHistory(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_id'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      completion: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}completion'],
      )!,
      hits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hits'],
      )!,
    );
  }

  @override
  $DbReadHistoriesTable createAlias(String alias) {
    return $DbReadHistoriesTable(attachedDatabase, alias);
  }
}

class DbReadHistory extends DataClass implements Insertable<DbReadHistory> {
  final int workId;
  final int? chapterId;
  final DateTime timestamp;
  final int position;
  final String status;
  final double completion;
  final int hits;
  const DbReadHistory({
    required this.workId,
    this.chapterId,
    required this.timestamp,
    required this.position,
    required this.status,
    required this.completion,
    required this.hits,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<int>(chapterId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['position'] = Variable<int>(position);
    map['status'] = Variable<String>(status);
    map['completion'] = Variable<double>(completion);
    map['hits'] = Variable<int>(hits);
    return map;
  }

  DbReadHistoriesCompanion toCompanion(bool nullToAbsent) {
    return DbReadHistoriesCompanion(
      workId: Value(workId),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      timestamp: Value(timestamp),
      position: Value(position),
      status: Value(status),
      completion: Value(completion),
      hits: Value(hits),
    );
  }

  factory DbReadHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbReadHistory(
      workId: serializer.fromJson<int>(json['workId']),
      chapterId: serializer.fromJson<int?>(json['chapterId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      position: serializer.fromJson<int>(json['position']),
      status: serializer.fromJson<String>(json['status']),
      completion: serializer.fromJson<double>(json['completion']),
      hits: serializer.fromJson<int>(json['hits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'chapterId': serializer.toJson<int?>(chapterId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'position': serializer.toJson<int>(position),
      'status': serializer.toJson<String>(status),
      'completion': serializer.toJson<double>(completion),
      'hits': serializer.toJson<int>(hits),
    };
  }

  DbReadHistory copyWith({
    int? workId,
    Value<int?> chapterId = const Value.absent(),
    DateTime? timestamp,
    int? position,
    String? status,
    double? completion,
    int? hits,
  }) => DbReadHistory(
    workId: workId ?? this.workId,
    chapterId: chapterId.present ? chapterId.value : this.chapterId,
    timestamp: timestamp ?? this.timestamp,
    position: position ?? this.position,
    status: status ?? this.status,
    completion: completion ?? this.completion,
    hits: hits ?? this.hits,
  );
  DbReadHistory copyWithCompanion(DbReadHistoriesCompanion data) {
    return DbReadHistory(
      workId: data.workId.present ? data.workId.value : this.workId,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      position: data.position.present ? data.position.value : this.position,
      status: data.status.present ? data.status.value : this.status,
      completion: data.completion.present
          ? data.completion.value
          : this.completion,
      hits: data.hits.present ? data.hits.value : this.hits,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbReadHistory(')
          ..write('workId: $workId, ')
          ..write('chapterId: $chapterId, ')
          ..write('timestamp: $timestamp, ')
          ..write('position: $position, ')
          ..write('status: $status, ')
          ..write('completion: $completion, ')
          ..write('hits: $hits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    workId,
    chapterId,
    timestamp,
    position,
    status,
    completion,
    hits,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbReadHistory &&
          other.workId == this.workId &&
          other.chapterId == this.chapterId &&
          other.timestamp == this.timestamp &&
          other.position == this.position &&
          other.status == this.status &&
          other.completion == this.completion &&
          other.hits == this.hits);
}

class DbReadHistoriesCompanion extends UpdateCompanion<DbReadHistory> {
  final Value<int> workId;
  final Value<int?> chapterId;
  final Value<DateTime> timestamp;
  final Value<int> position;
  final Value<String> status;
  final Value<double> completion;
  final Value<int> hits;
  const DbReadHistoriesCompanion({
    this.workId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.position = const Value.absent(),
    this.status = const Value.absent(),
    this.completion = const Value.absent(),
    this.hits = const Value.absent(),
  });
  DbReadHistoriesCompanion.insert({
    this.workId = const Value.absent(),
    this.chapterId = const Value.absent(),
    required DateTime timestamp,
    required int position,
    required String status,
    required double completion,
    this.hits = const Value.absent(),
  }) : timestamp = Value(timestamp),
       position = Value(position),
       status = Value(status),
       completion = Value(completion);
  static Insertable<DbReadHistory> custom({
    Expression<int>? workId,
    Expression<int>? chapterId,
    Expression<DateTime>? timestamp,
    Expression<int>? position,
    Expression<String>? status,
    Expression<double>? completion,
    Expression<int>? hits,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (chapterId != null) 'chapter_id': chapterId,
      if (timestamp != null) 'timestamp': timestamp,
      if (position != null) 'position': position,
      if (status != null) 'status': status,
      if (completion != null) 'completion': completion,
      if (hits != null) 'hits': hits,
    });
  }

  DbReadHistoriesCompanion copyWith({
    Value<int>? workId,
    Value<int?>? chapterId,
    Value<DateTime>? timestamp,
    Value<int>? position,
    Value<String>? status,
    Value<double>? completion,
    Value<int>? hits,
  }) {
    return DbReadHistoriesCompanion(
      workId: workId ?? this.workId,
      chapterId: chapterId ?? this.chapterId,
      timestamp: timestamp ?? this.timestamp,
      position: position ?? this.position,
      status: status ?? this.status,
      completion: completion ?? this.completion,
      hits: hits ?? this.hits,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (completion.present) {
      map['completion'] = Variable<double>(completion.value);
    }
    if (hits.present) {
      map['hits'] = Variable<int>(hits.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbReadHistoriesCompanion(')
          ..write('workId: $workId, ')
          ..write('chapterId: $chapterId, ')
          ..write('timestamp: $timestamp, ')
          ..write('position: $position, ')
          ..write('status: $status, ')
          ..write('completion: $completion, ')
          ..write('hits: $hits')
          ..write(')'))
        .toString();
  }
}

class $DbSeriesTable extends DbSeries with TableInfo<$DbSeriesTable, DbSery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _wordsMeta = const VerificationMeta('words');
  @override
  late final GeneratedColumn<int> words = GeneratedColumn<int>(
    'words',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _worksMeta = const VerificationMeta('works');
  @override
  late final GeneratedColumn<int> works = GeneratedColumn<int>(
    'works',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bookmarksMeta = const VerificationMeta(
    'bookmarks',
  );
  @override
  late final GeneratedColumn<int> bookmarks = GeneratedColumn<int>(
    'bookmarks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updateDateMeta = const VerificationMeta(
    'updateDate',
  );
  @override
  late final GeneratedColumn<DateTime> updateDate = GeneratedColumn<DateTime>(
    'update_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _finishedMeta = const VerificationMeta(
    'finished',
  );
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
    'finished',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("finished" IN (0, 1))',
    ),
  );
  static const VerificationMeta _publishDateMeta = const VerificationMeta(
    'publishDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
    'publish_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    summary,
    words,
    works,
    bookmarks,
    updateDate,
    finished,
    publishDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSery> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('words')) {
      context.handle(
        _wordsMeta,
        words.isAcceptableOrUnknown(data['words']!, _wordsMeta),
      );
    }
    if (data.containsKey('works')) {
      context.handle(
        _worksMeta,
        works.isAcceptableOrUnknown(data['works']!, _worksMeta),
      );
    }
    if (data.containsKey('bookmarks')) {
      context.handle(
        _bookmarksMeta,
        bookmarks.isAcceptableOrUnknown(data['bookmarks']!, _bookmarksMeta),
      );
    }
    if (data.containsKey('update_date')) {
      context.handle(
        _updateDateMeta,
        updateDate.isAcceptableOrUnknown(data['update_date']!, _updateDateMeta),
      );
    }
    if (data.containsKey('finished')) {
      context.handle(
        _finishedMeta,
        finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta),
      );
    }
    if (data.containsKey('publish_date')) {
      context.handle(
        _publishDateMeta,
        publishDate.isAcceptableOrUnknown(
          data['publish_date']!,
          _publishDateMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSery(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      words: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}words'],
      )!,
      works: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}works'],
      )!,
      bookmarks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bookmarks'],
      )!,
      updateDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}update_date'],
      ),
      finished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}finished'],
      ),
      publishDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publish_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $DbSeriesTable createAlias(String alias) {
    return $DbSeriesTable(attachedDatabase, alias);
  }
}

class DbSery extends DataClass implements Insertable<DbSery> {
  final int id;
  final String title;
  final String summary;
  final int words;
  final int works;
  final int bookmarks;
  final DateTime? updateDate;
  final bool? finished;
  final DateTime? publishDate;
  final String? notes;
  const DbSery({
    required this.id,
    required this.title,
    required this.summary,
    required this.words,
    required this.works,
    required this.bookmarks,
    this.updateDate,
    this.finished,
    this.publishDate,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['words'] = Variable<int>(words);
    map['works'] = Variable<int>(works);
    map['bookmarks'] = Variable<int>(bookmarks);
    if (!nullToAbsent || updateDate != null) {
      map['update_date'] = Variable<DateTime>(updateDate);
    }
    if (!nullToAbsent || finished != null) {
      map['finished'] = Variable<bool>(finished);
    }
    if (!nullToAbsent || publishDate != null) {
      map['publish_date'] = Variable<DateTime>(publishDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  DbSeriesCompanion toCompanion(bool nullToAbsent) {
    return DbSeriesCompanion(
      id: Value(id),
      title: Value(title),
      summary: Value(summary),
      words: Value(words),
      works: Value(works),
      bookmarks: Value(bookmarks),
      updateDate: updateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updateDate),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
      publishDate: publishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory DbSery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSery(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      words: serializer.fromJson<int>(json['words']),
      works: serializer.fromJson<int>(json['works']),
      bookmarks: serializer.fromJson<int>(json['bookmarks']),
      updateDate: serializer.fromJson<DateTime?>(json['updateDate']),
      finished: serializer.fromJson<bool?>(json['finished']),
      publishDate: serializer.fromJson<DateTime?>(json['publishDate']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'words': serializer.toJson<int>(words),
      'works': serializer.toJson<int>(works),
      'bookmarks': serializer.toJson<int>(bookmarks),
      'updateDate': serializer.toJson<DateTime?>(updateDate),
      'finished': serializer.toJson<bool?>(finished),
      'publishDate': serializer.toJson<DateTime?>(publishDate),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  DbSery copyWith({
    int? id,
    String? title,
    String? summary,
    int? words,
    int? works,
    int? bookmarks,
    Value<DateTime?> updateDate = const Value.absent(),
    Value<bool?> finished = const Value.absent(),
    Value<DateTime?> publishDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => DbSery(
    id: id ?? this.id,
    title: title ?? this.title,
    summary: summary ?? this.summary,
    words: words ?? this.words,
    works: works ?? this.works,
    bookmarks: bookmarks ?? this.bookmarks,
    updateDate: updateDate.present ? updateDate.value : this.updateDate,
    finished: finished.present ? finished.value : this.finished,
    publishDate: publishDate.present ? publishDate.value : this.publishDate,
    notes: notes.present ? notes.value : this.notes,
  );
  DbSery copyWithCompanion(DbSeriesCompanion data) {
    return DbSery(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      words: data.words.present ? data.words.value : this.words,
      works: data.works.present ? data.works.value : this.works,
      bookmarks: data.bookmarks.present ? data.bookmarks.value : this.bookmarks,
      updateDate: data.updateDate.present
          ? data.updateDate.value
          : this.updateDate,
      finished: data.finished.present ? data.finished.value : this.finished,
      publishDate: data.publishDate.present
          ? data.publishDate.value
          : this.publishDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSery(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('words: $words, ')
          ..write('works: $works, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('updateDate: $updateDate, ')
          ..write('finished: $finished, ')
          ..write('publishDate: $publishDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    summary,
    words,
    works,
    bookmarks,
    updateDate,
    finished,
    publishDate,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSery &&
          other.id == this.id &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.words == this.words &&
          other.works == this.works &&
          other.bookmarks == this.bookmarks &&
          other.updateDate == this.updateDate &&
          other.finished == this.finished &&
          other.publishDate == this.publishDate &&
          other.notes == this.notes);
}

class DbSeriesCompanion extends UpdateCompanion<DbSery> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> summary;
  final Value<int> words;
  final Value<int> works;
  final Value<int> bookmarks;
  final Value<DateTime?> updateDate;
  final Value<bool?> finished;
  final Value<DateTime?> publishDate;
  final Value<String?> notes;
  const DbSeriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.words = const Value.absent(),
    this.works = const Value.absent(),
    this.bookmarks = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.finished = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.notes = const Value.absent(),
  });
  DbSeriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.summary = const Value.absent(),
    this.words = const Value.absent(),
    this.works = const Value.absent(),
    this.bookmarks = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.finished = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.notes = const Value.absent(),
  }) : title = Value(title);
  static Insertable<DbSery> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<int>? words,
    Expression<int>? works,
    Expression<int>? bookmarks,
    Expression<DateTime>? updateDate,
    Expression<bool>? finished,
    Expression<DateTime>? publishDate,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (words != null) 'words': words,
      if (works != null) 'works': works,
      if (bookmarks != null) 'bookmarks': bookmarks,
      if (updateDate != null) 'update_date': updateDate,
      if (finished != null) 'finished': finished,
      if (publishDate != null) 'publish_date': publishDate,
      if (notes != null) 'notes': notes,
    });
  }

  DbSeriesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? summary,
    Value<int>? words,
    Value<int>? works,
    Value<int>? bookmarks,
    Value<DateTime?>? updateDate,
    Value<bool?>? finished,
    Value<DateTime?>? publishDate,
    Value<String?>? notes,
  }) {
    return DbSeriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      words: words ?? this.words,
      works: works ?? this.works,
      bookmarks: bookmarks ?? this.bookmarks,
      updateDate: updateDate ?? this.updateDate,
      finished: finished ?? this.finished,
      publishDate: publishDate ?? this.publishDate,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (words.present) {
      map['words'] = Variable<int>(words.value);
    }
    if (works.present) {
      map['works'] = Variable<int>(works.value);
    }
    if (bookmarks.present) {
      map['bookmarks'] = Variable<int>(bookmarks.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<DateTime>(updateDate.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSeriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('words: $words, ')
          ..write('works: $works, ')
          ..write('bookmarks: $bookmarks, ')
          ..write('updateDate: $updateDate, ')
          ..write('finished: $finished, ')
          ..write('publishDate: $publishDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $DbWorkSeriesTable extends DbWorkSeries
    with TableInfo<$DbWorkSeriesTable, DbWorkSery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWorkSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  static const VerificationMeta _partMeta = const VerificationMeta('part');
  @override
  late final GeneratedColumn<int> part = GeneratedColumn<int>(
    'part',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [workId, seriesId, part];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_work_series';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWorkSery> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('part')) {
      context.handle(
        _partMeta,
        part.isAcceptableOrUnknown(data['part']!, _partMeta),
      );
    } else if (isInserting) {
      context.missing(_partMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, seriesId};
  @override
  DbWorkSery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWorkSery(
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      part: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}part'],
      )!,
    );
  }

  @override
  $DbWorkSeriesTable createAlias(String alias) {
    return $DbWorkSeriesTable(attachedDatabase, alias);
  }
}

class DbWorkSery extends DataClass implements Insertable<DbWorkSery> {
  final int workId;
  final int seriesId;
  final int part;
  const DbWorkSery({
    required this.workId,
    required this.seriesId,
    required this.part,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['series_id'] = Variable<int>(seriesId);
    map['part'] = Variable<int>(part);
    return map;
  }

  DbWorkSeriesCompanion toCompanion(bool nullToAbsent) {
    return DbWorkSeriesCompanion(
      workId: Value(workId),
      seriesId: Value(seriesId),
      part: Value(part),
    );
  }

  factory DbWorkSery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWorkSery(
      workId: serializer.fromJson<int>(json['workId']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      part: serializer.fromJson<int>(json['part']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'seriesId': serializer.toJson<int>(seriesId),
      'part': serializer.toJson<int>(part),
    };
  }

  DbWorkSery copyWith({int? workId, int? seriesId, int? part}) => DbWorkSery(
    workId: workId ?? this.workId,
    seriesId: seriesId ?? this.seriesId,
    part: part ?? this.part,
  );
  DbWorkSery copyWithCompanion(DbWorkSeriesCompanion data) {
    return DbWorkSery(
      workId: data.workId.present ? data.workId.value : this.workId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      part: data.part.present ? data.part.value : this.part,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkSery(')
          ..write('workId: $workId, ')
          ..write('seriesId: $seriesId, ')
          ..write('part: $part')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, seriesId, part);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWorkSery &&
          other.workId == this.workId &&
          other.seriesId == this.seriesId &&
          other.part == this.part);
}

class DbWorkSeriesCompanion extends UpdateCompanion<DbWorkSery> {
  final Value<int> workId;
  final Value<int> seriesId;
  final Value<int> part;
  final Value<int> rowid;
  const DbWorkSeriesCompanion({
    this.workId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.part = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWorkSeriesCompanion.insert({
    required int workId,
    required int seriesId,
    required int part,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       seriesId = Value(seriesId),
       part = Value(part);
  static Insertable<DbWorkSery> custom({
    Expression<int>? workId,
    Expression<int>? seriesId,
    Expression<int>? part,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (seriesId != null) 'series_id': seriesId,
      if (part != null) 'part': part,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWorkSeriesCompanion copyWith({
    Value<int>? workId,
    Value<int>? seriesId,
    Value<int>? part,
    Value<int>? rowid,
  }) {
    return DbWorkSeriesCompanion(
      workId: workId ?? this.workId,
      seriesId: seriesId ?? this.seriesId,
      part: part ?? this.part,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (part.present) {
      map['part'] = Variable<int>(part.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWorkSeriesCompanion(')
          ..write('workId: $workId, ')
          ..write('seriesId: $seriesId, ')
          ..write('part: $part, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbBookmarksTable extends DbBookmarks
    with TableInfo<$DbBookmarksTable, DbBookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbBookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
    'work_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works (id)',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES authors (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _privateNotesMeta = const VerificationMeta(
    'privateNotes',
  );
  @override
  late final GeneratedColumn<String> privateNotes = GeneratedColumn<String>(
    'private_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recNotesMeta = const VerificationMeta(
    'recNotes',
  );
  @override
  late final GeneratedColumn<String> recNotes = GeneratedColumn<String>(
    'rec_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workId,
    seriesId,
    userId,
    date,
    type,
    notes,
    privateNotes,
    recNotes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbBookmark> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work_id')) {
      context.handle(
        _workIdMeta,
        workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta),
      );
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('private_notes')) {
      context.handle(
        _privateNotesMeta,
        privateNotes.isAcceptableOrUnknown(
          data['private_notes']!,
          _privateNotesMeta,
        ),
      );
    }
    if (data.containsKey('rec_notes')) {
      context.handle(
        _recNotesMeta,
        recNotes.isAcceptableOrUnknown(data['rec_notes']!, _recNotesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbBookmark(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_id'],
      ),
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      privateNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}private_notes'],
      ),
      recNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rec_notes'],
      ),
    );
  }

  @override
  $DbBookmarksTable createAlias(String alias) {
    return $DbBookmarksTable(attachedDatabase, alias);
  }
}

class DbBookmark extends DataClass implements Insertable<DbBookmark> {
  final int id;
  final int? workId;
  final int? seriesId;
  final int userId;
  final DateTime date;
  final String type;
  final String? notes;
  final String? privateNotes;
  final String? recNotes;
  const DbBookmark({
    required this.id,
    this.workId,
    this.seriesId,
    required this.userId,
    required this.date,
    required this.type,
    this.notes,
    this.privateNotes,
    this.recNotes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || workId != null) {
      map['work_id'] = Variable<int>(workId);
    }
    if (!nullToAbsent || seriesId != null) {
      map['series_id'] = Variable<int>(seriesId);
    }
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || privateNotes != null) {
      map['private_notes'] = Variable<String>(privateNotes);
    }
    if (!nullToAbsent || recNotes != null) {
      map['rec_notes'] = Variable<String>(recNotes);
    }
    return map;
  }

  DbBookmarksCompanion toCompanion(bool nullToAbsent) {
    return DbBookmarksCompanion(
      id: Value(id),
      workId: workId == null && nullToAbsent
          ? const Value.absent()
          : Value(workId),
      seriesId: seriesId == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesId),
      userId: Value(userId),
      date: Value(date),
      type: Value(type),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      privateNotes: privateNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(privateNotes),
      recNotes: recNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(recNotes),
    );
  }

  factory DbBookmark.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBookmark(
      id: serializer.fromJson<int>(json['id']),
      workId: serializer.fromJson<int?>(json['workId']),
      seriesId: serializer.fromJson<int?>(json['seriesId']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      notes: serializer.fromJson<String?>(json['notes']),
      privateNotes: serializer.fromJson<String?>(json['privateNotes']),
      recNotes: serializer.fromJson<String?>(json['recNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workId': serializer.toJson<int?>(workId),
      'seriesId': serializer.toJson<int?>(seriesId),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'notes': serializer.toJson<String?>(notes),
      'privateNotes': serializer.toJson<String?>(privateNotes),
      'recNotes': serializer.toJson<String?>(recNotes),
    };
  }

  DbBookmark copyWith({
    int? id,
    Value<int?> workId = const Value.absent(),
    Value<int?> seriesId = const Value.absent(),
    int? userId,
    DateTime? date,
    String? type,
    Value<String?> notes = const Value.absent(),
    Value<String?> privateNotes = const Value.absent(),
    Value<String?> recNotes = const Value.absent(),
  }) => DbBookmark(
    id: id ?? this.id,
    workId: workId.present ? workId.value : this.workId,
    seriesId: seriesId.present ? seriesId.value : this.seriesId,
    userId: userId ?? this.userId,
    date: date ?? this.date,
    type: type ?? this.type,
    notes: notes.present ? notes.value : this.notes,
    privateNotes: privateNotes.present ? privateNotes.value : this.privateNotes,
    recNotes: recNotes.present ? recNotes.value : this.recNotes,
  );
  DbBookmark copyWithCompanion(DbBookmarksCompanion data) {
    return DbBookmark(
      id: data.id.present ? data.id.value : this.id,
      workId: data.workId.present ? data.workId.value : this.workId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      notes: data.notes.present ? data.notes.value : this.notes,
      privateNotes: data.privateNotes.present
          ? data.privateNotes.value
          : this.privateNotes,
      recNotes: data.recNotes.present ? data.recNotes.value : this.recNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbBookmark(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('seriesId: $seriesId, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('privateNotes: $privateNotes, ')
          ..write('recNotes: $recNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workId,
    seriesId,
    userId,
    date,
    type,
    notes,
    privateNotes,
    recNotes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbBookmark &&
          other.id == this.id &&
          other.workId == this.workId &&
          other.seriesId == this.seriesId &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.type == this.type &&
          other.notes == this.notes &&
          other.privateNotes == this.privateNotes &&
          other.recNotes == this.recNotes);
}

class DbBookmarksCompanion extends UpdateCompanion<DbBookmark> {
  final Value<int> id;
  final Value<int?> workId;
  final Value<int?> seriesId;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<String?> notes;
  final Value<String?> privateNotes;
  final Value<String?> recNotes;
  const DbBookmarksCompanion({
    this.id = const Value.absent(),
    this.workId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.notes = const Value.absent(),
    this.privateNotes = const Value.absent(),
    this.recNotes = const Value.absent(),
  });
  DbBookmarksCompanion.insert({
    this.id = const Value.absent(),
    this.workId = const Value.absent(),
    this.seriesId = const Value.absent(),
    required int userId,
    required DateTime date,
    required String type,
    this.notes = const Value.absent(),
    this.privateNotes = const Value.absent(),
    this.recNotes = const Value.absent(),
  }) : userId = Value(userId),
       date = Value(date),
       type = Value(type);
  static Insertable<DbBookmark> custom({
    Expression<int>? id,
    Expression<int>? workId,
    Expression<int>? seriesId,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<String>? notes,
    Expression<String>? privateNotes,
    Expression<String>? recNotes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workId != null) 'work_id': workId,
      if (seriesId != null) 'series_id': seriesId,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (notes != null) 'notes': notes,
      if (privateNotes != null) 'private_notes': privateNotes,
      if (recNotes != null) 'rec_notes': recNotes,
    });
  }

  DbBookmarksCompanion copyWith({
    Value<int>? id,
    Value<int?>? workId,
    Value<int?>? seriesId,
    Value<int>? userId,
    Value<DateTime>? date,
    Value<String>? type,
    Value<String?>? notes,
    Value<String?>? privateNotes,
    Value<String?>? recNotes,
  }) {
    return DbBookmarksCompanion(
      id: id ?? this.id,
      workId: workId ?? this.workId,
      seriesId: seriesId ?? this.seriesId,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      privateNotes: privateNotes ?? this.privateNotes,
      recNotes: recNotes ?? this.recNotes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (privateNotes.present) {
      map['private_notes'] = Variable<String>(privateNotes.value);
    }
    if (recNotes.present) {
      map['rec_notes'] = Variable<String>(recNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbBookmarksCompanion(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('seriesId: $seriesId, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('privateNotes: $privateNotes, ')
          ..write('recNotes: $recNotes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbWorksTable dbWorks = $DbWorksTable(this);
  late final $DbAuthorsTable dbAuthors = $DbAuthorsTable(this);
  late final $DbWorkAuthorsTable dbWorkAuthors = $DbWorkAuthorsTable(this);
  late final $DbTagsTable dbTags = $DbTagsTable(this);
  late final $DbWorkFandomsTable dbWorkFandoms = $DbWorkFandomsTable(this);
  late final $DbWorkRelationshipsTable dbWorkRelationships =
      $DbWorkRelationshipsTable(this);
  late final $DbWorkCharactersTable dbWorkCharacters = $DbWorkCharactersTable(
    this,
  );
  late final $DbWorkTagsTable dbWorkTags = $DbWorkTagsTable(this);
  late final $DbChaptersTable dbChapters = $DbChaptersTable(this);
  late final $DbReadHistoriesTable dbReadHistories = $DbReadHistoriesTable(
    this,
  );
  late final $DbSeriesTable dbSeries = $DbSeriesTable(this);
  late final $DbWorkSeriesTable dbWorkSeries = $DbWorkSeriesTable(this);
  late final $DbBookmarksTable dbBookmarks = $DbBookmarksTable(this);
  late final WorksDao worksDao = WorksDao(this as AppDatabase);
  late final AuthorsDao authorsDao = AuthorsDao(this as AppDatabase);
  late final TagsDao tagsDao = TagsDao(this as AppDatabase);
  late final ChaptersDao chaptersDao = ChaptersDao(this as AppDatabase);
  late final ReadHistoriesDao readHistoriesDao = ReadHistoriesDao(
    this as AppDatabase,
  );
  late final SeriesDao seriesDao = SeriesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dbWorks,
    dbAuthors,
    dbWorkAuthors,
    dbTags,
    dbWorkFandoms,
    dbWorkRelationships,
    dbWorkCharacters,
    dbWorkTags,
    dbChapters,
    dbReadHistories,
    dbSeries,
    dbWorkSeries,
    dbBookmarks,
  ];
}

typedef $$DbWorksTableCreateCompanionBuilder =
    DbWorksCompanion Function({
      Value<int> id,
      required String title,
      required String summary,
      required bool requiresAuth,
      required DateTime updateDate,
      required int words,
      required int chapters,
      required int comments,
      required int kudos,
      required int bookmarks,
      required int hits,
      Value<int?> totalChapters,
      required String language,
      Value<bool?> finished,
      required String rating,
      required String relationship,
      required String warnings,
      Value<DateTime?> publishDate,
      Value<DateTime?> completedDate,
      Value<String?> notes,
      Value<String?> giftMessage,
      Value<int> subscriptions,
    });
typedef $$DbWorksTableUpdateCompanionBuilder =
    DbWorksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> summary,
      Value<bool> requiresAuth,
      Value<DateTime> updateDate,
      Value<int> words,
      Value<int> chapters,
      Value<int> comments,
      Value<int> kudos,
      Value<int> bookmarks,
      Value<int> hits,
      Value<int?> totalChapters,
      Value<String> language,
      Value<bool?> finished,
      Value<String> rating,
      Value<String> relationship,
      Value<String> warnings,
      Value<DateTime?> publishDate,
      Value<DateTime?> completedDate,
      Value<String?> notes,
      Value<String?> giftMessage,
      Value<int> subscriptions,
    });

final class $$DbWorksTableReferences
    extends BaseReferences<_$AppDatabase, $DbWorksTable, DbWork> {
  $$DbWorksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbWorkAuthorsTable, List<DbWorkAuthor>>
  _dbWorkAuthorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkAuthors,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbWorkAuthors.workId),
  );

  $$DbWorkAuthorsTableProcessedTableManager get dbWorkAuthorsRefs {
    final manager = $$DbWorkAuthorsTableTableManager(
      $_db,
      $_db.dbWorkAuthors,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkAuthorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkFandomsTable, List<DbWorkFandom>>
  _dbWorkFandomsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkFandoms,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbWorkFandoms.workId),
  );

  $$DbWorkFandomsTableProcessedTableManager get dbWorkFandomsRefs {
    final manager = $$DbWorkFandomsTableTableManager(
      $_db,
      $_db.dbWorkFandoms,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkFandomsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DbWorkRelationshipsTable,
    List<DbWorkRelationship>
  >
  _dbWorkRelationshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbWorkRelationships,
        aliasName: $_aliasNameGenerator(
          db.dbWorks.id,
          db.dbWorkRelationships.workId,
        ),
      );

  $$DbWorkRelationshipsTableProcessedTableManager get dbWorkRelationshipsRefs {
    final manager = $$DbWorkRelationshipsTableTableManager(
      $_db,
      $_db.dbWorkRelationships,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbWorkRelationshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkCharactersTable, List<DbWorkCharacter>>
  _dbWorkCharactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkCharacters,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbWorkCharacters.workId),
  );

  $$DbWorkCharactersTableProcessedTableManager get dbWorkCharactersRefs {
    final manager = $$DbWorkCharactersTableTableManager(
      $_db,
      $_db.dbWorkCharacters,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbWorkCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkTagsTable, List<DbWorkTag>>
  _dbWorkTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkTags,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbWorkTags.workId),
  );

  $$DbWorkTagsTableProcessedTableManager get dbWorkTagsRefs {
    final manager = $$DbWorkTagsTableTableManager(
      $_db,
      $_db.dbWorkTags,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbChaptersTable, List<DbChapter>>
  _dbChaptersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbChapters,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbChapters.workId),
  );

  $$DbChaptersTableProcessedTableManager get dbChaptersRefs {
    final manager = $$DbChaptersTableTableManager(
      $_db,
      $_db.dbChapters,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbChaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbReadHistoriesTable, List<DbReadHistory>>
  _dbReadHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbReadHistories,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbReadHistories.workId),
  );

  $$DbReadHistoriesTableProcessedTableManager get dbReadHistoriesRefs {
    final manager = $$DbReadHistoriesTableTableManager(
      $_db,
      $_db.dbReadHistories,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbReadHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkSeriesTable, List<DbWorkSery>>
  _dbWorkSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkSeries,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbWorkSeries.workId),
  );

  $$DbWorkSeriesTableProcessedTableManager get dbWorkSeriesRefs {
    final manager = $$DbWorkSeriesTableTableManager(
      $_db,
      $_db.dbWorkSeries,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkSeriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbBookmarksTable, List<DbBookmark>>
  _dbBookmarksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbBookmarks,
    aliasName: $_aliasNameGenerator(db.dbWorks.id, db.dbBookmarks.workId),
  );

  $$DbBookmarksTableProcessedTableManager get dbBookmarksRefs {
    final manager = $$DbBookmarksTableTableManager(
      $_db,
      $_db.dbBookmarks,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbBookmarksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbWorksTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorksTable> {
  $$DbWorksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapters => $composableBuilder(
    column: $table.chapters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get kudos => $composableBuilder(
    column: $table.kudos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalChapters => $composableBuilder(
    column: $table.totalChapters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warnings => $composableBuilder(
    column: $table.warnings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get giftMessage => $composableBuilder(
    column: $table.giftMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subscriptions => $composableBuilder(
    column: $table.subscriptions,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbWorkAuthorsRefs(
    Expression<bool> Function($$DbWorkAuthorsTableFilterComposer f) f,
  ) {
    final $$DbWorkAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkAuthors,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkFandomsRefs(
    Expression<bool> Function($$DbWorkFandomsTableFilterComposer f) f,
  ) {
    final $$DbWorkFandomsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkFandoms,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkFandomsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkFandoms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkRelationshipsRefs(
    Expression<bool> Function($$DbWorkRelationshipsTableFilterComposer f) f,
  ) {
    final $$DbWorkRelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkRelationships,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkRelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkRelationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkCharactersRefs(
    Expression<bool> Function($$DbWorkCharactersTableFilterComposer f) f,
  ) {
    final $$DbWorkCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkCharacters,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkCharactersTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkTagsRefs(
    Expression<bool> Function($$DbWorkTagsTableFilterComposer f) f,
  ) {
    final $$DbWorkTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkTags,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbChaptersRefs(
    Expression<bool> Function($$DbChaptersTableFilterComposer f) f,
  ) {
    final $$DbChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChapters,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChaptersTableFilterComposer(
            $db: $db,
            $table: $db.dbChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbReadHistoriesRefs(
    Expression<bool> Function($$DbReadHistoriesTableFilterComposer f) f,
  ) {
    final $$DbReadHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbReadHistories,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbReadHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.dbReadHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkSeriesRefs(
    Expression<bool> Function($$DbWorkSeriesTableFilterComposer f) f,
  ) {
    final $$DbWorkSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkSeries,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkSeriesTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbBookmarksRefs(
    Expression<bool> Function($$DbBookmarksTableFilterComposer f) f,
  ) {
    final $$DbBookmarksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableFilterComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbWorksTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorksTable> {
  $$DbWorksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapters => $composableBuilder(
    column: $table.chapters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kudos => $composableBuilder(
    column: $table.kudos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalChapters => $composableBuilder(
    column: $table.totalChapters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warnings => $composableBuilder(
    column: $table.warnings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get giftMessage => $composableBuilder(
    column: $table.giftMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subscriptions => $composableBuilder(
    column: $table.subscriptions,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbWorksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorksTable> {
  $$DbWorksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get words =>
      $composableBuilder(column: $table.words, builder: (column) => column);

  GeneratedColumn<int> get chapters =>
      $composableBuilder(column: $table.chapters, builder: (column) => column);

  GeneratedColumn<int> get comments =>
      $composableBuilder(column: $table.comments, builder: (column) => column);

  GeneratedColumn<int> get kudos =>
      $composableBuilder(column: $table.kudos, builder: (column) => column);

  GeneratedColumn<int> get bookmarks =>
      $composableBuilder(column: $table.bookmarks, builder: (column) => column);

  GeneratedColumn<int> get hits =>
      $composableBuilder(column: $table.hits, builder: (column) => column);

  GeneratedColumn<int> get totalChapters => $composableBuilder(
    column: $table.totalChapters,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<bool> get finished =>
      $composableBuilder(column: $table.finished, builder: (column) => column);

  GeneratedColumn<String> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warnings =>
      $composableBuilder(column: $table.warnings, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get giftMessage => $composableBuilder(
    column: $table.giftMessage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get subscriptions => $composableBuilder(
    column: $table.subscriptions,
    builder: (column) => column,
  );

  Expression<T> dbWorkAuthorsRefs<T extends Object>(
    Expression<T> Function($$DbWorkAuthorsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkAuthors,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkFandomsRefs<T extends Object>(
    Expression<T> Function($$DbWorkFandomsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkFandomsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkFandoms,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkFandomsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkFandoms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkRelationshipsRefs<T extends Object>(
    Expression<T> Function($$DbWorkRelationshipsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkRelationshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dbWorkRelationships,
          getReferencedColumn: (t) => t.workId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbWorkRelationshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbWorkRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dbWorkCharactersRefs<T extends Object>(
    Expression<T> Function($$DbWorkCharactersTableAnnotationComposer a) f,
  ) {
    final $$DbWorkCharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkCharacters,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkCharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkTagsRefs<T extends Object>(
    Expression<T> Function($$DbWorkTagsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkTags,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbChaptersRefs<T extends Object>(
    Expression<T> Function($$DbChaptersTableAnnotationComposer a) f,
  ) {
    final $$DbChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChapters,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbReadHistoriesRefs<T extends Object>(
    Expression<T> Function($$DbReadHistoriesTableAnnotationComposer a) f,
  ) {
    final $$DbReadHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbReadHistories,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbReadHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbReadHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkSeriesRefs<T extends Object>(
    Expression<T> Function($$DbWorkSeriesTableAnnotationComposer a) f,
  ) {
    final $$DbWorkSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkSeries,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbBookmarksRefs<T extends Object>(
    Expression<T> Function($$DbBookmarksTableAnnotationComposer a) f,
  ) {
    final $$DbBookmarksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbWorksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorksTable,
          DbWork,
          $$DbWorksTableFilterComposer,
          $$DbWorksTableOrderingComposer,
          $$DbWorksTableAnnotationComposer,
          $$DbWorksTableCreateCompanionBuilder,
          $$DbWorksTableUpdateCompanionBuilder,
          (DbWork, $$DbWorksTableReferences),
          DbWork,
          PrefetchHooks Function({
            bool dbWorkAuthorsRefs,
            bool dbWorkFandomsRefs,
            bool dbWorkRelationshipsRefs,
            bool dbWorkCharactersRefs,
            bool dbWorkTagsRefs,
            bool dbChaptersRefs,
            bool dbReadHistoriesRefs,
            bool dbWorkSeriesRefs,
            bool dbBookmarksRefs,
          })
        > {
  $$DbWorksTableTableManager(_$AppDatabase db, $DbWorksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<bool> requiresAuth = const Value.absent(),
                Value<DateTime> updateDate = const Value.absent(),
                Value<int> words = const Value.absent(),
                Value<int> chapters = const Value.absent(),
                Value<int> comments = const Value.absent(),
                Value<int> kudos = const Value.absent(),
                Value<int> bookmarks = const Value.absent(),
                Value<int> hits = const Value.absent(),
                Value<int?> totalChapters = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<bool?> finished = const Value.absent(),
                Value<String> rating = const Value.absent(),
                Value<String> relationship = const Value.absent(),
                Value<String> warnings = const Value.absent(),
                Value<DateTime?> publishDate = const Value.absent(),
                Value<DateTime?> completedDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> giftMessage = const Value.absent(),
                Value<int> subscriptions = const Value.absent(),
              }) => DbWorksCompanion(
                id: id,
                title: title,
                summary: summary,
                requiresAuth: requiresAuth,
                updateDate: updateDate,
                words: words,
                chapters: chapters,
                comments: comments,
                kudos: kudos,
                bookmarks: bookmarks,
                hits: hits,
                totalChapters: totalChapters,
                language: language,
                finished: finished,
                rating: rating,
                relationship: relationship,
                warnings: warnings,
                publishDate: publishDate,
                completedDate: completedDate,
                notes: notes,
                giftMessage: giftMessage,
                subscriptions: subscriptions,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String summary,
                required bool requiresAuth,
                required DateTime updateDate,
                required int words,
                required int chapters,
                required int comments,
                required int kudos,
                required int bookmarks,
                required int hits,
                Value<int?> totalChapters = const Value.absent(),
                required String language,
                Value<bool?> finished = const Value.absent(),
                required String rating,
                required String relationship,
                required String warnings,
                Value<DateTime?> publishDate = const Value.absent(),
                Value<DateTime?> completedDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> giftMessage = const Value.absent(),
                Value<int> subscriptions = const Value.absent(),
              }) => DbWorksCompanion.insert(
                id: id,
                title: title,
                summary: summary,
                requiresAuth: requiresAuth,
                updateDate: updateDate,
                words: words,
                chapters: chapters,
                comments: comments,
                kudos: kudos,
                bookmarks: bookmarks,
                hits: hits,
                totalChapters: totalChapters,
                language: language,
                finished: finished,
                rating: rating,
                relationship: relationship,
                warnings: warnings,
                publishDate: publishDate,
                completedDate: completedDate,
                notes: notes,
                giftMessage: giftMessage,
                subscriptions: subscriptions,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dbWorkAuthorsRefs = false,
                dbWorkFandomsRefs = false,
                dbWorkRelationshipsRefs = false,
                dbWorkCharactersRefs = false,
                dbWorkTagsRefs = false,
                dbChaptersRefs = false,
                dbReadHistoriesRefs = false,
                dbWorkSeriesRefs = false,
                dbBookmarksRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbWorkAuthorsRefs) db.dbWorkAuthors,
                    if (dbWorkFandomsRefs) db.dbWorkFandoms,
                    if (dbWorkRelationshipsRefs) db.dbWorkRelationships,
                    if (dbWorkCharactersRefs) db.dbWorkCharacters,
                    if (dbWorkTagsRefs) db.dbWorkTags,
                    if (dbChaptersRefs) db.dbChapters,
                    if (dbReadHistoriesRefs) db.dbReadHistories,
                    if (dbWorkSeriesRefs) db.dbWorkSeries,
                    if (dbBookmarksRefs) db.dbBookmarks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbWorkAuthorsRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkAuthor
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkAuthorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkAuthorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkFandomsRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkFandom
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkFandomsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkFandomsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkRelationshipsRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkRelationship
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkRelationshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkRelationshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkCharactersRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkTagsRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkTag
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbChaptersRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbChapter
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbChaptersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbChaptersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbReadHistoriesRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbReadHistory
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbReadHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbReadHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkSeriesRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbWorkSery
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbWorkSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbBookmarksRefs)
                        await $_getPrefetchedData<
                          DbWork,
                          $DbWorksTable,
                          DbBookmark
                        >(
                          currentTable: table,
                          referencedTable: $$DbWorksTableReferences
                              ._dbBookmarksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbWorksTableReferences(
                                db,
                                table,
                                p0,
                              ).dbBookmarksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbWorksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorksTable,
      DbWork,
      $$DbWorksTableFilterComposer,
      $$DbWorksTableOrderingComposer,
      $$DbWorksTableAnnotationComposer,
      $$DbWorksTableCreateCompanionBuilder,
      $$DbWorksTableUpdateCompanionBuilder,
      (DbWork, $$DbWorksTableReferences),
      DbWork,
      PrefetchHooks Function({
        bool dbWorkAuthorsRefs,
        bool dbWorkFandomsRefs,
        bool dbWorkRelationshipsRefs,
        bool dbWorkCharactersRefs,
        bool dbWorkTagsRefs,
        bool dbChaptersRefs,
        bool dbReadHistoriesRefs,
        bool dbWorkSeriesRefs,
        bool dbBookmarksRefs,
      })
    >;
typedef $$DbAuthorsTableCreateCompanionBuilder =
    DbAuthorsCompanion Function({
      Value<int> id,
      required String name,
      required String pseud,
      Value<String?> imageUrl,
      Value<String?> bio,
      Value<DateTime?> joinDate,
      Value<int?> works,
      Value<int?> series,
      Value<int?> bookmarks,
      Value<int?> collections,
      Value<int?> gifts,
      Value<bool> guest,
    });
typedef $$DbAuthorsTableUpdateCompanionBuilder =
    DbAuthorsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> pseud,
      Value<String?> imageUrl,
      Value<String?> bio,
      Value<DateTime?> joinDate,
      Value<int?> works,
      Value<int?> series,
      Value<int?> bookmarks,
      Value<int?> collections,
      Value<int?> gifts,
      Value<bool> guest,
    });

final class $$DbAuthorsTableReferences
    extends BaseReferences<_$AppDatabase, $DbAuthorsTable, DbAuthor> {
  $$DbAuthorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbWorkAuthorsTable, List<DbWorkAuthor>>
  _dbWorkAuthorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkAuthors,
    aliasName: $_aliasNameGenerator(db.dbAuthors.id, db.dbWorkAuthors.authorId),
  );

  $$DbWorkAuthorsTableProcessedTableManager get dbWorkAuthorsRefs {
    final manager = $$DbWorkAuthorsTableTableManager(
      $_db,
      $_db.dbWorkAuthors,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkAuthorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbBookmarksTable, List<DbBookmark>>
  _dbBookmarksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbBookmarks,
    aliasName: $_aliasNameGenerator(db.dbAuthors.id, db.dbBookmarks.userId),
  );

  $$DbBookmarksTableProcessedTableManager get dbBookmarksRefs {
    final manager = $$DbBookmarksTableTableManager(
      $_db,
      $_db.dbBookmarks,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbBookmarksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbAuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $DbAuthorsTable> {
  $$DbAuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pseud => $composableBuilder(
    column: $table.pseud,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get joinDate => $composableBuilder(
    column: $table.joinDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get works => $composableBuilder(
    column: $table.works,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get series => $composableBuilder(
    column: $table.series,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get collections => $composableBuilder(
    column: $table.collections,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gifts => $composableBuilder(
    column: $table.gifts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get guest => $composableBuilder(
    column: $table.guest,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbWorkAuthorsRefs(
    Expression<bool> Function($$DbWorkAuthorsTableFilterComposer f) f,
  ) {
    final $$DbWorkAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkAuthors,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbBookmarksRefs(
    Expression<bool> Function($$DbBookmarksTableFilterComposer f) f,
  ) {
    final $$DbBookmarksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableFilterComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbAuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbAuthorsTable> {
  $$DbAuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pseud => $composableBuilder(
    column: $table.pseud,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get joinDate => $composableBuilder(
    column: $table.joinDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get works => $composableBuilder(
    column: $table.works,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get series => $composableBuilder(
    column: $table.series,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get collections => $composableBuilder(
    column: $table.collections,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gifts => $composableBuilder(
    column: $table.gifts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get guest => $composableBuilder(
    column: $table.guest,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbAuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbAuthorsTable> {
  $$DbAuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get pseud =>
      $composableBuilder(column: $table.pseud, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<DateTime> get joinDate =>
      $composableBuilder(column: $table.joinDate, builder: (column) => column);

  GeneratedColumn<int> get works =>
      $composableBuilder(column: $table.works, builder: (column) => column);

  GeneratedColumn<int> get series =>
      $composableBuilder(column: $table.series, builder: (column) => column);

  GeneratedColumn<int> get bookmarks =>
      $composableBuilder(column: $table.bookmarks, builder: (column) => column);

  GeneratedColumn<int> get collections => $composableBuilder(
    column: $table.collections,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gifts =>
      $composableBuilder(column: $table.gifts, builder: (column) => column);

  GeneratedColumn<bool> get guest =>
      $composableBuilder(column: $table.guest, builder: (column) => column);

  Expression<T> dbWorkAuthorsRefs<T extends Object>(
    Expression<T> Function($$DbWorkAuthorsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkAuthors,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbBookmarksRefs<T extends Object>(
    Expression<T> Function($$DbBookmarksTableAnnotationComposer a) f,
  ) {
    final $$DbBookmarksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbAuthorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbAuthorsTable,
          DbAuthor,
          $$DbAuthorsTableFilterComposer,
          $$DbAuthorsTableOrderingComposer,
          $$DbAuthorsTableAnnotationComposer,
          $$DbAuthorsTableCreateCompanionBuilder,
          $$DbAuthorsTableUpdateCompanionBuilder,
          (DbAuthor, $$DbAuthorsTableReferences),
          DbAuthor,
          PrefetchHooks Function({bool dbWorkAuthorsRefs, bool dbBookmarksRefs})
        > {
  $$DbAuthorsTableTableManager(_$AppDatabase db, $DbAuthorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbAuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbAuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbAuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> pseud = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<DateTime?> joinDate = const Value.absent(),
                Value<int?> works = const Value.absent(),
                Value<int?> series = const Value.absent(),
                Value<int?> bookmarks = const Value.absent(),
                Value<int?> collections = const Value.absent(),
                Value<int?> gifts = const Value.absent(),
                Value<bool> guest = const Value.absent(),
              }) => DbAuthorsCompanion(
                id: id,
                name: name,
                pseud: pseud,
                imageUrl: imageUrl,
                bio: bio,
                joinDate: joinDate,
                works: works,
                series: series,
                bookmarks: bookmarks,
                collections: collections,
                gifts: gifts,
                guest: guest,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String pseud,
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<DateTime?> joinDate = const Value.absent(),
                Value<int?> works = const Value.absent(),
                Value<int?> series = const Value.absent(),
                Value<int?> bookmarks = const Value.absent(),
                Value<int?> collections = const Value.absent(),
                Value<int?> gifts = const Value.absent(),
                Value<bool> guest = const Value.absent(),
              }) => DbAuthorsCompanion.insert(
                id: id,
                name: name,
                pseud: pseud,
                imageUrl: imageUrl,
                bio: bio,
                joinDate: joinDate,
                works: works,
                series: series,
                bookmarks: bookmarks,
                collections: collections,
                gifts: gifts,
                guest: guest,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbAuthorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dbWorkAuthorsRefs = false, dbBookmarksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbWorkAuthorsRefs) db.dbWorkAuthors,
                    if (dbBookmarksRefs) db.dbBookmarks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbWorkAuthorsRefs)
                        await $_getPrefetchedData<
                          DbAuthor,
                          $DbAuthorsTable,
                          DbWorkAuthor
                        >(
                          currentTable: table,
                          referencedTable: $$DbAuthorsTableReferences
                              ._dbWorkAuthorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbAuthorsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkAuthorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbBookmarksRefs)
                        await $_getPrefetchedData<
                          DbAuthor,
                          $DbAuthorsTable,
                          DbBookmark
                        >(
                          currentTable: table,
                          referencedTable: $$DbAuthorsTableReferences
                              ._dbBookmarksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbAuthorsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbBookmarksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbAuthorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbAuthorsTable,
      DbAuthor,
      $$DbAuthorsTableFilterComposer,
      $$DbAuthorsTableOrderingComposer,
      $$DbAuthorsTableAnnotationComposer,
      $$DbAuthorsTableCreateCompanionBuilder,
      $$DbAuthorsTableUpdateCompanionBuilder,
      (DbAuthor, $$DbAuthorsTableReferences),
      DbAuthor,
      PrefetchHooks Function({bool dbWorkAuthorsRefs, bool dbBookmarksRefs})
    >;
typedef $$DbWorkAuthorsTableCreateCompanionBuilder =
    DbWorkAuthorsCompanion Function({
      required int workId,
      required int authorId,
      Value<int> rowid,
    });
typedef $$DbWorkAuthorsTableUpdateCompanionBuilder =
    DbWorkAuthorsCompanion Function({
      Value<int> workId,
      Value<int> authorId,
      Value<int> rowid,
    });

final class $$DbWorkAuthorsTableReferences
    extends BaseReferences<_$AppDatabase, $DbWorkAuthorsTable, DbWorkAuthor> {
  $$DbWorkAuthorsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkAuthors.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbAuthorsTable _authorIdTable(_$AppDatabase db) =>
      db.dbAuthors.createAlias(
        $_aliasNameGenerator(db.dbWorkAuthors.authorId, db.dbAuthors.id),
      );

  $$DbAuthorsTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$DbAuthorsTableTableManager(
      $_db,
      $_db.dbAuthors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkAuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkAuthorsTable> {
  $$DbWorkAuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableFilterComposer get authorId {
    final $$DbAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkAuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkAuthorsTable> {
  $$DbWorkAuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableOrderingComposer get authorId {
    final $$DbAuthorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableOrderingComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkAuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkAuthorsTable> {
  $$DbWorkAuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableAnnotationComposer get authorId {
    final $$DbAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkAuthorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkAuthorsTable,
          DbWorkAuthor,
          $$DbWorkAuthorsTableFilterComposer,
          $$DbWorkAuthorsTableOrderingComposer,
          $$DbWorkAuthorsTableAnnotationComposer,
          $$DbWorkAuthorsTableCreateCompanionBuilder,
          $$DbWorkAuthorsTableUpdateCompanionBuilder,
          (DbWorkAuthor, $$DbWorkAuthorsTableReferences),
          DbWorkAuthor,
          PrefetchHooks Function({bool workId, bool authorId})
        > {
  $$DbWorkAuthorsTableTableManager(_$AppDatabase db, $DbWorkAuthorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkAuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkAuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorkAuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkAuthorsCompanion(
                workId: workId,
                authorId: authorId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required int authorId,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkAuthorsCompanion.insert(
                workId: workId,
                authorId: authorId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkAuthorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, authorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable: $$DbWorkAuthorsTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$DbWorkAuthorsTableReferences
                                    ._workIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (authorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.authorId,
                                referencedTable: $$DbWorkAuthorsTableReferences
                                    ._authorIdTable(db),
                                referencedColumn: $$DbWorkAuthorsTableReferences
                                    ._authorIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkAuthorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkAuthorsTable,
      DbWorkAuthor,
      $$DbWorkAuthorsTableFilterComposer,
      $$DbWorkAuthorsTableOrderingComposer,
      $$DbWorkAuthorsTableAnnotationComposer,
      $$DbWorkAuthorsTableCreateCompanionBuilder,
      $$DbWorkAuthorsTableUpdateCompanionBuilder,
      (DbWorkAuthor, $$DbWorkAuthorsTableReferences),
      DbWorkAuthor,
      PrefetchHooks Function({bool workId, bool authorId})
    >;
typedef $$DbTagsTableCreateCompanionBuilder =
    DbTagsCompanion Function({
      required String name,
      required String localizedName,
      Value<int> count,
      Value<bool> canonical,
      required String type,
      Value<int> rowid,
    });
typedef $$DbTagsTableUpdateCompanionBuilder =
    DbTagsCompanion Function({
      Value<String> name,
      Value<String> localizedName,
      Value<int> count,
      Value<bool> canonical,
      Value<String> type,
      Value<int> rowid,
    });

final class $$DbTagsTableReferences
    extends BaseReferences<_$AppDatabase, $DbTagsTable, DbTag> {
  $$DbTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbWorkFandomsTable, List<DbWorkFandom>>
  _dbWorkFandomsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkFandoms,
    aliasName: $_aliasNameGenerator(db.dbTags.name, db.dbWorkFandoms.tagName),
  );

  $$DbWorkFandomsTableProcessedTableManager get dbWorkFandomsRefs {
    final manager = $$DbWorkFandomsTableTableManager(
      $_db,
      $_db.dbWorkFandoms,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkFandomsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DbWorkRelationshipsTable,
    List<DbWorkRelationship>
  >
  _dbWorkRelationshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbWorkRelationships,
        aliasName: $_aliasNameGenerator(
          db.dbTags.name,
          db.dbWorkRelationships.tagName,
        ),
      );

  $$DbWorkRelationshipsTableProcessedTableManager get dbWorkRelationshipsRefs {
    final manager = $$DbWorkRelationshipsTableTableManager(
      $_db,
      $_db.dbWorkRelationships,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _dbWorkRelationshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkCharactersTable, List<DbWorkCharacter>>
  _dbWorkCharactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkCharacters,
    aliasName: $_aliasNameGenerator(
      db.dbTags.name,
      db.dbWorkCharacters.tagName,
    ),
  );

  $$DbWorkCharactersTableProcessedTableManager get dbWorkCharactersRefs {
    final manager = $$DbWorkCharactersTableTableManager(
      $_db,
      $_db.dbWorkCharacters,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _dbWorkCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbWorkTagsTable, List<DbWorkTag>>
  _dbWorkTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkTags,
    aliasName: $_aliasNameGenerator(db.dbTags.name, db.dbWorkTags.tagName),
  );

  $$DbWorkTagsTableProcessedTableManager get dbWorkTagsRefs {
    final manager = $$DbWorkTagsTableTableManager(
      $_db,
      $_db.dbWorkTags,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbTagsTableFilterComposer
    extends Composer<_$AppDatabase, $DbTagsTable> {
  $$DbTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localizedName => $composableBuilder(
    column: $table.localizedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get canonical => $composableBuilder(
    column: $table.canonical,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbWorkFandomsRefs(
    Expression<bool> Function($$DbWorkFandomsTableFilterComposer f) f,
  ) {
    final $$DbWorkFandomsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkFandoms,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkFandomsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkFandoms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkRelationshipsRefs(
    Expression<bool> Function($$DbWorkRelationshipsTableFilterComposer f) f,
  ) {
    final $$DbWorkRelationshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkRelationships,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkRelationshipsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkRelationships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkCharactersRefs(
    Expression<bool> Function($$DbWorkCharactersTableFilterComposer f) f,
  ) {
    final $$DbWorkCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkCharacters,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkCharactersTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbWorkTagsRefs(
    Expression<bool> Function($$DbWorkTagsTableFilterComposer f) f,
  ) {
    final $$DbWorkTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkTags,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbTagsTable> {
  $$DbTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localizedName => $composableBuilder(
    column: $table.localizedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get canonical => $composableBuilder(
    column: $table.canonical,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbTagsTable> {
  $$DbTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get localizedName => $composableBuilder(
    column: $table.localizedName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<bool> get canonical =>
      $composableBuilder(column: $table.canonical, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> dbWorkFandomsRefs<T extends Object>(
    Expression<T> Function($$DbWorkFandomsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkFandomsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkFandoms,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkFandomsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkFandoms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkRelationshipsRefs<T extends Object>(
    Expression<T> Function($$DbWorkRelationshipsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkRelationshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.dbWorkRelationships,
          getReferencedColumn: (t) => t.tagName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbWorkRelationshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbWorkRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dbWorkCharactersRefs<T extends Object>(
    Expression<T> Function($$DbWorkCharactersTableAnnotationComposer a) f,
  ) {
    final $$DbWorkCharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkCharacters,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkCharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbWorkTagsRefs<T extends Object>(
    Expression<T> Function($$DbWorkTagsTableAnnotationComposer a) f,
  ) {
    final $$DbWorkTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.dbWorkTags,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbTagsTable,
          DbTag,
          $$DbTagsTableFilterComposer,
          $$DbTagsTableOrderingComposer,
          $$DbTagsTableAnnotationComposer,
          $$DbTagsTableCreateCompanionBuilder,
          $$DbTagsTableUpdateCompanionBuilder,
          (DbTag, $$DbTagsTableReferences),
          DbTag,
          PrefetchHooks Function({
            bool dbWorkFandomsRefs,
            bool dbWorkRelationshipsRefs,
            bool dbWorkCharactersRefs,
            bool dbWorkTagsRefs,
          })
        > {
  $$DbTagsTableTableManager(_$AppDatabase db, $DbTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String> localizedName = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<bool> canonical = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbTagsCompanion(
                name: name,
                localizedName: localizedName,
                count: count,
                canonical: canonical,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required String localizedName,
                Value<int> count = const Value.absent(),
                Value<bool> canonical = const Value.absent(),
                required String type,
                Value<int> rowid = const Value.absent(),
              }) => DbTagsCompanion.insert(
                name: name,
                localizedName: localizedName,
                count: count,
                canonical: canonical,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$DbTagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dbWorkFandomsRefs = false,
                dbWorkRelationshipsRefs = false,
                dbWorkCharactersRefs = false,
                dbWorkTagsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbWorkFandomsRefs) db.dbWorkFandoms,
                    if (dbWorkRelationshipsRefs) db.dbWorkRelationships,
                    if (dbWorkCharactersRefs) db.dbWorkCharacters,
                    if (dbWorkTagsRefs) db.dbWorkTags,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbWorkFandomsRefs)
                        await $_getPrefetchedData<
                          DbTag,
                          $DbTagsTable,
                          DbWorkFandom
                        >(
                          currentTable: table,
                          referencedTable: $$DbTagsTableReferences
                              ._dbWorkFandomsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbTagsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkFandomsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkRelationshipsRefs)
                        await $_getPrefetchedData<
                          DbTag,
                          $DbTagsTable,
                          DbWorkRelationship
                        >(
                          currentTable: table,
                          referencedTable: $$DbTagsTableReferences
                              ._dbWorkRelationshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbTagsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkRelationshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkCharactersRefs)
                        await $_getPrefetchedData<
                          DbTag,
                          $DbTagsTable,
                          DbWorkCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$DbTagsTableReferences
                              ._dbWorkCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbTagsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (dbWorkTagsRefs)
                        await $_getPrefetchedData<
                          DbTag,
                          $DbTagsTable,
                          DbWorkTag
                        >(
                          currentTable: table,
                          referencedTable: $$DbTagsTableReferences
                              ._dbWorkTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbTagsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbTagsTable,
      DbTag,
      $$DbTagsTableFilterComposer,
      $$DbTagsTableOrderingComposer,
      $$DbTagsTableAnnotationComposer,
      $$DbTagsTableCreateCompanionBuilder,
      $$DbTagsTableUpdateCompanionBuilder,
      (DbTag, $$DbTagsTableReferences),
      DbTag,
      PrefetchHooks Function({
        bool dbWorkFandomsRefs,
        bool dbWorkRelationshipsRefs,
        bool dbWorkCharactersRefs,
        bool dbWorkTagsRefs,
      })
    >;
typedef $$DbWorkFandomsTableCreateCompanionBuilder =
    DbWorkFandomsCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$DbWorkFandomsTableUpdateCompanionBuilder =
    DbWorkFandomsCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$DbWorkFandomsTableReferences
    extends BaseReferences<_$AppDatabase, $DbWorkFandomsTable, DbWorkFandom> {
  $$DbWorkFandomsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkFandoms.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbTagsTable _tagNameTable(_$AppDatabase db) => db.dbTags.createAlias(
    $_aliasNameGenerator(db.dbWorkFandoms.tagName, db.dbTags.name),
  );

  $$DbTagsTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$DbTagsTableTableManager(
      $_db,
      $_db.dbTags,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkFandomsTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkFandomsTable> {
  $$DbWorkFandomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableFilterComposer get tagName {
    final $$DbTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkFandomsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkFandomsTable> {
  $$DbWorkFandomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableOrderingComposer get tagName {
    final $$DbTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableOrderingComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkFandomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkFandomsTable> {
  $$DbWorkFandomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableAnnotationComposer get tagName {
    final $$DbTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkFandomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkFandomsTable,
          DbWorkFandom,
          $$DbWorkFandomsTableFilterComposer,
          $$DbWorkFandomsTableOrderingComposer,
          $$DbWorkFandomsTableAnnotationComposer,
          $$DbWorkFandomsTableCreateCompanionBuilder,
          $$DbWorkFandomsTableUpdateCompanionBuilder,
          (DbWorkFandom, $$DbWorkFandomsTableReferences),
          DbWorkFandom,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$DbWorkFandomsTableTableManager(_$AppDatabase db, $DbWorkFandomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkFandomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkFandomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorkFandomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkFandomsCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkFandomsCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkFandomsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, tagName = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable: $$DbWorkFandomsTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$DbWorkFandomsTableReferences
                                    ._workIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagName,
                                referencedTable: $$DbWorkFandomsTableReferences
                                    ._tagNameTable(db),
                                referencedColumn: $$DbWorkFandomsTableReferences
                                    ._tagNameTable(db)
                                    .name,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkFandomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkFandomsTable,
      DbWorkFandom,
      $$DbWorkFandomsTableFilterComposer,
      $$DbWorkFandomsTableOrderingComposer,
      $$DbWorkFandomsTableAnnotationComposer,
      $$DbWorkFandomsTableCreateCompanionBuilder,
      $$DbWorkFandomsTableUpdateCompanionBuilder,
      (DbWorkFandom, $$DbWorkFandomsTableReferences),
      DbWorkFandom,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$DbWorkRelationshipsTableCreateCompanionBuilder =
    DbWorkRelationshipsCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$DbWorkRelationshipsTableUpdateCompanionBuilder =
    DbWorkRelationshipsCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$DbWorkRelationshipsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DbWorkRelationshipsTable,
          DbWorkRelationship
        > {
  $$DbWorkRelationshipsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkRelationships.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbTagsTable _tagNameTable(_$AppDatabase db) => db.dbTags.createAlias(
    $_aliasNameGenerator(db.dbWorkRelationships.tagName, db.dbTags.name),
  );

  $$DbTagsTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$DbTagsTableTableManager(
      $_db,
      $_db.dbTags,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkRelationshipsTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkRelationshipsTable> {
  $$DbWorkRelationshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableFilterComposer get tagName {
    final $$DbTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkRelationshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkRelationshipsTable> {
  $$DbWorkRelationshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableOrderingComposer get tagName {
    final $$DbTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableOrderingComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkRelationshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkRelationshipsTable> {
  $$DbWorkRelationshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableAnnotationComposer get tagName {
    final $$DbTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkRelationshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkRelationshipsTable,
          DbWorkRelationship,
          $$DbWorkRelationshipsTableFilterComposer,
          $$DbWorkRelationshipsTableOrderingComposer,
          $$DbWorkRelationshipsTableAnnotationComposer,
          $$DbWorkRelationshipsTableCreateCompanionBuilder,
          $$DbWorkRelationshipsTableUpdateCompanionBuilder,
          (DbWorkRelationship, $$DbWorkRelationshipsTableReferences),
          DbWorkRelationship,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$DbWorkRelationshipsTableTableManager(
    _$AppDatabase db,
    $DbWorkRelationshipsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkRelationshipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkRelationshipsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DbWorkRelationshipsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkRelationshipsCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkRelationshipsCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkRelationshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, tagName = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable:
                                    $$DbWorkRelationshipsTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$DbWorkRelationshipsTableReferences
                                        ._workIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagName,
                                referencedTable:
                                    $$DbWorkRelationshipsTableReferences
                                        ._tagNameTable(db),
                                referencedColumn:
                                    $$DbWorkRelationshipsTableReferences
                                        ._tagNameTable(db)
                                        .name,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkRelationshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkRelationshipsTable,
      DbWorkRelationship,
      $$DbWorkRelationshipsTableFilterComposer,
      $$DbWorkRelationshipsTableOrderingComposer,
      $$DbWorkRelationshipsTableAnnotationComposer,
      $$DbWorkRelationshipsTableCreateCompanionBuilder,
      $$DbWorkRelationshipsTableUpdateCompanionBuilder,
      (DbWorkRelationship, $$DbWorkRelationshipsTableReferences),
      DbWorkRelationship,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$DbWorkCharactersTableCreateCompanionBuilder =
    DbWorkCharactersCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$DbWorkCharactersTableUpdateCompanionBuilder =
    DbWorkCharactersCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$DbWorkCharactersTableReferences
    extends
        BaseReferences<_$AppDatabase, $DbWorkCharactersTable, DbWorkCharacter> {
  $$DbWorkCharactersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkCharacters.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbTagsTable _tagNameTable(_$AppDatabase db) => db.dbTags.createAlias(
    $_aliasNameGenerator(db.dbWorkCharacters.tagName, db.dbTags.name),
  );

  $$DbTagsTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$DbTagsTableTableManager(
      $_db,
      $_db.dbTags,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkCharactersTable> {
  $$DbWorkCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableFilterComposer get tagName {
    final $$DbTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkCharactersTable> {
  $$DbWorkCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableOrderingComposer get tagName {
    final $$DbTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableOrderingComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkCharactersTable> {
  $$DbWorkCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableAnnotationComposer get tagName {
    final $$DbTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkCharactersTable,
          DbWorkCharacter,
          $$DbWorkCharactersTableFilterComposer,
          $$DbWorkCharactersTableOrderingComposer,
          $$DbWorkCharactersTableAnnotationComposer,
          $$DbWorkCharactersTableCreateCompanionBuilder,
          $$DbWorkCharactersTableUpdateCompanionBuilder,
          (DbWorkCharacter, $$DbWorkCharactersTableReferences),
          DbWorkCharacter,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$DbWorkCharactersTableTableManager(
    _$AppDatabase db,
    $DbWorkCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorkCharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkCharactersCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkCharactersCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkCharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, tagName = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable:
                                    $$DbWorkCharactersTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$DbWorkCharactersTableReferences
                                        ._workIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagName,
                                referencedTable:
                                    $$DbWorkCharactersTableReferences
                                        ._tagNameTable(db),
                                referencedColumn:
                                    $$DbWorkCharactersTableReferences
                                        ._tagNameTable(db)
                                        .name,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkCharactersTable,
      DbWorkCharacter,
      $$DbWorkCharactersTableFilterComposer,
      $$DbWorkCharactersTableOrderingComposer,
      $$DbWorkCharactersTableAnnotationComposer,
      $$DbWorkCharactersTableCreateCompanionBuilder,
      $$DbWorkCharactersTableUpdateCompanionBuilder,
      (DbWorkCharacter, $$DbWorkCharactersTableReferences),
      DbWorkCharacter,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$DbWorkTagsTableCreateCompanionBuilder =
    DbWorkTagsCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$DbWorkTagsTableUpdateCompanionBuilder =
    DbWorkTagsCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$DbWorkTagsTableReferences
    extends BaseReferences<_$AppDatabase, $DbWorkTagsTable, DbWorkTag> {
  $$DbWorkTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkTags.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbTagsTable _tagNameTable(_$AppDatabase db) => db.dbTags.createAlias(
    $_aliasNameGenerator(db.dbWorkTags.tagName, db.dbTags.name),
  );

  $$DbTagsTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$DbTagsTableTableManager(
      $_db,
      $_db.dbTags,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkTagsTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkTagsTable> {
  $$DbWorkTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableFilterComposer get tagName {
    final $$DbTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableFilterComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkTagsTable> {
  $$DbWorkTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableOrderingComposer get tagName {
    final $$DbTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableOrderingComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkTagsTable> {
  $$DbWorkTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbTagsTableAnnotationComposer get tagName {
    final $$DbTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.dbTags,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkTagsTable,
          DbWorkTag,
          $$DbWorkTagsTableFilterComposer,
          $$DbWorkTagsTableOrderingComposer,
          $$DbWorkTagsTableAnnotationComposer,
          $$DbWorkTagsTableCreateCompanionBuilder,
          $$DbWorkTagsTableUpdateCompanionBuilder,
          (DbWorkTag, $$DbWorkTagsTableReferences),
          DbWorkTag,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$DbWorkTagsTableTableManager(_$AppDatabase db, $DbWorkTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorkTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkTagsCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkTagsCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, tagName = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable: $$DbWorkTagsTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$DbWorkTagsTableReferences
                                    ._workIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagName,
                                referencedTable: $$DbWorkTagsTableReferences
                                    ._tagNameTable(db),
                                referencedColumn: $$DbWorkTagsTableReferences
                                    ._tagNameTable(db)
                                    .name,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkTagsTable,
      DbWorkTag,
      $$DbWorkTagsTableFilterComposer,
      $$DbWorkTagsTableOrderingComposer,
      $$DbWorkTagsTableAnnotationComposer,
      $$DbWorkTagsTableCreateCompanionBuilder,
      $$DbWorkTagsTableUpdateCompanionBuilder,
      (DbWorkTag, $$DbWorkTagsTableReferences),
      DbWorkTag,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$DbChaptersTableCreateCompanionBuilder =
    DbChaptersCompanion Function({
      Value<int> id,
      required int workId,
      required int chapter,
      required String title,
      Value<DateTime?> publishDate,
      Value<String?> summary,
      Value<String?> preface,
      Value<String?> postface,
      Value<String?> content,
      Value<int> words,
      Value<int> comments,
      Value<bool> oneshot,
    });
typedef $$DbChaptersTableUpdateCompanionBuilder =
    DbChaptersCompanion Function({
      Value<int> id,
      Value<int> workId,
      Value<int> chapter,
      Value<String> title,
      Value<DateTime?> publishDate,
      Value<String?> summary,
      Value<String?> preface,
      Value<String?> postface,
      Value<String?> content,
      Value<int> words,
      Value<int> comments,
      Value<bool> oneshot,
    });

final class $$DbChaptersTableReferences
    extends BaseReferences<_$AppDatabase, $DbChaptersTable, DbChapter> {
  $$DbChaptersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbChapters.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbReadHistoriesTable, List<DbReadHistory>>
  _dbReadHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbReadHistories,
    aliasName: $_aliasNameGenerator(
      db.dbChapters.id,
      db.dbReadHistories.chapterId,
    ),
  );

  $$DbReadHistoriesTableProcessedTableManager get dbReadHistoriesRefs {
    final manager = $$DbReadHistoriesTableTableManager(
      $_db,
      $_db.dbReadHistories,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbReadHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $DbChaptersTable> {
  $$DbChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapter => $composableBuilder(
    column: $table.chapter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preface => $composableBuilder(
    column: $table.preface,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postface => $composableBuilder(
    column: $table.postface,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get oneshot => $composableBuilder(
    column: $table.oneshot,
    builder: (column) => ColumnFilters(column),
  );

  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbReadHistoriesRefs(
    Expression<bool> Function($$DbReadHistoriesTableFilterComposer f) f,
  ) {
    final $$DbReadHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbReadHistories,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbReadHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.dbReadHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $DbChaptersTable> {
  $$DbChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapter => $composableBuilder(
    column: $table.chapter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preface => $composableBuilder(
    column: $table.preface,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postface => $composableBuilder(
    column: $table.postface,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get comments => $composableBuilder(
    column: $table.comments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get oneshot => $composableBuilder(
    column: $table.oneshot,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbChaptersTable> {
  $$DbChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapter =>
      $composableBuilder(column: $table.chapter, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get preface =>
      $composableBuilder(column: $table.preface, builder: (column) => column);

  GeneratedColumn<String> get postface =>
      $composableBuilder(column: $table.postface, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get words =>
      $composableBuilder(column: $table.words, builder: (column) => column);

  GeneratedColumn<int> get comments =>
      $composableBuilder(column: $table.comments, builder: (column) => column);

  GeneratedColumn<bool> get oneshot =>
      $composableBuilder(column: $table.oneshot, builder: (column) => column);

  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dbReadHistoriesRefs<T extends Object>(
    Expression<T> Function($$DbReadHistoriesTableAnnotationComposer a) f,
  ) {
    final $$DbReadHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbReadHistories,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbReadHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbReadHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChaptersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbChaptersTable,
          DbChapter,
          $$DbChaptersTableFilterComposer,
          $$DbChaptersTableOrderingComposer,
          $$DbChaptersTableAnnotationComposer,
          $$DbChaptersTableCreateCompanionBuilder,
          $$DbChaptersTableUpdateCompanionBuilder,
          (DbChapter, $$DbChaptersTableReferences),
          DbChapter,
          PrefetchHooks Function({bool workId, bool dbReadHistoriesRefs})
        > {
  $$DbChaptersTableTableManager(_$AppDatabase db, $DbChaptersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> workId = const Value.absent(),
                Value<int> chapter = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> preface = const Value.absent(),
                Value<String?> postface = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<int> words = const Value.absent(),
                Value<int> comments = const Value.absent(),
                Value<bool> oneshot = const Value.absent(),
              }) => DbChaptersCompanion(
                id: id,
                workId: workId,
                chapter: chapter,
                title: title,
                publishDate: publishDate,
                summary: summary,
                preface: preface,
                postface: postface,
                content: content,
                words: words,
                comments: comments,
                oneshot: oneshot,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int workId,
                required int chapter,
                required String title,
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> preface = const Value.absent(),
                Value<String?> postface = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<int> words = const Value.absent(),
                Value<int> comments = const Value.absent(),
                Value<bool> oneshot = const Value.absent(),
              }) => DbChaptersCompanion.insert(
                id: id,
                workId: workId,
                chapter: chapter,
                title: title,
                publishDate: publishDate,
                summary: summary,
                preface: preface,
                postface: postface,
                content: content,
                words: words,
                comments: comments,
                oneshot: oneshot,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbChaptersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workId = false, dbReadHistoriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbReadHistoriesRefs) db.dbReadHistories,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workId,
                                    referencedTable: $$DbChaptersTableReferences
                                        ._workIdTable(db),
                                    referencedColumn:
                                        $$DbChaptersTableReferences
                                            ._workIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbReadHistoriesRefs)
                        await $_getPrefetchedData<
                          DbChapter,
                          $DbChaptersTable,
                          DbReadHistory
                        >(
                          currentTable: table,
                          referencedTable: $$DbChaptersTableReferences
                              ._dbReadHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbChaptersTableReferences(
                                db,
                                table,
                                p0,
                              ).dbReadHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chapterId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbChaptersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbChaptersTable,
      DbChapter,
      $$DbChaptersTableFilterComposer,
      $$DbChaptersTableOrderingComposer,
      $$DbChaptersTableAnnotationComposer,
      $$DbChaptersTableCreateCompanionBuilder,
      $$DbChaptersTableUpdateCompanionBuilder,
      (DbChapter, $$DbChaptersTableReferences),
      DbChapter,
      PrefetchHooks Function({bool workId, bool dbReadHistoriesRefs})
    >;
typedef $$DbReadHistoriesTableCreateCompanionBuilder =
    DbReadHistoriesCompanion Function({
      Value<int> workId,
      Value<int?> chapterId,
      required DateTime timestamp,
      required int position,
      required String status,
      required double completion,
      Value<int> hits,
    });
typedef $$DbReadHistoriesTableUpdateCompanionBuilder =
    DbReadHistoriesCompanion Function({
      Value<int> workId,
      Value<int?> chapterId,
      Value<DateTime> timestamp,
      Value<int> position,
      Value<String> status,
      Value<double> completion,
      Value<int> hits,
    });

final class $$DbReadHistoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DbReadHistoriesTable, DbReadHistory> {
  $$DbReadHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbReadHistories.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbChaptersTable _chapterIdTable(_$AppDatabase db) =>
      db.dbChapters.createAlias(
        $_aliasNameGenerator(db.dbReadHistories.chapterId, db.dbChapters.id),
      );

  $$DbChaptersTableProcessedTableManager? get chapterId {
    final $_column = $_itemColumn<int>('chapter_id');
    if ($_column == null) return null;
    final manager = $$DbChaptersTableTableManager(
      $_db,
      $_db.dbChapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbReadHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $DbReadHistoriesTable> {
  $$DbReadHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get completion => $composableBuilder(
    column: $table.completion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnFilters(column),
  );

  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbChaptersTableFilterComposer get chapterId {
    final $$DbChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.dbChapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChaptersTableFilterComposer(
            $db: $db,
            $table: $db.dbChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbReadHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbReadHistoriesTable> {
  $$DbReadHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get completion => $composableBuilder(
    column: $table.completion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbChaptersTableOrderingComposer get chapterId {
    final $$DbChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.dbChapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.dbChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbReadHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbReadHistoriesTable> {
  $$DbReadHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get completion => $composableBuilder(
    column: $table.completion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hits =>
      $composableBuilder(column: $table.hits, builder: (column) => column);

  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbChaptersTableAnnotationComposer get chapterId {
    final $$DbChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.dbChapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbReadHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbReadHistoriesTable,
          DbReadHistory,
          $$DbReadHistoriesTableFilterComposer,
          $$DbReadHistoriesTableOrderingComposer,
          $$DbReadHistoriesTableAnnotationComposer,
          $$DbReadHistoriesTableCreateCompanionBuilder,
          $$DbReadHistoriesTableUpdateCompanionBuilder,
          (DbReadHistory, $$DbReadHistoriesTableReferences),
          DbReadHistory,
          PrefetchHooks Function({bool workId, bool chapterId})
        > {
  $$DbReadHistoriesTableTableManager(
    _$AppDatabase db,
    $DbReadHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbReadHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbReadHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbReadHistoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int?> chapterId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> completion = const Value.absent(),
                Value<int> hits = const Value.absent(),
              }) => DbReadHistoriesCompanion(
                workId: workId,
                chapterId: chapterId,
                timestamp: timestamp,
                position: position,
                status: status,
                completion: completion,
                hits: hits,
              ),
          createCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int?> chapterId = const Value.absent(),
                required DateTime timestamp,
                required int position,
                required String status,
                required double completion,
                Value<int> hits = const Value.absent(),
              }) => DbReadHistoriesCompanion.insert(
                workId: workId,
                chapterId: chapterId,
                timestamp: timestamp,
                position: position,
                status: status,
                completion: completion,
                hits: hits,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbReadHistoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, chapterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable:
                                    $$DbReadHistoriesTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$DbReadHistoriesTableReferences
                                        ._workIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (chapterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.chapterId,
                                referencedTable:
                                    $$DbReadHistoriesTableReferences
                                        ._chapterIdTable(db),
                                referencedColumn:
                                    $$DbReadHistoriesTableReferences
                                        ._chapterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbReadHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbReadHistoriesTable,
      DbReadHistory,
      $$DbReadHistoriesTableFilterComposer,
      $$DbReadHistoriesTableOrderingComposer,
      $$DbReadHistoriesTableAnnotationComposer,
      $$DbReadHistoriesTableCreateCompanionBuilder,
      $$DbReadHistoriesTableUpdateCompanionBuilder,
      (DbReadHistory, $$DbReadHistoriesTableReferences),
      DbReadHistory,
      PrefetchHooks Function({bool workId, bool chapterId})
    >;
typedef $$DbSeriesTableCreateCompanionBuilder =
    DbSeriesCompanion Function({
      Value<int> id,
      required String title,
      Value<String> summary,
      Value<int> words,
      Value<int> works,
      Value<int> bookmarks,
      Value<DateTime?> updateDate,
      Value<bool?> finished,
      Value<DateTime?> publishDate,
      Value<String?> notes,
    });
typedef $$DbSeriesTableUpdateCompanionBuilder =
    DbSeriesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> summary,
      Value<int> words,
      Value<int> works,
      Value<int> bookmarks,
      Value<DateTime?> updateDate,
      Value<bool?> finished,
      Value<DateTime?> publishDate,
      Value<String?> notes,
    });

final class $$DbSeriesTableReferences
    extends BaseReferences<_$AppDatabase, $DbSeriesTable, DbSery> {
  $$DbSeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbWorkSeriesTable, List<DbWorkSery>>
  _dbWorkSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbWorkSeries,
    aliasName: $_aliasNameGenerator(db.dbSeries.id, db.dbWorkSeries.seriesId),
  );

  $$DbWorkSeriesTableProcessedTableManager get dbWorkSeriesRefs {
    final manager = $$DbWorkSeriesTableTableManager(
      $_db,
      $_db.dbWorkSeries,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbWorkSeriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DbBookmarksTable, List<DbBookmark>>
  _dbBookmarksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbBookmarks,
    aliasName: $_aliasNameGenerator(db.dbSeries.id, db.dbBookmarks.seriesId),
  );

  $$DbBookmarksTableProcessedTableManager get dbBookmarksRefs {
    final manager = $$DbBookmarksTableTableManager(
      $_db,
      $_db.dbBookmarks,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbBookmarksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $DbSeriesTable> {
  $$DbSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get works => $composableBuilder(
    column: $table.works,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbWorkSeriesRefs(
    Expression<bool> Function($$DbWorkSeriesTableFilterComposer f) f,
  ) {
    final $$DbWorkSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkSeriesTableFilterComposer(
            $db: $db,
            $table: $db.dbWorkSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dbBookmarksRefs(
    Expression<bool> Function($$DbBookmarksTableFilterComposer f) f,
  ) {
    final $$DbBookmarksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableFilterComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSeriesTable> {
  $$DbSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get words => $composableBuilder(
    column: $table.words,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get works => $composableBuilder(
    column: $table.works,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bookmarks => $composableBuilder(
    column: $table.bookmarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get finished => $composableBuilder(
    column: $table.finished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSeriesTable> {
  $$DbSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<int> get words =>
      $composableBuilder(column: $table.words, builder: (column) => column);

  GeneratedColumn<int> get works =>
      $composableBuilder(column: $table.works, builder: (column) => column);

  GeneratedColumn<int> get bookmarks =>
      $composableBuilder(column: $table.bookmarks, builder: (column) => column);

  GeneratedColumn<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get finished =>
      $composableBuilder(column: $table.finished, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> dbWorkSeriesRefs<T extends Object>(
    Expression<T> Function($$DbWorkSeriesTableAnnotationComposer a) f,
  ) {
    final $$DbWorkSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbWorkSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorkSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorkSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dbBookmarksRefs<T extends Object>(
    Expression<T> Function($$DbBookmarksTableAnnotationComposer a) f,
  ) {
    final $$DbBookmarksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbBookmarks,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBookmarksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSeriesTable,
          DbSery,
          $$DbSeriesTableFilterComposer,
          $$DbSeriesTableOrderingComposer,
          $$DbSeriesTableAnnotationComposer,
          $$DbSeriesTableCreateCompanionBuilder,
          $$DbSeriesTableUpdateCompanionBuilder,
          (DbSery, $$DbSeriesTableReferences),
          DbSery,
          PrefetchHooks Function({bool dbWorkSeriesRefs, bool dbBookmarksRefs})
        > {
  $$DbSeriesTableTableManager(_$AppDatabase db, $DbSeriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<int> words = const Value.absent(),
                Value<int> works = const Value.absent(),
                Value<int> bookmarks = const Value.absent(),
                Value<DateTime?> updateDate = const Value.absent(),
                Value<bool?> finished = const Value.absent(),
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => DbSeriesCompanion(
                id: id,
                title: title,
                summary: summary,
                words: words,
                works: works,
                bookmarks: bookmarks,
                updateDate: updateDate,
                finished: finished,
                publishDate: publishDate,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String> summary = const Value.absent(),
                Value<int> words = const Value.absent(),
                Value<int> works = const Value.absent(),
                Value<int> bookmarks = const Value.absent(),
                Value<DateTime?> updateDate = const Value.absent(),
                Value<bool?> finished = const Value.absent(),
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => DbSeriesCompanion.insert(
                id: id,
                title: title,
                summary: summary,
                words: words,
                works: works,
                bookmarks: bookmarks,
                updateDate: updateDate,
                finished: finished,
                publishDate: publishDate,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSeriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dbWorkSeriesRefs = false, dbBookmarksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbWorkSeriesRefs) db.dbWorkSeries,
                    if (dbBookmarksRefs) db.dbBookmarks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbWorkSeriesRefs)
                        await $_getPrefetchedData<
                          DbSery,
                          $DbSeriesTable,
                          DbWorkSery
                        >(
                          currentTable: table,
                          referencedTable: $$DbSeriesTableReferences
                              ._dbWorkSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbSeriesTableReferences(
                                db,
                                table,
                                p0,
                              ).dbWorkSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.seriesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dbBookmarksRefs)
                        await $_getPrefetchedData<
                          DbSery,
                          $DbSeriesTable,
                          DbBookmark
                        >(
                          currentTable: table,
                          referencedTable: $$DbSeriesTableReferences
                              ._dbBookmarksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbSeriesTableReferences(
                                db,
                                table,
                                p0,
                              ).dbBookmarksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.seriesId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSeriesTable,
      DbSery,
      $$DbSeriesTableFilterComposer,
      $$DbSeriesTableOrderingComposer,
      $$DbSeriesTableAnnotationComposer,
      $$DbSeriesTableCreateCompanionBuilder,
      $$DbSeriesTableUpdateCompanionBuilder,
      (DbSery, $$DbSeriesTableReferences),
      DbSery,
      PrefetchHooks Function({bool dbWorkSeriesRefs, bool dbBookmarksRefs})
    >;
typedef $$DbWorkSeriesTableCreateCompanionBuilder =
    DbWorkSeriesCompanion Function({
      required int workId,
      required int seriesId,
      required int part,
      Value<int> rowid,
    });
typedef $$DbWorkSeriesTableUpdateCompanionBuilder =
    DbWorkSeriesCompanion Function({
      Value<int> workId,
      Value<int> seriesId,
      Value<int> part,
      Value<int> rowid,
    });

final class $$DbWorkSeriesTableReferences
    extends BaseReferences<_$AppDatabase, $DbWorkSeriesTable, DbWorkSery> {
  $$DbWorkSeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbWorkSeries.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbSeriesTable _seriesIdTable(_$AppDatabase db) =>
      db.dbSeries.createAlias(
        $_aliasNameGenerator(db.dbWorkSeries.seriesId, db.dbSeries.id),
      );

  $$DbSeriesTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<int>('series_id')!;

    final manager = $$DbSeriesTableTableManager(
      $_db,
      $_db.dbSeries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbWorkSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $DbWorkSeriesTable> {
  $$DbWorkSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get part => $composableBuilder(
    column: $table.part,
    builder: (column) => ColumnFilters(column),
  );

  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableFilterComposer get seriesId {
    final $$DbSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableFilterComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbWorkSeriesTable> {
  $$DbWorkSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get part => $composableBuilder(
    column: $table.part,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableOrderingComposer get seriesId {
    final $$DbSeriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableOrderingComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbWorkSeriesTable> {
  $$DbWorkSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get part =>
      $composableBuilder(column: $table.part, builder: (column) => column);

  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableAnnotationComposer get seriesId {
    final $$DbSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbWorkSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbWorkSeriesTable,
          DbWorkSery,
          $$DbWorkSeriesTableFilterComposer,
          $$DbWorkSeriesTableOrderingComposer,
          $$DbWorkSeriesTableAnnotationComposer,
          $$DbWorkSeriesTableCreateCompanionBuilder,
          $$DbWorkSeriesTableUpdateCompanionBuilder,
          (DbWorkSery, $$DbWorkSeriesTableReferences),
          DbWorkSery,
          PrefetchHooks Function({bool workId, bool seriesId})
        > {
  $$DbWorkSeriesTableTableManager(_$AppDatabase db, $DbWorkSeriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbWorkSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbWorkSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbWorkSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<int> part = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbWorkSeriesCompanion(
                workId: workId,
                seriesId: seriesId,
                part: part,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required int seriesId,
                required int part,
                Value<int> rowid = const Value.absent(),
              }) => DbWorkSeriesCompanion.insert(
                workId: workId,
                seriesId: seriesId,
                part: part,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbWorkSeriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workId = false, seriesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workId,
                                referencedTable: $$DbWorkSeriesTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$DbWorkSeriesTableReferences
                                    ._workIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (seriesId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.seriesId,
                                referencedTable: $$DbWorkSeriesTableReferences
                                    ._seriesIdTable(db),
                                referencedColumn: $$DbWorkSeriesTableReferences
                                    ._seriesIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbWorkSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbWorkSeriesTable,
      DbWorkSery,
      $$DbWorkSeriesTableFilterComposer,
      $$DbWorkSeriesTableOrderingComposer,
      $$DbWorkSeriesTableAnnotationComposer,
      $$DbWorkSeriesTableCreateCompanionBuilder,
      $$DbWorkSeriesTableUpdateCompanionBuilder,
      (DbWorkSery, $$DbWorkSeriesTableReferences),
      DbWorkSery,
      PrefetchHooks Function({bool workId, bool seriesId})
    >;
typedef $$DbBookmarksTableCreateCompanionBuilder =
    DbBookmarksCompanion Function({
      Value<int> id,
      Value<int?> workId,
      Value<int?> seriesId,
      required int userId,
      required DateTime date,
      required String type,
      Value<String?> notes,
      Value<String?> privateNotes,
      Value<String?> recNotes,
    });
typedef $$DbBookmarksTableUpdateCompanionBuilder =
    DbBookmarksCompanion Function({
      Value<int> id,
      Value<int?> workId,
      Value<int?> seriesId,
      Value<int> userId,
      Value<DateTime> date,
      Value<String> type,
      Value<String?> notes,
      Value<String?> privateNotes,
      Value<String?> recNotes,
    });

final class $$DbBookmarksTableReferences
    extends BaseReferences<_$AppDatabase, $DbBookmarksTable, DbBookmark> {
  $$DbBookmarksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbWorksTable _workIdTable(_$AppDatabase db) => db.dbWorks.createAlias(
    $_aliasNameGenerator(db.dbBookmarks.workId, db.dbWorks.id),
  );

  $$DbWorksTableProcessedTableManager? get workId {
    final $_column = $_itemColumn<int>('work_id');
    if ($_column == null) return null;
    final manager = $$DbWorksTableTableManager(
      $_db,
      $_db.dbWorks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbSeriesTable _seriesIdTable(_$AppDatabase db) =>
      db.dbSeries.createAlias(
        $_aliasNameGenerator(db.dbBookmarks.seriesId, db.dbSeries.id),
      );

  $$DbSeriesTableProcessedTableManager? get seriesId {
    final $_column = $_itemColumn<int>('series_id');
    if ($_column == null) return null;
    final manager = $$DbSeriesTableTableManager(
      $_db,
      $_db.dbSeries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DbAuthorsTable _userIdTable(_$AppDatabase db) =>
      db.dbAuthors.createAlias(
        $_aliasNameGenerator(db.dbBookmarks.userId, db.dbAuthors.id),
      );

  $$DbAuthorsTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$DbAuthorsTableTableManager(
      $_db,
      $_db.dbAuthors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbBookmarksTableFilterComposer
    extends Composer<_$AppDatabase, $DbBookmarksTable> {
  $$DbBookmarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recNotes => $composableBuilder(
    column: $table.recNotes,
    builder: (column) => ColumnFilters(column),
  );

  $$DbWorksTableFilterComposer get workId {
    final $$DbWorksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableFilterComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableFilterComposer get seriesId {
    final $$DbSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableFilterComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableFilterComposer get userId {
    final $$DbAuthorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableFilterComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBookmarksTableOrderingComposer
    extends Composer<_$AppDatabase, $DbBookmarksTable> {
  $$DbBookmarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recNotes => $composableBuilder(
    column: $table.recNotes,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbWorksTableOrderingComposer get workId {
    final $$DbWorksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableOrderingComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableOrderingComposer get seriesId {
    final $$DbSeriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableOrderingComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableOrderingComposer get userId {
    final $$DbAuthorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableOrderingComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBookmarksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbBookmarksTable> {
  $$DbBookmarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recNotes =>
      $composableBuilder(column: $table.recNotes, builder: (column) => column);

  $$DbWorksTableAnnotationComposer get workId {
    final $$DbWorksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.dbWorks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbWorksTableAnnotationComposer(
            $db: $db,
            $table: $db.dbWorks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbSeriesTableAnnotationComposer get seriesId {
    final $$DbSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.dbSeries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DbAuthorsTableAnnotationComposer get userId {
    final $$DbAuthorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.dbAuthors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAuthorsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbAuthors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBookmarksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbBookmarksTable,
          DbBookmark,
          $$DbBookmarksTableFilterComposer,
          $$DbBookmarksTableOrderingComposer,
          $$DbBookmarksTableAnnotationComposer,
          $$DbBookmarksTableCreateCompanionBuilder,
          $$DbBookmarksTableUpdateCompanionBuilder,
          (DbBookmark, $$DbBookmarksTableReferences),
          DbBookmark,
          PrefetchHooks Function({bool workId, bool seriesId, bool userId})
        > {
  $$DbBookmarksTableTableManager(_$AppDatabase db, $DbBookmarksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbBookmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbBookmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbBookmarksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> workId = const Value.absent(),
                Value<int?> seriesId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                Value<String?> recNotes = const Value.absent(),
              }) => DbBookmarksCompanion(
                id: id,
                workId: workId,
                seriesId: seriesId,
                userId: userId,
                date: date,
                type: type,
                notes: notes,
                privateNotes: privateNotes,
                recNotes: recNotes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> workId = const Value.absent(),
                Value<int?> seriesId = const Value.absent(),
                required int userId,
                required DateTime date,
                required String type,
                Value<String?> notes = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                Value<String?> recNotes = const Value.absent(),
              }) => DbBookmarksCompanion.insert(
                id: id,
                workId: workId,
                seriesId: seriesId,
                userId: userId,
                date: date,
                type: type,
                notes: notes,
                privateNotes: privateNotes,
                recNotes: recNotes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbBookmarksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workId = false, seriesId = false, userId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workId,
                                    referencedTable:
                                        $$DbBookmarksTableReferences
                                            ._workIdTable(db),
                                    referencedColumn:
                                        $$DbBookmarksTableReferences
                                            ._workIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (seriesId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.seriesId,
                                    referencedTable:
                                        $$DbBookmarksTableReferences
                                            ._seriesIdTable(db),
                                    referencedColumn:
                                        $$DbBookmarksTableReferences
                                            ._seriesIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$DbBookmarksTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$DbBookmarksTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DbBookmarksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbBookmarksTable,
      DbBookmark,
      $$DbBookmarksTableFilterComposer,
      $$DbBookmarksTableOrderingComposer,
      $$DbBookmarksTableAnnotationComposer,
      $$DbBookmarksTableCreateCompanionBuilder,
      $$DbBookmarksTableUpdateCompanionBuilder,
      (DbBookmark, $$DbBookmarksTableReferences),
      DbBookmark,
      PrefetchHooks Function({bool workId, bool seriesId, bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbWorksTableTableManager get dbWorks =>
      $$DbWorksTableTableManager(_db, _db.dbWorks);
  $$DbAuthorsTableTableManager get dbAuthors =>
      $$DbAuthorsTableTableManager(_db, _db.dbAuthors);
  $$DbWorkAuthorsTableTableManager get dbWorkAuthors =>
      $$DbWorkAuthorsTableTableManager(_db, _db.dbWorkAuthors);
  $$DbTagsTableTableManager get dbTags =>
      $$DbTagsTableTableManager(_db, _db.dbTags);
  $$DbWorkFandomsTableTableManager get dbWorkFandoms =>
      $$DbWorkFandomsTableTableManager(_db, _db.dbWorkFandoms);
  $$DbWorkRelationshipsTableTableManager get dbWorkRelationships =>
      $$DbWorkRelationshipsTableTableManager(_db, _db.dbWorkRelationships);
  $$DbWorkCharactersTableTableManager get dbWorkCharacters =>
      $$DbWorkCharactersTableTableManager(_db, _db.dbWorkCharacters);
  $$DbWorkTagsTableTableManager get dbWorkTags =>
      $$DbWorkTagsTableTableManager(_db, _db.dbWorkTags);
  $$DbChaptersTableTableManager get dbChapters =>
      $$DbChaptersTableTableManager(_db, _db.dbChapters);
  $$DbReadHistoriesTableTableManager get dbReadHistories =>
      $$DbReadHistoriesTableTableManager(_db, _db.dbReadHistories);
  $$DbSeriesTableTableManager get dbSeries =>
      $$DbSeriesTableTableManager(_db, _db.dbSeries);
  $$DbWorkSeriesTableTableManager get dbWorkSeries =>
      $$DbWorkSeriesTableTableManager(_db, _db.dbWorkSeries);
  $$DbBookmarksTableTableManager get dbBookmarks =>
      $$DbBookmarksTableTableManager(_db, _db.dbBookmarks);
}
