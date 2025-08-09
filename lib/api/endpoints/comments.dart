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
import 'package:archiverse/models/comment.dart';

extension Ao3CommentsApi on Ao3Api {
  /// Get comments from a chapter or sub-comments from a comment (DUMMY IMPLEMENTATION)
  ///
  /// This function returns an empty list in the public API
  Future<List<Comment>> getComments({
    Chapter? chapter,
    Comment? comment,
  }) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return []; // Return empty list for public API
  }
}
