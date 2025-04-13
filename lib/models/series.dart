
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/pseud.dart';

class Series {
  final int id;
  final String title, summary;
  final List<Pseud> authors;
  final int words, works, bookmarks;
  final DateTime? updateDate;
  final bool? finished;

  final DateTime? publishDate;
  final String? notes;

  const Series({
    required this.id,
    required this.title,
    this.summary = "",
    this.authors = const [],
    this.words = 0,
    this.works = 0,
    this.bookmarks = 0,
    this.updateDate,
    this.finished,
    this.publishDate,
    this.notes,
  });

  Series copyWith({
    int? id,
    String? title,
    String? summary,
    List<Pseud>? authors,
    int? words,
    int? works,
    int? bookmarks,
    DateTime? updateDate,
    bool? finished,
    DateTime? publishDate,
    String? notes,
  }) {
    return Series(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      authors: authors ?? this.authors,
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
  String toString() {
    return 'Series{id: $id, title: $title, summary: $summary, authors: $authors, words: $words, works: $works, bookmarks: $bookmarks, updateDate: $updateDate, finished: $finished, publishDate: $publishDate, notes: $notes}';
  }
}
