// ignore_for_file: constant_identifier_names

/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';

enum AgeRating {
  GENERAL,
  TEEN,
  MATURE,
  EXPLICIT,
  NONE;

  static Map<String, AgeRating> get map {
    return {
      "general-audience": AgeRating.GENERAL,
      "teen": AgeRating.TEEN,
      "mature": AgeRating.MATURE,
      "explicit": AgeRating.EXPLICIT,
      "notrated": AgeRating.NONE,
    };
  }
}

enum RelationshipType {
  FEM_SLASH,
  HET,
  GEN,
  SLASH,
  MULTI,
  UNDERAGE,
  OTHER,
  NONE;

  static Map<String, RelationshipType> get map {
    return {
      "F/F": RelationshipType.FEM_SLASH,
      "M/M": RelationshipType.SLASH,
      "Gen": RelationshipType.GEN,
      "F/M": RelationshipType.HET,
      "Multi": RelationshipType.MULTI,
      "Underage": RelationshipType.UNDERAGE,
      "Other": RelationshipType.OTHER,
      "slash": RelationshipType.SLASH,
      "femslash": RelationshipType.FEM_SLASH,
      "gen": RelationshipType.GEN,
      "het": RelationshipType.HET,
      "multi": RelationshipType.MULTI,
      "underage": RelationshipType.UNDERAGE,
      "other": RelationshipType.OTHER,
      "none": RelationshipType.NONE,
    };
  }
}

enum WarningType {
  AUTHOR_DEFERRED,
  NOT_APPLICABLE,
  GRAPHIC_VIOLENCE,
  MAJOR_CHARACTER_DEATH,
  RAPE_NON_CONSENSUAL,
  UNDERAGE,
  APPLICABLE;

  static Map<String, WarningType> get map {
    return {
      "Rape/Non-Con": WarningType.RAPE_NON_CONSENSUAL,
      "Creator Chose Not To Use Archive Warnings": WarningType.AUTHOR_DEFERRED,
      "Graphic Depictions Of Violence": WarningType.GRAPHIC_VIOLENCE,
      "Major Character Death": WarningType.MAJOR_CHARACTER_DEATH,
      "Underage": WarningType.UNDERAGE,
      "Underage Sex": WarningType.UNDERAGE,
      "No Archive Warnings Apply": WarningType.NOT_APPLICABLE,
      "chosenotto": WarningType.AUTHOR_DEFERRED,
      "yes": WarningType.APPLICABLE,
      "no": WarningType.NOT_APPLICABLE,
    };
  }
}

class SeriesWork {
  final int part;
  final Series series;

  const SeriesWork({required this.part, required this.series});

  SeriesWork copyWith({int? part, Series? series}) {
    return SeriesWork(part: part ?? this.part, series: series ?? this.series);
  }

  SeriesWork.fromSeries({required this.part, required Series series})
    : series = series.copyWith();
}

class Work {
  final int id;
  final String title, summary;
  final bool requiresAuth;
  final List<SeriesWork> series;
  final DateTime updateDate;
  final List<Pseud> authors;
  final int words, chapters, comments, kudos, bookmarks, hits;
  final int? totalChapters;
  final String language;
  final bool? finished;
  final List<Tag> fandoms, relationships, characters, tags;

  final AgeRating rating;
  final List<RelationshipType> relationship;
  final List<WarningType> warnings;

  final int subscriptions;
  final String? notes;
  final String? giftMessage;

  final DateTime? completedDate;
  final DateTime? publishDate;

  const Work({
    required this.id,
    required this.title,
    required this.summary,
    required this.series,
    required this.updateDate,
    required this.authors,
    required this.words,
    required this.chapters,
    required this.comments,
    required this.kudos,
    required this.bookmarks,
    required this.hits,
    required this.totalChapters,
    required this.language,
    required this.finished,
    required this.requiresAuth,
    this.fandoms = const [],
    this.relationships = const [],
    this.characters = const [],
    this.tags = const [],
    required this.rating,
    required this.relationship,
    required this.warnings,
    this.publishDate,
    this.completedDate,
    this.notes,
    this.giftMessage,
    this.subscriptions = 0,
  });

  bool get oneshot => totalChapters == 1;

  Work copyWith({
    int? id,
    String? title,
    String? summary,
    List<SeriesWork>? series,
    DateTime? updateDate,
    List<Pseud>? authors,
    int? words,
    int? chapters,
    int? comments,
    int? kudos,
    int? bookmarks,
    int? hits,
    int? totalChapters,
    String? language,
    bool? finished,
    bool? requiresAuth,
    List<Tag>? fandoms,
    List<Tag>? relationships,
    List<Tag>? characters,
    List<Tag>? tags,
    AgeRating? rating,
    List<RelationshipType>? relationship,
    List<WarningType>? warnings,
    DateTime? publishDate,
    DateTime? completedDate,
    String? notes,
    String? giftMessage,
    int? subscriptions,
  }) {
    return Work(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      series: series ?? this.series,
      updateDate: updateDate ?? this.updateDate,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      authors: authors ?? this.authors,
      words: words ?? this.words,
      chapters: chapters ?? this.chapters,
      comments: comments ?? this.comments,
      kudos: kudos ?? this.kudos,
      bookmarks: bookmarks ?? this.bookmarks,
      hits: hits ?? this.hits,
      totalChapters: totalChapters ?? this.totalChapters,
      language: language ?? this.language,
      finished: finished ?? this.finished,
      fandoms: fandoms ?? this.fandoms,
      relationships: relationships ?? this.relationships,
      characters: characters ?? this.characters,
      tags: tags ?? this.tags,
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
  String toString() {
    return 'Work(id: $id, title: $title, summary: $summary, series: $series, updateDate: $updateDate, authors: $authors, words: $words, chapters: $chapters, comments: $comments, kudos: $kudos, bookmarks: $bookmarks, hits: $hits, totalChapters: $totalChapters, language: $language, finished: $finished, requiresAuth: $requiresAuth, fandoms: $fandoms, relationships: $relationships, characters: $characters, tags: $tags, rating: $rating, relationship: $relationship, warnings: $warnings, publishDate: $publishDate)';
  }
}
