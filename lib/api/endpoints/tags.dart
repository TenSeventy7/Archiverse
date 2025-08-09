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
import 'package:archiverse/models/media.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';

extension Ao3TagsApi on Ao3Api {
  /// Search for user and canonical tags on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy tags from placeholders.dart
  Future<List<Tag>> searchTags(
    String query, {
    TagType type = TagType.FANDOM,
    int page = 0,
  }) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay

    switch (type) {
      case TagType.FANDOM:
        return Fillers.fandoms;
      case TagType.CHARACTER:
        return Fillers.characters;
      case TagType.RELATIONSHIP:
        return Fillers.relationships;
      case TagType.FREEFORM:
        return Fillers.freeforms;
    }
  }

  /// Get tags from a fandom type on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy tags from placeholders.dart
  Future<List<Tag>> getTagsFromFandomType(Media media) async {
    await Future.delayed(Duration(milliseconds: 400)); // Simulate network delay
    return Fillers.fandoms;
  }

  /// Get the top fandoms from Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy fandoms from placeholders.dart
  Future<Map<Media, List<Tag>>> getTopFandoms() async {
    await Future.delayed(Duration(milliseconds: 600)); // Simulate network delay

    Map<Media, List<Tag>> fandoms = {};
    for (Media type in Media.values) {
      fandoms[type] = Fillers.fandoms.take(3).toList();
    }

    return fandoms;
  }

  /// Get a tag from Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy tag from placeholders.dart
  Future<Tag> getTag(
    Tag tag, {
    bool refresh = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.tag.copyWith(name: tag.name, type: tag.type);
  }
}
