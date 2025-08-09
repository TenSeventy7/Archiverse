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
import 'package:archiverse/placeholders.dart';

extension Ao3SeriesApi on Ao3Api {
  /// Get a series made by a user (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy series from placeholders.dart
  Future<List<Series>> getSeriesByUser(Pseud user, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.seriesList;
  }

  /// Get a series from Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy series from placeholders.dart
  Future<Series> getSeries(
    Series series, {
    bool refresh = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.series.copyWith(id: series.id);
  }
}
