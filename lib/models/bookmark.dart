// ignore_for_file: constant_identifier_names

/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';

enum BookmarkType { PUBLIC, PRIVATE, RECOMMENDATION }

class Bookmark {
  final Work? work;
  final Series? series;
  final Pseud user;
  final DateTime date;
  final BookmarkType type;
  final String? notes;
  final List<Tag> tags;

  final String? privateNotes;
  final String? recNotes;

  Bookmark({
    this.work,
    this.series,
    required this.user,
    required this.date,
    required this.type,
    this.tags = const [],
    this.notes,
    this.privateNotes,
    this.recNotes,
  });

  get isWorkBookmark => work != null;
  get isSeriesBookmark => series != null;

  Bookmark copyWith({
    Work? work,
    Series? series,
    Pseud? user,
    DateTime? date,
    BookmarkType? type,
    String? notes,
    List<Tag>? tags,
    String? privateNotes,
    String? recNotes,
  }) {
    return Bookmark(
      work: work ?? this.work,
      series: series ?? this.series,
      user: user ?? this.user,
      date: date ?? this.date,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      privateNotes: privateNotes ?? this.privateNotes,
      recNotes: recNotes ?? this.recNotes,
    );
  }

  @override
  String toString() {
    return 'Bookmark{work: $work, series: $series, user: $user, date: $date, type: $type, notes: $notes, tags: $tags}';
  }
}
