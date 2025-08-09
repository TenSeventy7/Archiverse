/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * DUMMY API IMPLEMENTATION FOR PUBLIC REPOSITORY
 * This is a placeholder implementation that returns dummy data from placeholders.dart
 * The actual API implementation is proprietary to prevent abuse.
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';

extension Ao3BookmarksApi on Ao3Api {
  /// Search for bookmarks on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy bookmarks from placeholders.dart
  Future<List<Bookmark>> searchBookmarks(String query, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.bookmarks;
  }

  /// Get most recent bookmarks on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy bookmarks from placeholders.dart
  Future<List<Bookmark>> getRecentBookmarks() async {
    await Future.delayed(Duration(milliseconds: 400)); // Simulate network delay
    return Fillers.bookmarks;
  }

  /// Get bookmarks by user on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy bookmarks from placeholders.dart
  Future<List<Bookmark>> getBookmarksByUser(Pseud user, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.bookmarks;
  }

  /// Get bookmarks from a work on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy bookmarks from placeholders.dart
  Future<List<Bookmark>> getBookmarksFromWork(
    Work work, {
    required int page,
  }) async {
    await Future.delayed(Duration(milliseconds: 400)); // Simulate network delay
    return Fillers.bookmarks;
  }

  /// Get bookmarks from a series on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy bookmarks from placeholders.dart
  Future<List<Bookmark>> getBookmarksFromSeries(
    Series series, {
    int page = 0,
  }) async {
    await Future.delayed(Duration(milliseconds: 400)); // Simulate network delay
    return Fillers.bookmarks;
  }

  /// Get bookmarks from a tag on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy tag bookmarks from placeholders.dart
  Future<List<TagBookmark>> getBookmarksFromTag(Tag tag, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.tagBookmarks;
  }
}
