
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/work.dart';

class TagBookmark {
  final Work? work;
  final Series? series;
  final List<Bookmark> bookmarks;

  TagBookmark({
    required this.work,
    required this.series,
    required this.bookmarks,
  });

  @override
  String toString() {
    return 'TagBookmark{work: $work, series: $series, bookmarks: $bookmarks}';
  }
}
