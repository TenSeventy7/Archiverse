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
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:http/http.dart' show Response;

extension Ao3ChaptersApi on Ao3Api {
  /// Get a chapter response from a chapter (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy HTML response
  Future<Response> getChapterResponse(Chapter chapter) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay

    return Response(
      '<html><body><div class="userstuff">${Fillers.loremIpsum}</div></body></html>',
      200,
      headers: {'content-type': 'text/html'},
    );
  }

  /// Get a list of chapters from a work (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy chapters from placeholders.dart
  Future<List<Chapter>> getChapterList(Work work) async {
    await Future.delayed(Duration(milliseconds: 400)); // Simulate network delay
    return Fillers.chapters;
  }

  /// Get a chapter from a chapter (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy chapter from placeholders.dart
  Future<Chapter> getChapter(Chapter chapter) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.chapter.copyWith(workId: chapter.workId, id: chapter.id);
  }
}
