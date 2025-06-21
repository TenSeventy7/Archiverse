// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WorksTableTable extends WorksTable
    with TableInfo<$WorksTableTable, WorksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorksTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorksTableData> instance, {
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
  WorksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorksTableData(
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
  $WorksTableTable createAlias(String alias) {
    return $WorksTableTable(attachedDatabase, alias);
  }
}

class WorksTableData extends DataClass implements Insertable<WorksTableData> {
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
  const WorksTableData({
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

  WorksTableCompanion toCompanion(bool nullToAbsent) {
    return WorksTableCompanion(
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

  factory WorksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorksTableData(
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

  WorksTableData copyWith({
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
  }) => WorksTableData(
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
  WorksTableData copyWithCompanion(WorksTableCompanion data) {
    return WorksTableData(
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
    return (StringBuffer('WorksTableData(')
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
      (other is WorksTableData &&
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

class WorksTableCompanion extends UpdateCompanion<WorksTableData> {
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
  const WorksTableCompanion({
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
  WorksTableCompanion.insert({
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
  static Insertable<WorksTableData> custom({
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

  WorksTableCompanion copyWith({
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
    return WorksTableCompanion(
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
    return (StringBuffer('WorksTableCompanion(')
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

class $AuthorsTableTable extends AuthorsTable
    with TableInfo<$AuthorsTableTable, AuthorsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<AuthorsTableData> instance, {
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
  AuthorsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorsTableData(
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
  $AuthorsTableTable createAlias(String alias) {
    return $AuthorsTableTable(attachedDatabase, alias);
  }
}

class AuthorsTableData extends DataClass
    implements Insertable<AuthorsTableData> {
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
  const AuthorsTableData({
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

  AuthorsTableCompanion toCompanion(bool nullToAbsent) {
    return AuthorsTableCompanion(
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

  factory AuthorsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorsTableData(
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

  AuthorsTableData copyWith({
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
  }) => AuthorsTableData(
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
  AuthorsTableData copyWithCompanion(AuthorsTableCompanion data) {
    return AuthorsTableData(
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
    return (StringBuffer('AuthorsTableData(')
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
      (other is AuthorsTableData &&
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

class AuthorsTableCompanion extends UpdateCompanion<AuthorsTableData> {
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
  const AuthorsTableCompanion({
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
  AuthorsTableCompanion.insert({
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
  static Insertable<AuthorsTableData> custom({
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

  AuthorsTableCompanion copyWith({
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
    return AuthorsTableCompanion(
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
    return (StringBuffer('AuthorsTableCompanion(')
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

class $WorkAuthorsTableTable extends WorkAuthorsTable
    with TableInfo<$WorkAuthorsTableTable, WorkAuthorsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkAuthorsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorkAuthorsTableData> instance, {
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
  WorkAuthorsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkAuthorsTableData(
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
  $WorkAuthorsTableTable createAlias(String alias) {
    return $WorkAuthorsTableTable(attachedDatabase, alias);
  }
}

class WorkAuthorsTableData extends DataClass
    implements Insertable<WorkAuthorsTableData> {
  final int workId;
  final int authorId;
  const WorkAuthorsTableData({required this.workId, required this.authorId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['author_id'] = Variable<int>(authorId);
    return map;
  }

  WorkAuthorsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkAuthorsTableCompanion(
      workId: Value(workId),
      authorId: Value(authorId),
    );
  }

  factory WorkAuthorsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkAuthorsTableData(
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

  WorkAuthorsTableData copyWith({int? workId, int? authorId}) =>
      WorkAuthorsTableData(
        workId: workId ?? this.workId,
        authorId: authorId ?? this.authorId,
      );
  WorkAuthorsTableData copyWithCompanion(WorkAuthorsTableCompanion data) {
    return WorkAuthorsTableData(
      workId: data.workId.present ? data.workId.value : this.workId,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkAuthorsTableData(')
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
      (other is WorkAuthorsTableData &&
          other.workId == this.workId &&
          other.authorId == this.authorId);
}

class WorkAuthorsTableCompanion extends UpdateCompanion<WorkAuthorsTableData> {
  final Value<int> workId;
  final Value<int> authorId;
  final Value<int> rowid;
  const WorkAuthorsTableCompanion({
    this.workId = const Value.absent(),
    this.authorId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkAuthorsTableCompanion.insert({
    required int workId,
    required int authorId,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       authorId = Value(authorId);
  static Insertable<WorkAuthorsTableData> custom({
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

  WorkAuthorsTableCompanion copyWith({
    Value<int>? workId,
    Value<int>? authorId,
    Value<int>? rowid,
  }) {
    return WorkAuthorsTableCompanion(
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
    return (StringBuffer('WorkAuthorsTableCompanion(')
          ..write('workId: $workId, ')
          ..write('authorId: $authorId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTableTable extends TagsTable
    with TableInfo<$TagsTableTable, TagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<TagsTableData> instance, {
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
  TagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagsTableData(
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
  $TagsTableTable createAlias(String alias) {
    return $TagsTableTable(attachedDatabase, alias);
  }
}

class TagsTableData extends DataClass implements Insertable<TagsTableData> {
  final String name;
  final String localizedName;
  final int count;
  final bool canonical;
  final String type;
  const TagsTableData({
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

  TagsTableCompanion toCompanion(bool nullToAbsent) {
    return TagsTableCompanion(
      name: Value(name),
      localizedName: Value(localizedName),
      count: Value(count),
      canonical: Value(canonical),
      type: Value(type),
    );
  }

  factory TagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagsTableData(
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

  TagsTableData copyWith({
    String? name,
    String? localizedName,
    int? count,
    bool? canonical,
    String? type,
  }) => TagsTableData(
    name: name ?? this.name,
    localizedName: localizedName ?? this.localizedName,
    count: count ?? this.count,
    canonical: canonical ?? this.canonical,
    type: type ?? this.type,
  );
  TagsTableData copyWithCompanion(TagsTableCompanion data) {
    return TagsTableData(
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
    return (StringBuffer('TagsTableData(')
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
      (other is TagsTableData &&
          other.name == this.name &&
          other.localizedName == this.localizedName &&
          other.count == this.count &&
          other.canonical == this.canonical &&
          other.type == this.type);
}

class TagsTableCompanion extends UpdateCompanion<TagsTableData> {
  final Value<String> name;
  final Value<String> localizedName;
  final Value<int> count;
  final Value<bool> canonical;
  final Value<String> type;
  final Value<int> rowid;
  const TagsTableCompanion({
    this.name = const Value.absent(),
    this.localizedName = const Value.absent(),
    this.count = const Value.absent(),
    this.canonical = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsTableCompanion.insert({
    required String name,
    required String localizedName,
    this.count = const Value.absent(),
    this.canonical = const Value.absent(),
    required String type,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       localizedName = Value(localizedName),
       type = Value(type);
  static Insertable<TagsTableData> custom({
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

  TagsTableCompanion copyWith({
    Value<String>? name,
    Value<String>? localizedName,
    Value<int>? count,
    Value<bool>? canonical,
    Value<String>? type,
    Value<int>? rowid,
  }) {
    return TagsTableCompanion(
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
    return (StringBuffer('TagsTableCompanion(')
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

class $WorkFandomsTableTable extends WorkFandomsTable
    with TableInfo<$WorkFandomsTableTable, WorkFandomsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkFandomsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorkFandomsTableData> instance, {
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
  WorkFandomsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkFandomsTableData(
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
  $WorkFandomsTableTable createAlias(String alias) {
    return $WorkFandomsTableTable(attachedDatabase, alias);
  }
}

class WorkFandomsTableData extends DataClass
    implements Insertable<WorkFandomsTableData> {
  final int workId;
  final String tagName;
  const WorkFandomsTableData({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  WorkFandomsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkFandomsTableCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory WorkFandomsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkFandomsTableData(
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

  WorkFandomsTableData copyWith({int? workId, String? tagName}) =>
      WorkFandomsTableData(
        workId: workId ?? this.workId,
        tagName: tagName ?? this.tagName,
      );
  WorkFandomsTableData copyWithCompanion(WorkFandomsTableCompanion data) {
    return WorkFandomsTableData(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkFandomsTableData(')
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
      (other is WorkFandomsTableData &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class WorkFandomsTableCompanion extends UpdateCompanion<WorkFandomsTableData> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const WorkFandomsTableCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkFandomsTableCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<WorkFandomsTableData> custom({
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

  WorkFandomsTableCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return WorkFandomsTableCompanion(
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
    return (StringBuffer('WorkFandomsTableCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkRelationshipsTableTable extends WorkRelationshipsTable
    with TableInfo<$WorkRelationshipsTableTable, WorkRelationshipsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkRelationshipsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorkRelationshipsTableData> instance, {
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
  WorkRelationshipsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkRelationshipsTableData(
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
  $WorkRelationshipsTableTable createAlias(String alias) {
    return $WorkRelationshipsTableTable(attachedDatabase, alias);
  }
}

class WorkRelationshipsTableData extends DataClass
    implements Insertable<WorkRelationshipsTableData> {
  final int workId;
  final String tagName;
  const WorkRelationshipsTableData({
    required this.workId,
    required this.tagName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  WorkRelationshipsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkRelationshipsTableCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory WorkRelationshipsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkRelationshipsTableData(
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

  WorkRelationshipsTableData copyWith({int? workId, String? tagName}) =>
      WorkRelationshipsTableData(
        workId: workId ?? this.workId,
        tagName: tagName ?? this.tagName,
      );
  WorkRelationshipsTableData copyWithCompanion(
    WorkRelationshipsTableCompanion data,
  ) {
    return WorkRelationshipsTableData(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkRelationshipsTableData(')
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
      (other is WorkRelationshipsTableData &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class WorkRelationshipsTableCompanion
    extends UpdateCompanion<WorkRelationshipsTableData> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const WorkRelationshipsTableCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkRelationshipsTableCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<WorkRelationshipsTableData> custom({
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

  WorkRelationshipsTableCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return WorkRelationshipsTableCompanion(
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
    return (StringBuffer('WorkRelationshipsTableCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkCharactersTableTable extends WorkCharactersTable
    with TableInfo<$WorkCharactersTableTable, WorkCharactersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkCharactersTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorkCharactersTableData> instance, {
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
  WorkCharactersTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkCharactersTableData(
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
  $WorkCharactersTableTable createAlias(String alias) {
    return $WorkCharactersTableTable(attachedDatabase, alias);
  }
}

class WorkCharactersTableData extends DataClass
    implements Insertable<WorkCharactersTableData> {
  final int workId;
  final String tagName;
  const WorkCharactersTableData({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  WorkCharactersTableCompanion toCompanion(bool nullToAbsent) {
    return WorkCharactersTableCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory WorkCharactersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkCharactersTableData(
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

  WorkCharactersTableData copyWith({int? workId, String? tagName}) =>
      WorkCharactersTableData(
        workId: workId ?? this.workId,
        tagName: tagName ?? this.tagName,
      );
  WorkCharactersTableData copyWithCompanion(WorkCharactersTableCompanion data) {
    return WorkCharactersTableData(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkCharactersTableData(')
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
      (other is WorkCharactersTableData &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class WorkCharactersTableCompanion
    extends UpdateCompanion<WorkCharactersTableData> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const WorkCharactersTableCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkCharactersTableCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<WorkCharactersTableData> custom({
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

  WorkCharactersTableCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return WorkCharactersTableCompanion(
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
    return (StringBuffer('WorkCharactersTableCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkTagsTableTable extends WorkTagsTable
    with TableInfo<$WorkTagsTableTable, WorkTagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkTagsTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<WorkTagsTableData> instance, {
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
  WorkTagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkTagsTableData(
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
  $WorkTagsTableTable createAlias(String alias) {
    return $WorkTagsTableTable(attachedDatabase, alias);
  }
}

class WorkTagsTableData extends DataClass
    implements Insertable<WorkTagsTableData> {
  final int workId;
  final String tagName;
  const WorkTagsTableData({required this.workId, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  WorkTagsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkTagsTableCompanion(
      workId: Value(workId),
      tagName: Value(tagName),
    );
  }

  factory WorkTagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkTagsTableData(
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

  WorkTagsTableData copyWith({int? workId, String? tagName}) =>
      WorkTagsTableData(
        workId: workId ?? this.workId,
        tagName: tagName ?? this.tagName,
      );
  WorkTagsTableData copyWithCompanion(WorkTagsTableCompanion data) {
    return WorkTagsTableData(
      workId: data.workId.present ? data.workId.value : this.workId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkTagsTableData(')
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
      (other is WorkTagsTableData &&
          other.workId == this.workId &&
          other.tagName == this.tagName);
}

class WorkTagsTableCompanion extends UpdateCompanion<WorkTagsTableData> {
  final Value<int> workId;
  final Value<String> tagName;
  final Value<int> rowid;
  const WorkTagsTableCompanion({
    this.workId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkTagsTableCompanion.insert({
    required int workId,
    required String tagName,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       tagName = Value(tagName);
  static Insertable<WorkTagsTableData> custom({
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

  WorkTagsTableCompanion copyWith({
    Value<int>? workId,
    Value<String>? tagName,
    Value<int>? rowid,
  }) {
    return WorkTagsTableCompanion(
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
    return (StringBuffer('WorkTagsTableCompanion(')
          ..write('workId: $workId, ')
          ..write('tagName: $tagName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTableTable extends ChaptersTable
    with TableInfo<$ChaptersTableTable, ChaptersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<ChaptersTableData> instance, {
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
  ChaptersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChaptersTableData(
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
  $ChaptersTableTable createAlias(String alias) {
    return $ChaptersTableTable(attachedDatabase, alias);
  }
}

class ChaptersTableData extends DataClass
    implements Insertable<ChaptersTableData> {
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
  const ChaptersTableData({
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

  ChaptersTableCompanion toCompanion(bool nullToAbsent) {
    return ChaptersTableCompanion(
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

  factory ChaptersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChaptersTableData(
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

  ChaptersTableData copyWith({
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
  }) => ChaptersTableData(
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
  ChaptersTableData copyWithCompanion(ChaptersTableCompanion data) {
    return ChaptersTableData(
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
    return (StringBuffer('ChaptersTableData(')
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
      (other is ChaptersTableData &&
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

class ChaptersTableCompanion extends UpdateCompanion<ChaptersTableData> {
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
  const ChaptersTableCompanion({
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
  ChaptersTableCompanion.insert({
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
  static Insertable<ChaptersTableData> custom({
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

  ChaptersTableCompanion copyWith({
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
    return ChaptersTableCompanion(
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
    return (StringBuffer('ChaptersTableCompanion(')
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

class $ReadHistoriesTableTable extends ReadHistoriesTable
    with TableInfo<$ReadHistoriesTableTable, ReadHistoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadHistoriesTableTable(this.attachedDatabase, [this._alias]);
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
    defaultValue: const Constant(0),
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
    Insertable<ReadHistoriesTableData> instance, {
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
  ReadHistoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadHistoriesTableData(
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
  $ReadHistoriesTableTable createAlias(String alias) {
    return $ReadHistoriesTableTable(attachedDatabase, alias);
  }
}

class ReadHistoriesTableData extends DataClass
    implements Insertable<ReadHistoriesTableData> {
  final int workId;
  final int? chapterId;
  final DateTime timestamp;
  final int position;
  final String status;
  final double completion;
  final int hits;
  const ReadHistoriesTableData({
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

  ReadHistoriesTableCompanion toCompanion(bool nullToAbsent) {
    return ReadHistoriesTableCompanion(
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

  factory ReadHistoriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadHistoriesTableData(
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

  ReadHistoriesTableData copyWith({
    int? workId,
    Value<int?> chapterId = const Value.absent(),
    DateTime? timestamp,
    int? position,
    String? status,
    double? completion,
    int? hits,
  }) => ReadHistoriesTableData(
    workId: workId ?? this.workId,
    chapterId: chapterId.present ? chapterId.value : this.chapterId,
    timestamp: timestamp ?? this.timestamp,
    position: position ?? this.position,
    status: status ?? this.status,
    completion: completion ?? this.completion,
    hits: hits ?? this.hits,
  );
  ReadHistoriesTableData copyWithCompanion(ReadHistoriesTableCompanion data) {
    return ReadHistoriesTableData(
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
    return (StringBuffer('ReadHistoriesTableData(')
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
      (other is ReadHistoriesTableData &&
          other.workId == this.workId &&
          other.chapterId == this.chapterId &&
          other.timestamp == this.timestamp &&
          other.position == this.position &&
          other.status == this.status &&
          other.completion == this.completion &&
          other.hits == this.hits);
}

class ReadHistoriesTableCompanion
    extends UpdateCompanion<ReadHistoriesTableData> {
  final Value<int> workId;
  final Value<int?> chapterId;
  final Value<DateTime> timestamp;
  final Value<int> position;
  final Value<String> status;
  final Value<double> completion;
  final Value<int> hits;
  const ReadHistoriesTableCompanion({
    this.workId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.position = const Value.absent(),
    this.status = const Value.absent(),
    this.completion = const Value.absent(),
    this.hits = const Value.absent(),
  });
  ReadHistoriesTableCompanion.insert({
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
  static Insertable<ReadHistoriesTableData> custom({
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

  ReadHistoriesTableCompanion copyWith({
    Value<int>? workId,
    Value<int?>? chapterId,
    Value<DateTime>? timestamp,
    Value<int>? position,
    Value<String>? status,
    Value<double>? completion,
    Value<int>? hits,
  }) {
    return ReadHistoriesTableCompanion(
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
    return (StringBuffer('ReadHistoriesTableCompanion(')
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

class $SeriesTableTable extends SeriesTable
    with TableInfo<$SeriesTableTable, SeriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<SeriesTableData> instance, {
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
  SeriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesTableData(
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
  $SeriesTableTable createAlias(String alias) {
    return $SeriesTableTable(attachedDatabase, alias);
  }
}

class SeriesTableData extends DataClass implements Insertable<SeriesTableData> {
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
  const SeriesTableData({
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

  SeriesTableCompanion toCompanion(bool nullToAbsent) {
    return SeriesTableCompanion(
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

  factory SeriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesTableData(
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

  SeriesTableData copyWith({
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
  }) => SeriesTableData(
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
  SeriesTableData copyWithCompanion(SeriesTableCompanion data) {
    return SeriesTableData(
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
    return (StringBuffer('SeriesTableData(')
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
      (other is SeriesTableData &&
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

class SeriesTableCompanion extends UpdateCompanion<SeriesTableData> {
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
  const SeriesTableCompanion({
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
  SeriesTableCompanion.insert({
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
  static Insertable<SeriesTableData> custom({
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

  SeriesTableCompanion copyWith({
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
    return SeriesTableCompanion(
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
    return (StringBuffer('SeriesTableCompanion(')
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

class $WorkSeriesTable extends WorkSeries
    with TableInfo<$WorkSeriesTable, WorkSery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkSeriesTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'work_series';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkSery> instance, {
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
  WorkSery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkSery(
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
  $WorkSeriesTable createAlias(String alias) {
    return $WorkSeriesTable(attachedDatabase, alias);
  }
}

class WorkSery extends DataClass implements Insertable<WorkSery> {
  final int workId;
  final int seriesId;
  final int part;
  const WorkSery({
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

  WorkSeriesCompanion toCompanion(bool nullToAbsent) {
    return WorkSeriesCompanion(
      workId: Value(workId),
      seriesId: Value(seriesId),
      part: Value(part),
    );
  }

  factory WorkSery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkSery(
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

  WorkSery copyWith({int? workId, int? seriesId, int? part}) => WorkSery(
    workId: workId ?? this.workId,
    seriesId: seriesId ?? this.seriesId,
    part: part ?? this.part,
  );
  WorkSery copyWithCompanion(WorkSeriesCompanion data) {
    return WorkSery(
      workId: data.workId.present ? data.workId.value : this.workId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      part: data.part.present ? data.part.value : this.part,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkSery(')
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
      (other is WorkSery &&
          other.workId == this.workId &&
          other.seriesId == this.seriesId &&
          other.part == this.part);
}

class WorkSeriesCompanion extends UpdateCompanion<WorkSery> {
  final Value<int> workId;
  final Value<int> seriesId;
  final Value<int> part;
  final Value<int> rowid;
  const WorkSeriesCompanion({
    this.workId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.part = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkSeriesCompanion.insert({
    required int workId,
    required int seriesId,
    required int part,
    this.rowid = const Value.absent(),
  }) : workId = Value(workId),
       seriesId = Value(seriesId),
       part = Value(part);
  static Insertable<WorkSery> custom({
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

  WorkSeriesCompanion copyWith({
    Value<int>? workId,
    Value<int>? seriesId,
    Value<int>? part,
    Value<int>? rowid,
  }) {
    return WorkSeriesCompanion(
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
    return (StringBuffer('WorkSeriesCompanion(')
          ..write('workId: $workId, ')
          ..write('seriesId: $seriesId, ')
          ..write('part: $part, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookmarksTableTable extends BookmarksTable
    with TableInfo<$BookmarksTableTable, BookmarksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarksTableTable(this.attachedDatabase, [this._alias]);
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
    Insertable<BookmarksTableData> instance, {
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
  BookmarksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarksTableData(
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
  $BookmarksTableTable createAlias(String alias) {
    return $BookmarksTableTable(attachedDatabase, alias);
  }
}

class BookmarksTableData extends DataClass
    implements Insertable<BookmarksTableData> {
  final int id;
  final int? workId;
  final int? seriesId;
  final int userId;
  final DateTime date;
  final String type;
  final String? notes;
  final String? privateNotes;
  final String? recNotes;
  const BookmarksTableData({
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

  BookmarksTableCompanion toCompanion(bool nullToAbsent) {
    return BookmarksTableCompanion(
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

  factory BookmarksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarksTableData(
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

  BookmarksTableData copyWith({
    int? id,
    Value<int?> workId = const Value.absent(),
    Value<int?> seriesId = const Value.absent(),
    int? userId,
    DateTime? date,
    String? type,
    Value<String?> notes = const Value.absent(),
    Value<String?> privateNotes = const Value.absent(),
    Value<String?> recNotes = const Value.absent(),
  }) => BookmarksTableData(
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
  BookmarksTableData copyWithCompanion(BookmarksTableCompanion data) {
    return BookmarksTableData(
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
    return (StringBuffer('BookmarksTableData(')
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
      (other is BookmarksTableData &&
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

class BookmarksTableCompanion extends UpdateCompanion<BookmarksTableData> {
  final Value<int> id;
  final Value<int?> workId;
  final Value<int?> seriesId;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<String?> notes;
  final Value<String?> privateNotes;
  final Value<String?> recNotes;
  const BookmarksTableCompanion({
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
  BookmarksTableCompanion.insert({
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
  static Insertable<BookmarksTableData> custom({
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

  BookmarksTableCompanion copyWith({
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
    return BookmarksTableCompanion(
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
    return (StringBuffer('BookmarksTableCompanion(')
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
  late final $WorksTableTable worksTable = $WorksTableTable(this);
  late final $AuthorsTableTable authorsTable = $AuthorsTableTable(this);
  late final $WorkAuthorsTableTable workAuthorsTable = $WorkAuthorsTableTable(
    this,
  );
  late final $TagsTableTable tagsTable = $TagsTableTable(this);
  late final $WorkFandomsTableTable workFandomsTable = $WorkFandomsTableTable(
    this,
  );
  late final $WorkRelationshipsTableTable workRelationshipsTable =
      $WorkRelationshipsTableTable(this);
  late final $WorkCharactersTableTable workCharactersTable =
      $WorkCharactersTableTable(this);
  late final $WorkTagsTableTable workTagsTable = $WorkTagsTableTable(this);
  late final $ChaptersTableTable chaptersTable = $ChaptersTableTable(this);
  late final $ReadHistoriesTableTable readHistoriesTable =
      $ReadHistoriesTableTable(this);
  late final $SeriesTableTable seriesTable = $SeriesTableTable(this);
  late final $WorkSeriesTable workSeries = $WorkSeriesTable(this);
  late final $BookmarksTableTable bookmarksTable = $BookmarksTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    worksTable,
    authorsTable,
    workAuthorsTable,
    tagsTable,
    workFandomsTable,
    workRelationshipsTable,
    workCharactersTable,
    workTagsTable,
    chaptersTable,
    readHistoriesTable,
    seriesTable,
    workSeries,
    bookmarksTable,
  ];
}

typedef $$WorksTableTableCreateCompanionBuilder =
    WorksTableCompanion Function({
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
typedef $$WorksTableTableUpdateCompanionBuilder =
    WorksTableCompanion Function({
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

final class $$WorksTableTableReferences
    extends BaseReferences<_$AppDatabase, $WorksTableTable, WorksTableData> {
  $$WorksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkAuthorsTableTable, List<WorkAuthorsTableData>>
  _workAuthorsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workAuthorsTable,
    aliasName: $_aliasNameGenerator(
      db.worksTable.id,
      db.workAuthorsTable.workId,
    ),
  );

  $$WorkAuthorsTableTableProcessedTableManager get workAuthorsTableRefs {
    final manager = $$WorkAuthorsTableTableTableManager(
      $_db,
      $_db.workAuthorsTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workAuthorsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkFandomsTableTable, List<WorkFandomsTableData>>
  _workFandomsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workFandomsTable,
    aliasName: $_aliasNameGenerator(
      db.worksTable.id,
      db.workFandomsTable.workId,
    ),
  );

  $$WorkFandomsTableTableProcessedTableManager get workFandomsTableRefs {
    final manager = $$WorkFandomsTableTableTableManager(
      $_db,
      $_db.workFandomsTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workFandomsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $WorkRelationshipsTableTable,
    List<WorkRelationshipsTableData>
  >
  _workRelationshipsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workRelationshipsTable,
        aliasName: $_aliasNameGenerator(
          db.worksTable.id,
          db.workRelationshipsTable.workId,
        ),
      );

  $$WorkRelationshipsTableTableProcessedTableManager
  get workRelationshipsTableRefs {
    final manager = $$WorkRelationshipsTableTableTableManager(
      $_db,
      $_db.workRelationshipsTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workRelationshipsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $WorkCharactersTableTable,
    List<WorkCharactersTableData>
  >
  _workCharactersTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workCharactersTable,
        aliasName: $_aliasNameGenerator(
          db.worksTable.id,
          db.workCharactersTable.workId,
        ),
      );

  $$WorkCharactersTableTableProcessedTableManager get workCharactersTableRefs {
    final manager = $$WorkCharactersTableTableTableManager(
      $_db,
      $_db.workCharactersTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workCharactersTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkTagsTableTable, List<WorkTagsTableData>>
  _workTagsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workTagsTable,
    aliasName: $_aliasNameGenerator(db.worksTable.id, db.workTagsTable.workId),
  );

  $$WorkTagsTableTableProcessedTableManager get workTagsTableRefs {
    final manager = $$WorkTagsTableTableTableManager(
      $_db,
      $_db.workTagsTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workTagsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChaptersTableTable, List<ChaptersTableData>>
  _chaptersTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.chaptersTable,
    aliasName: $_aliasNameGenerator(db.worksTable.id, db.chaptersTable.workId),
  );

  $$ChaptersTableTableProcessedTableManager get chaptersTableRefs {
    final manager = $$ChaptersTableTableTableManager(
      $_db,
      $_db.chaptersTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chaptersTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReadHistoriesTableTable,
    List<ReadHistoriesTableData>
  >
  _readHistoriesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.readHistoriesTable,
        aliasName: $_aliasNameGenerator(
          db.worksTable.id,
          db.readHistoriesTable.workId,
        ),
      );

  $$ReadHistoriesTableTableProcessedTableManager get readHistoriesTableRefs {
    final manager = $$ReadHistoriesTableTableTableManager(
      $_db,
      $_db.readHistoriesTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _readHistoriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkSeriesTable, List<WorkSery>>
  _workSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workSeries,
    aliasName: $_aliasNameGenerator(db.worksTable.id, db.workSeries.workId),
  );

  $$WorkSeriesTableProcessedTableManager get workSeriesRefs {
    final manager = $$WorkSeriesTableTableManager(
      $_db,
      $_db.workSeries,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workSeriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BookmarksTableTable, List<BookmarksTableData>>
  _bookmarksTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bookmarksTable,
    aliasName: $_aliasNameGenerator(db.worksTable.id, db.bookmarksTable.workId),
  );

  $$BookmarksTableTableProcessedTableManager get bookmarksTableRefs {
    final manager = $$BookmarksTableTableTableManager(
      $_db,
      $_db.bookmarksTable,
    ).filter((f) => f.workId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookmarksTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorksTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableFilterComposer({
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

  Expression<bool> workAuthorsTableRefs(
    Expression<bool> Function($$WorkAuthorsTableTableFilterComposer f) f,
  ) {
    final $$WorkAuthorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workAuthorsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkAuthorsTableTableFilterComposer(
            $db: $db,
            $table: $db.workAuthorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workFandomsTableRefs(
    Expression<bool> Function($$WorkFandomsTableTableFilterComposer f) f,
  ) {
    final $$WorkFandomsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workFandomsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkFandomsTableTableFilterComposer(
            $db: $db,
            $table: $db.workFandomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workRelationshipsTableRefs(
    Expression<bool> Function($$WorkRelationshipsTableTableFilterComposer f) f,
  ) {
    final $$WorkRelationshipsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workRelationshipsTable,
          getReferencedColumn: (t) => t.workId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkRelationshipsTableTableFilterComposer(
                $db: $db,
                $table: $db.workRelationshipsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> workCharactersTableRefs(
    Expression<bool> Function($$WorkCharactersTableTableFilterComposer f) f,
  ) {
    final $$WorkCharactersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workCharactersTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkCharactersTableTableFilterComposer(
            $db: $db,
            $table: $db.workCharactersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workTagsTableRefs(
    Expression<bool> Function($$WorkTagsTableTableFilterComposer f) f,
  ) {
    final $$WorkTagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workTagsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkTagsTableTableFilterComposer(
            $db: $db,
            $table: $db.workTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chaptersTableRefs(
    Expression<bool> Function($$ChaptersTableTableFilterComposer f) f,
  ) {
    final $$ChaptersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chaptersTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableTableFilterComposer(
            $db: $db,
            $table: $db.chaptersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> readHistoriesTableRefs(
    Expression<bool> Function($$ReadHistoriesTableTableFilterComposer f) f,
  ) {
    final $$ReadHistoriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.readHistoriesTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReadHistoriesTableTableFilterComposer(
            $db: $db,
            $table: $db.readHistoriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workSeriesRefs(
    Expression<bool> Function($$WorkSeriesTableFilterComposer f) f,
  ) {
    final $$WorkSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workSeries,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkSeriesTableFilterComposer(
            $db: $db,
            $table: $db.workSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bookmarksTableRefs(
    Expression<bool> Function($$BookmarksTableTableFilterComposer f) f,
  ) {
    final $$BookmarksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableFilterComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableOrderingComposer({
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

class $$WorksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableAnnotationComposer({
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

  Expression<T> workAuthorsTableRefs<T extends Object>(
    Expression<T> Function($$WorkAuthorsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkAuthorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workAuthorsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkAuthorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workAuthorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workFandomsTableRefs<T extends Object>(
    Expression<T> Function($$WorkFandomsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkFandomsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workFandomsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkFandomsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workFandomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workRelationshipsTableRefs<T extends Object>(
    Expression<T> Function($$WorkRelationshipsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkRelationshipsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workRelationshipsTable,
          getReferencedColumn: (t) => t.workId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkRelationshipsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workRelationshipsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workCharactersTableRefs<T extends Object>(
    Expression<T> Function($$WorkCharactersTableTableAnnotationComposer a) f,
  ) {
    final $$WorkCharactersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workCharactersTable,
          getReferencedColumn: (t) => t.workId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkCharactersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workCharactersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workTagsTableRefs<T extends Object>(
    Expression<T> Function($$WorkTagsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkTagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workTagsTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkTagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> chaptersTableRefs<T extends Object>(
    Expression<T> Function($$ChaptersTableTableAnnotationComposer a) f,
  ) {
    final $$ChaptersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chaptersTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.chaptersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> readHistoriesTableRefs<T extends Object>(
    Expression<T> Function($$ReadHistoriesTableTableAnnotationComposer a) f,
  ) {
    final $$ReadHistoriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.readHistoriesTable,
          getReferencedColumn: (t) => t.workId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReadHistoriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.readHistoriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workSeriesRefs<T extends Object>(
    Expression<T> Function($$WorkSeriesTableAnnotationComposer a) f,
  ) {
    final $$WorkSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workSeries,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.workSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bookmarksTableRefs<T extends Object>(
    Expression<T> Function($$BookmarksTableTableAnnotationComposer a) f,
  ) {
    final $$BookmarksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.workId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorksTableTable,
          WorksTableData,
          $$WorksTableTableFilterComposer,
          $$WorksTableTableOrderingComposer,
          $$WorksTableTableAnnotationComposer,
          $$WorksTableTableCreateCompanionBuilder,
          $$WorksTableTableUpdateCompanionBuilder,
          (WorksTableData, $$WorksTableTableReferences),
          WorksTableData,
          PrefetchHooks Function({
            bool workAuthorsTableRefs,
            bool workFandomsTableRefs,
            bool workRelationshipsTableRefs,
            bool workCharactersTableRefs,
            bool workTagsTableRefs,
            bool chaptersTableRefs,
            bool readHistoriesTableRefs,
            bool workSeriesRefs,
            bool bookmarksTableRefs,
          })
        > {
  $$WorksTableTableTableManager(_$AppDatabase db, $WorksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorksTableTableAnnotationComposer($db: db, $table: table),
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
              }) => WorksTableCompanion(
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
              }) => WorksTableCompanion.insert(
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
                  $$WorksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                workAuthorsTableRefs = false,
                workFandomsTableRefs = false,
                workRelationshipsTableRefs = false,
                workCharactersTableRefs = false,
                workTagsTableRefs = false,
                chaptersTableRefs = false,
                readHistoriesTableRefs = false,
                workSeriesRefs = false,
                bookmarksTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workAuthorsTableRefs) db.workAuthorsTable,
                    if (workFandomsTableRefs) db.workFandomsTable,
                    if (workRelationshipsTableRefs) db.workRelationshipsTable,
                    if (workCharactersTableRefs) db.workCharactersTable,
                    if (workTagsTableRefs) db.workTagsTable,
                    if (chaptersTableRefs) db.chaptersTable,
                    if (readHistoriesTableRefs) db.readHistoriesTable,
                    if (workSeriesRefs) db.workSeries,
                    if (bookmarksTableRefs) db.bookmarksTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workAuthorsTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkAuthorsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workAuthorsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workAuthorsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workFandomsTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkFandomsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workFandomsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workFandomsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workRelationshipsTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkRelationshipsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workRelationshipsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workRelationshipsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workCharactersTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkCharactersTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workCharactersTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workCharactersTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workTagsTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkTagsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workTagsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workTagsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chaptersTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          ChaptersTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._chaptersTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).chaptersTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (readHistoriesTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          ReadHistoriesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._readHistoriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).readHistoriesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workSeriesRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          WorkSery
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._workSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bookmarksTableRefs)
                        await $_getPrefetchedData<
                          WorksTableData,
                          $WorksTableTable,
                          BookmarksTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WorksTableTableReferences
                              ._bookmarksTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).bookmarksTableRefs,
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

typedef $$WorksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorksTableTable,
      WorksTableData,
      $$WorksTableTableFilterComposer,
      $$WorksTableTableOrderingComposer,
      $$WorksTableTableAnnotationComposer,
      $$WorksTableTableCreateCompanionBuilder,
      $$WorksTableTableUpdateCompanionBuilder,
      (WorksTableData, $$WorksTableTableReferences),
      WorksTableData,
      PrefetchHooks Function({
        bool workAuthorsTableRefs,
        bool workFandomsTableRefs,
        bool workRelationshipsTableRefs,
        bool workCharactersTableRefs,
        bool workTagsTableRefs,
        bool chaptersTableRefs,
        bool readHistoriesTableRefs,
        bool workSeriesRefs,
        bool bookmarksTableRefs,
      })
    >;
typedef $$AuthorsTableTableCreateCompanionBuilder =
    AuthorsTableCompanion Function({
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
typedef $$AuthorsTableTableUpdateCompanionBuilder =
    AuthorsTableCompanion Function({
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

final class $$AuthorsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $AuthorsTableTable, AuthorsTableData> {
  $$AuthorsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkAuthorsTableTable, List<WorkAuthorsTableData>>
  _workAuthorsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workAuthorsTable,
    aliasName: $_aliasNameGenerator(
      db.authorsTable.id,
      db.workAuthorsTable.authorId,
    ),
  );

  $$WorkAuthorsTableTableProcessedTableManager get workAuthorsTableRefs {
    final manager = $$WorkAuthorsTableTableTableManager(
      $_db,
      $_db.workAuthorsTable,
    ).filter((f) => f.authorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workAuthorsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BookmarksTableTable, List<BookmarksTableData>>
  _bookmarksTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bookmarksTable,
    aliasName: $_aliasNameGenerator(
      db.authorsTable.id,
      db.bookmarksTable.userId,
    ),
  );

  $$BookmarksTableTableProcessedTableManager get bookmarksTableRefs {
    final manager = $$BookmarksTableTableTableManager(
      $_db,
      $_db.bookmarksTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookmarksTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuthorsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorsTableTable> {
  $$AuthorsTableTableFilterComposer({
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

  Expression<bool> workAuthorsTableRefs(
    Expression<bool> Function($$WorkAuthorsTableTableFilterComposer f) f,
  ) {
    final $$WorkAuthorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workAuthorsTable,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkAuthorsTableTableFilterComposer(
            $db: $db,
            $table: $db.workAuthorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bookmarksTableRefs(
    Expression<bool> Function($$BookmarksTableTableFilterComposer f) f,
  ) {
    final $$BookmarksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableFilterComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorsTableTable> {
  $$AuthorsTableTableOrderingComposer({
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

class $$AuthorsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorsTableTable> {
  $$AuthorsTableTableAnnotationComposer({
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

  Expression<T> workAuthorsTableRefs<T extends Object>(
    Expression<T> Function($$WorkAuthorsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkAuthorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workAuthorsTable,
      getReferencedColumn: (t) => t.authorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkAuthorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workAuthorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bookmarksTableRefs<T extends Object>(
    Expression<T> Function($$BookmarksTableTableAnnotationComposer a) f,
  ) {
    final $$BookmarksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuthorsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthorsTableTable,
          AuthorsTableData,
          $$AuthorsTableTableFilterComposer,
          $$AuthorsTableTableOrderingComposer,
          $$AuthorsTableTableAnnotationComposer,
          $$AuthorsTableTableCreateCompanionBuilder,
          $$AuthorsTableTableUpdateCompanionBuilder,
          (AuthorsTableData, $$AuthorsTableTableReferences),
          AuthorsTableData,
          PrefetchHooks Function({
            bool workAuthorsTableRefs,
            bool bookmarksTableRefs,
          })
        > {
  $$AuthorsTableTableTableManager(_$AppDatabase db, $AuthorsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsTableTableAnnotationComposer($db: db, $table: table),
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
              }) => AuthorsTableCompanion(
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
              }) => AuthorsTableCompanion.insert(
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
                  $$AuthorsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workAuthorsTableRefs = false, bookmarksTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workAuthorsTableRefs) db.workAuthorsTable,
                    if (bookmarksTableRefs) db.bookmarksTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workAuthorsTableRefs)
                        await $_getPrefetchedData<
                          AuthorsTableData,
                          $AuthorsTableTable,
                          WorkAuthorsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorsTableTableReferences
                              ._workAuthorsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workAuthorsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.authorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bookmarksTableRefs)
                        await $_getPrefetchedData<
                          AuthorsTableData,
                          $AuthorsTableTable,
                          BookmarksTableData
                        >(
                          currentTable: table,
                          referencedTable: $$AuthorsTableTableReferences
                              ._bookmarksTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AuthorsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).bookmarksTableRefs,
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

typedef $$AuthorsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthorsTableTable,
      AuthorsTableData,
      $$AuthorsTableTableFilterComposer,
      $$AuthorsTableTableOrderingComposer,
      $$AuthorsTableTableAnnotationComposer,
      $$AuthorsTableTableCreateCompanionBuilder,
      $$AuthorsTableTableUpdateCompanionBuilder,
      (AuthorsTableData, $$AuthorsTableTableReferences),
      AuthorsTableData,
      PrefetchHooks Function({
        bool workAuthorsTableRefs,
        bool bookmarksTableRefs,
      })
    >;
typedef $$WorkAuthorsTableTableCreateCompanionBuilder =
    WorkAuthorsTableCompanion Function({
      required int workId,
      required int authorId,
      Value<int> rowid,
    });
typedef $$WorkAuthorsTableTableUpdateCompanionBuilder =
    WorkAuthorsTableCompanion Function({
      Value<int> workId,
      Value<int> authorId,
      Value<int> rowid,
    });

final class $$WorkAuthorsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkAuthorsTableTable,
          WorkAuthorsTableData
        > {
  $$WorkAuthorsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.workAuthorsTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AuthorsTableTable _authorIdTable(_$AppDatabase db) =>
      db.authorsTable.createAlias(
        $_aliasNameGenerator(db.workAuthorsTable.authorId, db.authorsTable.id),
      );

  $$AuthorsTableTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager = $$AuthorsTableTableTableManager(
      $_db,
      $_db.authorsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkAuthorsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkAuthorsTableTable> {
  $$WorkAuthorsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableFilterComposer get authorId {
    final $$AuthorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableFilterComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkAuthorsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkAuthorsTableTable> {
  $$WorkAuthorsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableOrderingComposer get authorId {
    final $$AuthorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkAuthorsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkAuthorsTableTable> {
  $$WorkAuthorsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableAnnotationComposer get authorId {
    final $$AuthorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.authorId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkAuthorsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkAuthorsTableTable,
          WorkAuthorsTableData,
          $$WorkAuthorsTableTableFilterComposer,
          $$WorkAuthorsTableTableOrderingComposer,
          $$WorkAuthorsTableTableAnnotationComposer,
          $$WorkAuthorsTableTableCreateCompanionBuilder,
          $$WorkAuthorsTableTableUpdateCompanionBuilder,
          (WorkAuthorsTableData, $$WorkAuthorsTableTableReferences),
          WorkAuthorsTableData,
          PrefetchHooks Function({bool workId, bool authorId})
        > {
  $$WorkAuthorsTableTableTableManager(
    _$AppDatabase db,
    $WorkAuthorsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkAuthorsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkAuthorsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkAuthorsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int> authorId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkAuthorsTableCompanion(
                workId: workId,
                authorId: authorId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required int authorId,
                Value<int> rowid = const Value.absent(),
              }) => WorkAuthorsTableCompanion.insert(
                workId: workId,
                authorId: authorId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkAuthorsTableTableReferences(db, table, e),
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
                                referencedTable:
                                    $$WorkAuthorsTableTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$WorkAuthorsTableTableReferences
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
                                referencedTable:
                                    $$WorkAuthorsTableTableReferences
                                        ._authorIdTable(db),
                                referencedColumn:
                                    $$WorkAuthorsTableTableReferences
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

typedef $$WorkAuthorsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkAuthorsTableTable,
      WorkAuthorsTableData,
      $$WorkAuthorsTableTableFilterComposer,
      $$WorkAuthorsTableTableOrderingComposer,
      $$WorkAuthorsTableTableAnnotationComposer,
      $$WorkAuthorsTableTableCreateCompanionBuilder,
      $$WorkAuthorsTableTableUpdateCompanionBuilder,
      (WorkAuthorsTableData, $$WorkAuthorsTableTableReferences),
      WorkAuthorsTableData,
      PrefetchHooks Function({bool workId, bool authorId})
    >;
typedef $$TagsTableTableCreateCompanionBuilder =
    TagsTableCompanion Function({
      required String name,
      required String localizedName,
      Value<int> count,
      Value<bool> canonical,
      required String type,
      Value<int> rowid,
    });
typedef $$TagsTableTableUpdateCompanionBuilder =
    TagsTableCompanion Function({
      Value<String> name,
      Value<String> localizedName,
      Value<int> count,
      Value<bool> canonical,
      Value<String> type,
      Value<int> rowid,
    });

final class $$TagsTableTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTableTable, TagsTableData> {
  $$TagsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkFandomsTableTable, List<WorkFandomsTableData>>
  _workFandomsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workFandomsTable,
    aliasName: $_aliasNameGenerator(
      db.tagsTable.name,
      db.workFandomsTable.tagName,
    ),
  );

  $$WorkFandomsTableTableProcessedTableManager get workFandomsTableRefs {
    final manager = $$WorkFandomsTableTableTableManager(
      $_db,
      $_db.workFandomsTable,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _workFandomsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $WorkRelationshipsTableTable,
    List<WorkRelationshipsTableData>
  >
  _workRelationshipsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workRelationshipsTable,
        aliasName: $_aliasNameGenerator(
          db.tagsTable.name,
          db.workRelationshipsTable.tagName,
        ),
      );

  $$WorkRelationshipsTableTableProcessedTableManager
  get workRelationshipsTableRefs {
    final manager = $$WorkRelationshipsTableTableTableManager(
      $_db,
      $_db.workRelationshipsTable,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _workRelationshipsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $WorkCharactersTableTable,
    List<WorkCharactersTableData>
  >
  _workCharactersTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workCharactersTable,
        aliasName: $_aliasNameGenerator(
          db.tagsTable.name,
          db.workCharactersTable.tagName,
        ),
      );

  $$WorkCharactersTableTableProcessedTableManager get workCharactersTableRefs {
    final manager = $$WorkCharactersTableTableTableManager(
      $_db,
      $_db.workCharactersTable,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(
      _workCharactersTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkTagsTableTable, List<WorkTagsTableData>>
  _workTagsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workTagsTable,
    aliasName: $_aliasNameGenerator(
      db.tagsTable.name,
      db.workTagsTable.tagName,
    ),
  );

  $$WorkTagsTableTableProcessedTableManager get workTagsTableRefs {
    final manager = $$WorkTagsTableTableTableManager(
      $_db,
      $_db.workTagsTable,
    ).filter((f) => f.tagName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_workTagsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableFilterComposer({
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

  Expression<bool> workFandomsTableRefs(
    Expression<bool> Function($$WorkFandomsTableTableFilterComposer f) f,
  ) {
    final $$WorkFandomsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.workFandomsTable,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkFandomsTableTableFilterComposer(
            $db: $db,
            $table: $db.workFandomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workRelationshipsTableRefs(
    Expression<bool> Function($$WorkRelationshipsTableTableFilterComposer f) f,
  ) {
    final $$WorkRelationshipsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.workRelationshipsTable,
          getReferencedColumn: (t) => t.tagName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkRelationshipsTableTableFilterComposer(
                $db: $db,
                $table: $db.workRelationshipsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> workCharactersTableRefs(
    Expression<bool> Function($$WorkCharactersTableTableFilterComposer f) f,
  ) {
    final $$WorkCharactersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.workCharactersTable,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkCharactersTableTableFilterComposer(
            $db: $db,
            $table: $db.workCharactersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workTagsTableRefs(
    Expression<bool> Function($$WorkTagsTableTableFilterComposer f) f,
  ) {
    final $$WorkTagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.workTagsTable,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkTagsTableTableFilterComposer(
            $db: $db,
            $table: $db.workTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableOrderingComposer({
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

class $$TagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableAnnotationComposer({
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

  Expression<T> workFandomsTableRefs<T extends Object>(
    Expression<T> Function($$WorkFandomsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkFandomsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.workFandomsTable,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkFandomsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workFandomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workRelationshipsTableRefs<T extends Object>(
    Expression<T> Function($$WorkRelationshipsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkRelationshipsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.workRelationshipsTable,
          getReferencedColumn: (t) => t.tagName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkRelationshipsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workRelationshipsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workCharactersTableRefs<T extends Object>(
    Expression<T> Function($$WorkCharactersTableTableAnnotationComposer a) f,
  ) {
    final $$WorkCharactersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.workCharactersTable,
          getReferencedColumn: (t) => t.tagName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkCharactersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workCharactersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workTagsTableRefs<T extends Object>(
    Expression<T> Function($$WorkTagsTableTableAnnotationComposer a) f,
  ) {
    final $$WorkTagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.workTagsTable,
      getReferencedColumn: (t) => t.tagName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkTagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTableTable,
          TagsTableData,
          $$TagsTableTableFilterComposer,
          $$TagsTableTableOrderingComposer,
          $$TagsTableTableAnnotationComposer,
          $$TagsTableTableCreateCompanionBuilder,
          $$TagsTableTableUpdateCompanionBuilder,
          (TagsTableData, $$TagsTableTableReferences),
          TagsTableData,
          PrefetchHooks Function({
            bool workFandomsTableRefs,
            bool workRelationshipsTableRefs,
            bool workCharactersTableRefs,
            bool workTagsTableRefs,
          })
        > {
  $$TagsTableTableTableManager(_$AppDatabase db, $TagsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String> localizedName = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<bool> canonical = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsTableCompanion(
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
              }) => TagsTableCompanion.insert(
                name: name,
                localizedName: localizedName,
                count: count,
                canonical: canonical,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TagsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                workFandomsTableRefs = false,
                workRelationshipsTableRefs = false,
                workCharactersTableRefs = false,
                workTagsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workFandomsTableRefs) db.workFandomsTable,
                    if (workRelationshipsTableRefs) db.workRelationshipsTable,
                    if (workCharactersTableRefs) db.workCharactersTable,
                    if (workTagsTableRefs) db.workTagsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workFandomsTableRefs)
                        await $_getPrefetchedData<
                          TagsTableData,
                          $TagsTableTable,
                          WorkFandomsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._workFandomsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workFandomsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (workRelationshipsTableRefs)
                        await $_getPrefetchedData<
                          TagsTableData,
                          $TagsTableTable,
                          WorkRelationshipsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._workRelationshipsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workRelationshipsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (workCharactersTableRefs)
                        await $_getPrefetchedData<
                          TagsTableData,
                          $TagsTableTable,
                          WorkCharactersTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._workCharactersTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workCharactersTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tagName == item.name,
                              ),
                          typedResults: items,
                        ),
                      if (workTagsTableRefs)
                        await $_getPrefetchedData<
                          TagsTableData,
                          $TagsTableTable,
                          WorkTagsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._workTagsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workTagsTableRefs,
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

typedef $$TagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTableTable,
      TagsTableData,
      $$TagsTableTableFilterComposer,
      $$TagsTableTableOrderingComposer,
      $$TagsTableTableAnnotationComposer,
      $$TagsTableTableCreateCompanionBuilder,
      $$TagsTableTableUpdateCompanionBuilder,
      (TagsTableData, $$TagsTableTableReferences),
      TagsTableData,
      PrefetchHooks Function({
        bool workFandomsTableRefs,
        bool workRelationshipsTableRefs,
        bool workCharactersTableRefs,
        bool workTagsTableRefs,
      })
    >;
typedef $$WorkFandomsTableTableCreateCompanionBuilder =
    WorkFandomsTableCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$WorkFandomsTableTableUpdateCompanionBuilder =
    WorkFandomsTableCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$WorkFandomsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkFandomsTableTable,
          WorkFandomsTableData
        > {
  $$WorkFandomsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.workFandomsTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagNameTable(_$AppDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(db.workFandomsTable.tagName, db.tagsTable.name),
      );

  $$TagsTableTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkFandomsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkFandomsTableTable> {
  $$WorkFandomsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tagName {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkFandomsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkFandomsTableTable> {
  $$WorkFandomsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tagName {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkFandomsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkFandomsTableTable> {
  $$WorkFandomsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tagName {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkFandomsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkFandomsTableTable,
          WorkFandomsTableData,
          $$WorkFandomsTableTableFilterComposer,
          $$WorkFandomsTableTableOrderingComposer,
          $$WorkFandomsTableTableAnnotationComposer,
          $$WorkFandomsTableTableCreateCompanionBuilder,
          $$WorkFandomsTableTableUpdateCompanionBuilder,
          (WorkFandomsTableData, $$WorkFandomsTableTableReferences),
          WorkFandomsTableData,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$WorkFandomsTableTableTableManager(
    _$AppDatabase db,
    $WorkFandomsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkFandomsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkFandomsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkFandomsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkFandomsTableCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => WorkFandomsTableCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkFandomsTableTableReferences(db, table, e),
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
                                    $$WorkFandomsTableTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$WorkFandomsTableTableReferences
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
                                    $$WorkFandomsTableTableReferences
                                        ._tagNameTable(db),
                                referencedColumn:
                                    $$WorkFandomsTableTableReferences
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

typedef $$WorkFandomsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkFandomsTableTable,
      WorkFandomsTableData,
      $$WorkFandomsTableTableFilterComposer,
      $$WorkFandomsTableTableOrderingComposer,
      $$WorkFandomsTableTableAnnotationComposer,
      $$WorkFandomsTableTableCreateCompanionBuilder,
      $$WorkFandomsTableTableUpdateCompanionBuilder,
      (WorkFandomsTableData, $$WorkFandomsTableTableReferences),
      WorkFandomsTableData,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$WorkRelationshipsTableTableCreateCompanionBuilder =
    WorkRelationshipsTableCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$WorkRelationshipsTableTableUpdateCompanionBuilder =
    WorkRelationshipsTableCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$WorkRelationshipsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkRelationshipsTableTable,
          WorkRelationshipsTableData
        > {
  $$WorkRelationshipsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(
          db.workRelationshipsTable.workId,
          db.worksTable.id,
        ),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagNameTable(_$AppDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(
          db.workRelationshipsTable.tagName,
          db.tagsTable.name,
        ),
      );

  $$TagsTableTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkRelationshipsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkRelationshipsTableTable> {
  $$WorkRelationshipsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tagName {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkRelationshipsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkRelationshipsTableTable> {
  $$WorkRelationshipsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tagName {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkRelationshipsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkRelationshipsTableTable> {
  $$WorkRelationshipsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tagName {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkRelationshipsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkRelationshipsTableTable,
          WorkRelationshipsTableData,
          $$WorkRelationshipsTableTableFilterComposer,
          $$WorkRelationshipsTableTableOrderingComposer,
          $$WorkRelationshipsTableTableAnnotationComposer,
          $$WorkRelationshipsTableTableCreateCompanionBuilder,
          $$WorkRelationshipsTableTableUpdateCompanionBuilder,
          (WorkRelationshipsTableData, $$WorkRelationshipsTableTableReferences),
          WorkRelationshipsTableData,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$WorkRelationshipsTableTableTableManager(
    _$AppDatabase db,
    $WorkRelationshipsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkRelationshipsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WorkRelationshipsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkRelationshipsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkRelationshipsTableCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => WorkRelationshipsTableCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkRelationshipsTableTableReferences(db, table, e),
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
                                    $$WorkRelationshipsTableTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$WorkRelationshipsTableTableReferences
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
                                    $$WorkRelationshipsTableTableReferences
                                        ._tagNameTable(db),
                                referencedColumn:
                                    $$WorkRelationshipsTableTableReferences
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

typedef $$WorkRelationshipsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkRelationshipsTableTable,
      WorkRelationshipsTableData,
      $$WorkRelationshipsTableTableFilterComposer,
      $$WorkRelationshipsTableTableOrderingComposer,
      $$WorkRelationshipsTableTableAnnotationComposer,
      $$WorkRelationshipsTableTableCreateCompanionBuilder,
      $$WorkRelationshipsTableTableUpdateCompanionBuilder,
      (WorkRelationshipsTableData, $$WorkRelationshipsTableTableReferences),
      WorkRelationshipsTableData,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$WorkCharactersTableTableCreateCompanionBuilder =
    WorkCharactersTableCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$WorkCharactersTableTableUpdateCompanionBuilder =
    WorkCharactersTableCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$WorkCharactersTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkCharactersTableTable,
          WorkCharactersTableData
        > {
  $$WorkCharactersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.workCharactersTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagNameTable(_$AppDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(db.workCharactersTable.tagName, db.tagsTable.name),
      );

  $$TagsTableTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkCharactersTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkCharactersTableTable> {
  $$WorkCharactersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tagName {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkCharactersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkCharactersTableTable> {
  $$WorkCharactersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tagName {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkCharactersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkCharactersTableTable> {
  $$WorkCharactersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tagName {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkCharactersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkCharactersTableTable,
          WorkCharactersTableData,
          $$WorkCharactersTableTableFilterComposer,
          $$WorkCharactersTableTableOrderingComposer,
          $$WorkCharactersTableTableAnnotationComposer,
          $$WorkCharactersTableTableCreateCompanionBuilder,
          $$WorkCharactersTableTableUpdateCompanionBuilder,
          (WorkCharactersTableData, $$WorkCharactersTableTableReferences),
          WorkCharactersTableData,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$WorkCharactersTableTableTableManager(
    _$AppDatabase db,
    $WorkCharactersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkCharactersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkCharactersTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkCharactersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkCharactersTableCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => WorkCharactersTableCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkCharactersTableTableReferences(db, table, e),
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
                                    $$WorkCharactersTableTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$WorkCharactersTableTableReferences
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
                                    $$WorkCharactersTableTableReferences
                                        ._tagNameTable(db),
                                referencedColumn:
                                    $$WorkCharactersTableTableReferences
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

typedef $$WorkCharactersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkCharactersTableTable,
      WorkCharactersTableData,
      $$WorkCharactersTableTableFilterComposer,
      $$WorkCharactersTableTableOrderingComposer,
      $$WorkCharactersTableTableAnnotationComposer,
      $$WorkCharactersTableTableCreateCompanionBuilder,
      $$WorkCharactersTableTableUpdateCompanionBuilder,
      (WorkCharactersTableData, $$WorkCharactersTableTableReferences),
      WorkCharactersTableData,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$WorkTagsTableTableCreateCompanionBuilder =
    WorkTagsTableCompanion Function({
      required int workId,
      required String tagName,
      Value<int> rowid,
    });
typedef $$WorkTagsTableTableUpdateCompanionBuilder =
    WorkTagsTableCompanion Function({
      Value<int> workId,
      Value<String> tagName,
      Value<int> rowid,
    });

final class $$WorkTagsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkTagsTableTable, WorkTagsTableData> {
  $$WorkTagsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.workTagsTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagNameTable(_$AppDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(db.workTagsTable.tagName, db.tagsTable.name),
      );

  $$TagsTableTableProcessedTableManager get tagName {
    final $_column = $_itemColumn<String>('tag_name')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkTagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkTagsTableTable> {
  $$WorkTagsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tagName {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkTagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkTagsTableTable> {
  $$WorkTagsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tagName {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkTagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkTagsTableTable> {
  $$WorkTagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tagName {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagName,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkTagsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkTagsTableTable,
          WorkTagsTableData,
          $$WorkTagsTableTableFilterComposer,
          $$WorkTagsTableTableOrderingComposer,
          $$WorkTagsTableTableAnnotationComposer,
          $$WorkTagsTableTableCreateCompanionBuilder,
          $$WorkTagsTableTableUpdateCompanionBuilder,
          (WorkTagsTableData, $$WorkTagsTableTableReferences),
          WorkTagsTableData,
          PrefetchHooks Function({bool workId, bool tagName})
        > {
  $$WorkTagsTableTableTableManager(_$AppDatabase db, $WorkTagsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkTagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkTagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkTagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkTagsTableCompanion(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int workId,
                required String tagName,
                Value<int> rowid = const Value.absent(),
              }) => WorkTagsTableCompanion.insert(
                workId: workId,
                tagName: tagName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkTagsTableTableReferences(db, table, e),
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
                                referencedTable: $$WorkTagsTableTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$WorkTagsTableTableReferences
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
                                referencedTable: $$WorkTagsTableTableReferences
                                    ._tagNameTable(db),
                                referencedColumn: $$WorkTagsTableTableReferences
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

typedef $$WorkTagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkTagsTableTable,
      WorkTagsTableData,
      $$WorkTagsTableTableFilterComposer,
      $$WorkTagsTableTableOrderingComposer,
      $$WorkTagsTableTableAnnotationComposer,
      $$WorkTagsTableTableCreateCompanionBuilder,
      $$WorkTagsTableTableUpdateCompanionBuilder,
      (WorkTagsTableData, $$WorkTagsTableTableReferences),
      WorkTagsTableData,
      PrefetchHooks Function({bool workId, bool tagName})
    >;
typedef $$ChaptersTableTableCreateCompanionBuilder =
    ChaptersTableCompanion Function({
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
typedef $$ChaptersTableTableUpdateCompanionBuilder =
    ChaptersTableCompanion Function({
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

final class $$ChaptersTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ChaptersTableTable, ChaptersTableData> {
  $$ChaptersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.chaptersTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ReadHistoriesTableTable,
    List<ReadHistoriesTableData>
  >
  _readHistoriesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.readHistoriesTable,
        aliasName: $_aliasNameGenerator(
          db.chaptersTable.id,
          db.readHistoriesTable.chapterId,
        ),
      );

  $$ReadHistoriesTableTableProcessedTableManager get readHistoriesTableRefs {
    final manager = $$ReadHistoriesTableTableTableManager(
      $_db,
      $_db.readHistoriesTable,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _readHistoriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChaptersTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChaptersTableTable> {
  $$ChaptersTableTableFilterComposer({
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

  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> readHistoriesTableRefs(
    Expression<bool> Function($$ReadHistoriesTableTableFilterComposer f) f,
  ) {
    final $$ReadHistoriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.readHistoriesTable,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReadHistoriesTableTableFilterComposer(
            $db: $db,
            $table: $db.readHistoriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChaptersTableTable> {
  $$ChaptersTableTableOrderingComposer({
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

  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChaptersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChaptersTableTable> {
  $$ChaptersTableTableAnnotationComposer({
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

  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> readHistoriesTableRefs<T extends Object>(
    Expression<T> Function($$ReadHistoriesTableTableAnnotationComposer a) f,
  ) {
    final $$ReadHistoriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.readHistoriesTable,
          getReferencedColumn: (t) => t.chapterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReadHistoriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.readHistoriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ChaptersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChaptersTableTable,
          ChaptersTableData,
          $$ChaptersTableTableFilterComposer,
          $$ChaptersTableTableOrderingComposer,
          $$ChaptersTableTableAnnotationComposer,
          $$ChaptersTableTableCreateCompanionBuilder,
          $$ChaptersTableTableUpdateCompanionBuilder,
          (ChaptersTableData, $$ChaptersTableTableReferences),
          ChaptersTableData,
          PrefetchHooks Function({bool workId, bool readHistoriesTableRefs})
        > {
  $$ChaptersTableTableTableManager(_$AppDatabase db, $ChaptersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChaptersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChaptersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChaptersTableTableAnnotationComposer($db: db, $table: table),
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
              }) => ChaptersTableCompanion(
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
              }) => ChaptersTableCompanion.insert(
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
                  $$ChaptersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workId = false, readHistoriesTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (readHistoriesTableRefs) db.readHistoriesTable,
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
                                    referencedTable:
                                        $$ChaptersTableTableReferences
                                            ._workIdTable(db),
                                    referencedColumn:
                                        $$ChaptersTableTableReferences
                                            ._workIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (readHistoriesTableRefs)
                        await $_getPrefetchedData<
                          ChaptersTableData,
                          $ChaptersTableTable,
                          ReadHistoriesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ChaptersTableTableReferences
                              ._readHistoriesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChaptersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).readHistoriesTableRefs,
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

typedef $$ChaptersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChaptersTableTable,
      ChaptersTableData,
      $$ChaptersTableTableFilterComposer,
      $$ChaptersTableTableOrderingComposer,
      $$ChaptersTableTableAnnotationComposer,
      $$ChaptersTableTableCreateCompanionBuilder,
      $$ChaptersTableTableUpdateCompanionBuilder,
      (ChaptersTableData, $$ChaptersTableTableReferences),
      ChaptersTableData,
      PrefetchHooks Function({bool workId, bool readHistoriesTableRefs})
    >;
typedef $$ReadHistoriesTableTableCreateCompanionBuilder =
    ReadHistoriesTableCompanion Function({
      Value<int> workId,
      Value<int?> chapterId,
      required DateTime timestamp,
      required int position,
      required String status,
      required double completion,
      Value<int> hits,
    });
typedef $$ReadHistoriesTableTableUpdateCompanionBuilder =
    ReadHistoriesTableCompanion Function({
      Value<int> workId,
      Value<int?> chapterId,
      Value<DateTime> timestamp,
      Value<int> position,
      Value<String> status,
      Value<double> completion,
      Value<int> hits,
    });

final class $$ReadHistoriesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReadHistoriesTableTable,
          ReadHistoriesTableData
        > {
  $$ReadHistoriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.readHistoriesTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChaptersTableTable _chapterIdTable(_$AppDatabase db) =>
      db.chaptersTable.createAlias(
        $_aliasNameGenerator(
          db.readHistoriesTable.chapterId,
          db.chaptersTable.id,
        ),
      );

  $$ChaptersTableTableProcessedTableManager? get chapterId {
    final $_column = $_itemColumn<int>('chapter_id');
    if ($_column == null) return null;
    final manager = $$ChaptersTableTableTableManager(
      $_db,
      $_db.chaptersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReadHistoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReadHistoriesTableTable> {
  $$ReadHistoriesTableTableFilterComposer({
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

  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableTableFilterComposer get chapterId {
    final $$ChaptersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chaptersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableTableFilterComposer(
            $db: $db,
            $table: $db.chaptersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReadHistoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadHistoriesTableTable> {
  $$ReadHistoriesTableTableOrderingComposer({
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

  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableTableOrderingComposer get chapterId {
    final $$ChaptersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chaptersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableTableOrderingComposer(
            $db: $db,
            $table: $db.chaptersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReadHistoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadHistoriesTableTable> {
  $$ReadHistoriesTableTableAnnotationComposer({
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

  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableTableAnnotationComposer get chapterId {
    final $$ChaptersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chaptersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.chaptersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReadHistoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadHistoriesTableTable,
          ReadHistoriesTableData,
          $$ReadHistoriesTableTableFilterComposer,
          $$ReadHistoriesTableTableOrderingComposer,
          $$ReadHistoriesTableTableAnnotationComposer,
          $$ReadHistoriesTableTableCreateCompanionBuilder,
          $$ReadHistoriesTableTableUpdateCompanionBuilder,
          (ReadHistoriesTableData, $$ReadHistoriesTableTableReferences),
          ReadHistoriesTableData,
          PrefetchHooks Function({bool workId, bool chapterId})
        > {
  $$ReadHistoriesTableTableTableManager(
    _$AppDatabase db,
    $ReadHistoriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadHistoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadHistoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadHistoriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int?> chapterId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> completion = const Value.absent(),
                Value<int> hits = const Value.absent(),
              }) => ReadHistoriesTableCompanion(
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
              }) => ReadHistoriesTableCompanion.insert(
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
                  $$ReadHistoriesTableTableReferences(db, table, e),
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
                                    $$ReadHistoriesTableTableReferences
                                        ._workIdTable(db),
                                referencedColumn:
                                    $$ReadHistoriesTableTableReferences
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
                                    $$ReadHistoriesTableTableReferences
                                        ._chapterIdTable(db),
                                referencedColumn:
                                    $$ReadHistoriesTableTableReferences
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

typedef $$ReadHistoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadHistoriesTableTable,
      ReadHistoriesTableData,
      $$ReadHistoriesTableTableFilterComposer,
      $$ReadHistoriesTableTableOrderingComposer,
      $$ReadHistoriesTableTableAnnotationComposer,
      $$ReadHistoriesTableTableCreateCompanionBuilder,
      $$ReadHistoriesTableTableUpdateCompanionBuilder,
      (ReadHistoriesTableData, $$ReadHistoriesTableTableReferences),
      ReadHistoriesTableData,
      PrefetchHooks Function({bool workId, bool chapterId})
    >;
typedef $$SeriesTableTableCreateCompanionBuilder =
    SeriesTableCompanion Function({
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
typedef $$SeriesTableTableUpdateCompanionBuilder =
    SeriesTableCompanion Function({
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

final class $$SeriesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesTableTable, SeriesTableData> {
  $$SeriesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkSeriesTable, List<WorkSery>>
  _workSeriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workSeries,
    aliasName: $_aliasNameGenerator(db.seriesTable.id, db.workSeries.seriesId),
  );

  $$WorkSeriesTableProcessedTableManager get workSeriesRefs {
    final manager = $$WorkSeriesTableTableManager(
      $_db,
      $_db.workSeries,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workSeriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BookmarksTableTable, List<BookmarksTableData>>
  _bookmarksTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bookmarksTable,
    aliasName: $_aliasNameGenerator(
      db.seriesTable.id,
      db.bookmarksTable.seriesId,
    ),
  );

  $$BookmarksTableTableProcessedTableManager get bookmarksTableRefs {
    final manager = $$BookmarksTableTableTableManager(
      $_db,
      $_db.bookmarksTable,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookmarksTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableFilterComposer({
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

  Expression<bool> workSeriesRefs(
    Expression<bool> Function($$WorkSeriesTableFilterComposer f) f,
  ) {
    final $$WorkSeriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkSeriesTableFilterComposer(
            $db: $db,
            $table: $db.workSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bookmarksTableRefs(
    Expression<bool> Function($$BookmarksTableTableFilterComposer f) f,
  ) {
    final $$BookmarksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableFilterComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableOrderingComposer({
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

class $$SeriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableAnnotationComposer({
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

  Expression<T> workSeriesRefs<T extends Object>(
    Expression<T> Function($$WorkSeriesTableAnnotationComposer a) f,
  ) {
    final $$WorkSeriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workSeries,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkSeriesTableAnnotationComposer(
            $db: $db,
            $table: $db.workSeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bookmarksTableRefs<T extends Object>(
    Expression<T> Function($$BookmarksTableTableAnnotationComposer a) f,
  ) {
    final $$BookmarksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookmarksTable,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookmarksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.bookmarksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesTableTable,
          SeriesTableData,
          $$SeriesTableTableFilterComposer,
          $$SeriesTableTableOrderingComposer,
          $$SeriesTableTableAnnotationComposer,
          $$SeriesTableTableCreateCompanionBuilder,
          $$SeriesTableTableUpdateCompanionBuilder,
          (SeriesTableData, $$SeriesTableTableReferences),
          SeriesTableData,
          PrefetchHooks Function({bool workSeriesRefs, bool bookmarksTableRefs})
        > {
  $$SeriesTableTableTableManager(_$AppDatabase db, $SeriesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesTableTableAnnotationComposer($db: db, $table: table),
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
              }) => SeriesTableCompanion(
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
              }) => SeriesTableCompanion.insert(
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
                  $$SeriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workSeriesRefs = false, bookmarksTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workSeriesRefs) db.workSeries,
                    if (bookmarksTableRefs) db.bookmarksTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workSeriesRefs)
                        await $_getPrefetchedData<
                          SeriesTableData,
                          $SeriesTableTable,
                          WorkSery
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTableTableReferences
                              ._workSeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workSeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.seriesId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bookmarksTableRefs)
                        await $_getPrefetchedData<
                          SeriesTableData,
                          $SeriesTableTable,
                          BookmarksTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SeriesTableTableReferences
                              ._bookmarksTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SeriesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).bookmarksTableRefs,
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

typedef $$SeriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesTableTable,
      SeriesTableData,
      $$SeriesTableTableFilterComposer,
      $$SeriesTableTableOrderingComposer,
      $$SeriesTableTableAnnotationComposer,
      $$SeriesTableTableCreateCompanionBuilder,
      $$SeriesTableTableUpdateCompanionBuilder,
      (SeriesTableData, $$SeriesTableTableReferences),
      SeriesTableData,
      PrefetchHooks Function({bool workSeriesRefs, bool bookmarksTableRefs})
    >;
typedef $$WorkSeriesTableCreateCompanionBuilder =
    WorkSeriesCompanion Function({
      required int workId,
      required int seriesId,
      required int part,
      Value<int> rowid,
    });
typedef $$WorkSeriesTableUpdateCompanionBuilder =
    WorkSeriesCompanion Function({
      Value<int> workId,
      Value<int> seriesId,
      Value<int> part,
      Value<int> rowid,
    });

final class $$WorkSeriesTableReferences
    extends BaseReferences<_$AppDatabase, $WorkSeriesTable, WorkSery> {
  $$WorkSeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.workSeries.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get workId {
    final $_column = $_itemColumn<int>('work_id')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SeriesTableTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesTable.createAlias(
        $_aliasNameGenerator(db.workSeries.seriesId, db.seriesTable.id),
      );

  $$SeriesTableTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<int>('series_id')!;

    final manager = $$SeriesTableTableTableManager(
      $_db,
      $_db.seriesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkSeriesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkSeriesTable> {
  $$WorkSeriesTableFilterComposer({
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

  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableFilterComposer get seriesId {
    final $$SeriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableFilterComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkSeriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkSeriesTable> {
  $$WorkSeriesTableOrderingComposer({
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

  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableOrderingComposer get seriesId {
    final $$SeriesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableOrderingComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkSeriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkSeriesTable> {
  $$WorkSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get part =>
      $composableBuilder(column: $table.part, builder: (column) => column);

  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableAnnotationComposer get seriesId {
    final $$SeriesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkSeriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkSeriesTable,
          WorkSery,
          $$WorkSeriesTableFilterComposer,
          $$WorkSeriesTableOrderingComposer,
          $$WorkSeriesTableAnnotationComposer,
          $$WorkSeriesTableCreateCompanionBuilder,
          $$WorkSeriesTableUpdateCompanionBuilder,
          (WorkSery, $$WorkSeriesTableReferences),
          WorkSery,
          PrefetchHooks Function({bool workId, bool seriesId})
        > {
  $$WorkSeriesTableTableManager(_$AppDatabase db, $WorkSeriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> workId = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<int> part = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkSeriesCompanion(
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
              }) => WorkSeriesCompanion.insert(
                workId: workId,
                seriesId: seriesId,
                part: part,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkSeriesTableReferences(db, table, e),
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
                                referencedTable: $$WorkSeriesTableReferences
                                    ._workIdTable(db),
                                referencedColumn: $$WorkSeriesTableReferences
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
                                referencedTable: $$WorkSeriesTableReferences
                                    ._seriesIdTable(db),
                                referencedColumn: $$WorkSeriesTableReferences
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

typedef $$WorkSeriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkSeriesTable,
      WorkSery,
      $$WorkSeriesTableFilterComposer,
      $$WorkSeriesTableOrderingComposer,
      $$WorkSeriesTableAnnotationComposer,
      $$WorkSeriesTableCreateCompanionBuilder,
      $$WorkSeriesTableUpdateCompanionBuilder,
      (WorkSery, $$WorkSeriesTableReferences),
      WorkSery,
      PrefetchHooks Function({bool workId, bool seriesId})
    >;
typedef $$BookmarksTableTableCreateCompanionBuilder =
    BookmarksTableCompanion Function({
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
typedef $$BookmarksTableTableUpdateCompanionBuilder =
    BookmarksTableCompanion Function({
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

final class $$BookmarksTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BookmarksTableTable,
          BookmarksTableData
        > {
  $$BookmarksTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workIdTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.bookmarksTable.workId, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager? get workId {
    final $_column = $_itemColumn<int>('work_id');
    if ($_column == null) return null;
    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SeriesTableTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesTable.createAlias(
        $_aliasNameGenerator(db.bookmarksTable.seriesId, db.seriesTable.id),
      );

  $$SeriesTableTableProcessedTableManager? get seriesId {
    final $_column = $_itemColumn<int>('series_id');
    if ($_column == null) return null;
    final manager = $$SeriesTableTableTableManager(
      $_db,
      $_db.seriesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AuthorsTableTable _userIdTable(_$AppDatabase db) =>
      db.authorsTable.createAlias(
        $_aliasNameGenerator(db.bookmarksTable.userId, db.authorsTable.id),
      );

  $$AuthorsTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$AuthorsTableTableTableManager(
      $_db,
      $_db.authorsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookmarksTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookmarksTableTable> {
  $$BookmarksTableTableFilterComposer({
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

  $$WorksTableTableFilterComposer get workId {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableFilterComposer get seriesId {
    final $$SeriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableFilterComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableFilterComposer get userId {
    final $$AuthorsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableFilterComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookmarksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookmarksTableTable> {
  $$BookmarksTableTableOrderingComposer({
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

  $$WorksTableTableOrderingComposer get workId {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableOrderingComposer get seriesId {
    final $$SeriesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableOrderingComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableOrderingComposer get userId {
    final $$AuthorsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableOrderingComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookmarksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookmarksTableTable> {
  $$BookmarksTableTableAnnotationComposer({
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

  $$WorksTableTableAnnotationComposer get workId {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workId,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SeriesTableTableAnnotationComposer get seriesId {
    final $$SeriesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AuthorsTableTableAnnotationComposer get userId {
    final $$AuthorsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.authorsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuthorsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.authorsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookmarksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookmarksTableTable,
          BookmarksTableData,
          $$BookmarksTableTableFilterComposer,
          $$BookmarksTableTableOrderingComposer,
          $$BookmarksTableTableAnnotationComposer,
          $$BookmarksTableTableCreateCompanionBuilder,
          $$BookmarksTableTableUpdateCompanionBuilder,
          (BookmarksTableData, $$BookmarksTableTableReferences),
          BookmarksTableData,
          PrefetchHooks Function({bool workId, bool seriesId, bool userId})
        > {
  $$BookmarksTableTableTableManager(
    _$AppDatabase db,
    $BookmarksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarksTableTableAnnotationComposer($db: db, $table: table),
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
              }) => BookmarksTableCompanion(
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
              }) => BookmarksTableCompanion.insert(
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
                  $$BookmarksTableTableReferences(db, table, e),
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
                                        $$BookmarksTableTableReferences
                                            ._workIdTable(db),
                                    referencedColumn:
                                        $$BookmarksTableTableReferences
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
                                        $$BookmarksTableTableReferences
                                            ._seriesIdTable(db),
                                    referencedColumn:
                                        $$BookmarksTableTableReferences
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
                                        $$BookmarksTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$BookmarksTableTableReferences
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

typedef $$BookmarksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookmarksTableTable,
      BookmarksTableData,
      $$BookmarksTableTableFilterComposer,
      $$BookmarksTableTableOrderingComposer,
      $$BookmarksTableTableAnnotationComposer,
      $$BookmarksTableTableCreateCompanionBuilder,
      $$BookmarksTableTableUpdateCompanionBuilder,
      (BookmarksTableData, $$BookmarksTableTableReferences),
      BookmarksTableData,
      PrefetchHooks Function({bool workId, bool seriesId, bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorksTableTableTableManager get worksTable =>
      $$WorksTableTableTableManager(_db, _db.worksTable);
  $$AuthorsTableTableTableManager get authorsTable =>
      $$AuthorsTableTableTableManager(_db, _db.authorsTable);
  $$WorkAuthorsTableTableTableManager get workAuthorsTable =>
      $$WorkAuthorsTableTableTableManager(_db, _db.workAuthorsTable);
  $$TagsTableTableTableManager get tagsTable =>
      $$TagsTableTableTableManager(_db, _db.tagsTable);
  $$WorkFandomsTableTableTableManager get workFandomsTable =>
      $$WorkFandomsTableTableTableManager(_db, _db.workFandomsTable);
  $$WorkRelationshipsTableTableTableManager get workRelationshipsTable =>
      $$WorkRelationshipsTableTableTableManager(
        _db,
        _db.workRelationshipsTable,
      );
  $$WorkCharactersTableTableTableManager get workCharactersTable =>
      $$WorkCharactersTableTableTableManager(_db, _db.workCharactersTable);
  $$WorkTagsTableTableTableManager get workTagsTable =>
      $$WorkTagsTableTableTableManager(_db, _db.workTagsTable);
  $$ChaptersTableTableTableManager get chaptersTable =>
      $$ChaptersTableTableTableManager(_db, _db.chaptersTable);
  $$ReadHistoriesTableTableTableManager get readHistoriesTable =>
      $$ReadHistoriesTableTableTableManager(_db, _db.readHistoriesTable);
  $$SeriesTableTableTableManager get seriesTable =>
      $$SeriesTableTableTableManager(_db, _db.seriesTable);
  $$WorkSeriesTableTableManager get workSeries =>
      $$WorkSeriesTableTableManager(_db, _db.workSeries);
  $$BookmarksTableTableTableManager get bookmarksTable =>
      $$BookmarksTableTableTableManager(_db, _db.bookmarksTable);
}
