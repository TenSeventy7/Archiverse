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

extension Ao3AutocompleteApi on Ao3Api {
  /// Get autocomplete suggestions for a search query (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy suggestions
  Future<List<String>> getAutocompleteSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 200)); // Simulate network delay

    // Return some dummy suggestions based on the query
    return [
      '${query}_suggestion_1',
      '${query}_suggestion_2',
      '${query}_suggestion_3',
    ];
  }
}
