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
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';

extension Ao3AuthApi on Ao3Api {
  /// Get the user information of the logged-in user (DUMMY IMPLEMENTATION)
  ///
  /// This function throws an exception in the public API
  Future<Pseud> getUserInfo(
    String? userName, {
    bool firstTime = false,
    refresh = false,
  }) async {
    throw Exception(
      'Authentication is not supported in the public API implementation',
    );
  }

  /// Dispenses an authentication token for use when logging in (DUMMY IMPLEMENTATION)
  ///
  /// This function throws an exception in the public API
  Future<String> getAuthToken() async {
    throw Exception(
      'Authentication is not supported in the public API implementation',
    );
  }

  /// Sign in a user (DUMMY IMPLEMENTATION)
  ///
  /// This function throws an exception in the public API
  Future<Pseud> signIn(String username, String password) async {
    throw Exception(
      'Authentication is not supported in the public API implementation',
    );
  }

  /// Sign out the currently logged-in user (DUMMY IMPLEMENTATION)
  ///
  /// This function throws an exception in the public API
  Future<bool> signOut() async {
    throw Exception(
      'Authentication is not supported in the public API implementation',
    );
  }

  /// Get the history of works read (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getReadHistory({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(10);
  }

  /// Get works marked as 'Read for Later' by the user (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getWorksMarkedLater({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(5);
  }

  /// Get works subscribed to by the user (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy works from placeholders.dart
  Future<List<Work>> getSubscribedWorks({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.generateRandomWorks(8);
  }
}
