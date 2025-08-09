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
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';

extension Ao3WorksApi on Ao3Api {
  /* Work List Endpoints */

  /// Search for works on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> searchWorks(String query, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(10);
  }

  /// Get works from a tag (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getWorksFromTag(Tag tag, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(10);
  }

  /// Get works by a user (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getWorksByUser(Pseud user, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(5);
  }

  /// Get works from a series (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getWorksFromSeries(Series series, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(3);
  }

  /// Get the most recent works on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getRecentWorks() async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(20);
  }

  /* Work Page Endpoints */

  /// Get a work from Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy work from placeholders.dart
  Future<Work> getWork(
    Work work, {
    bool refresh = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.work.copyWith(id: work.id);
  }

  /// Post a hit on a work (DUMMY IMPLEMENTATION)
  ///
  /// This function does nothing in the public API
  Future<void> postHit(Work work) async {
    await Future.delayed(Duration(milliseconds: 100)); // Simulate network delay
    // No-op in public API
  }
}
