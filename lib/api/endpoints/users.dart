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
import 'package:archiverse/placeholders.dart';

extension Ao3UsersApi on Ao3Api {
  /// Search for users on Archive of Our Own (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy users from placeholders.dart
  Future<List<Pseud>> searchUsers(String query, {int page = 0}) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    return Fillers.pseuds;
  }

  /// Get a user's pseud list (DUMMY IMPLEMENTATION)
  ///
  /// This function returns dummy pseuds from placeholders.dart
  Future<List<Pseud>> getUserPseuds(Pseud user) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.pseuds;
  }

  /// Gets a pseud's basic information (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy pseud from placeholders.dart
  Future<Pseud> getPseud(
    Pseud pseud, {
    bool refresh = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    await Future.delayed(Duration(milliseconds: 200)); // Simulate network delay
    return Fillers.user.copyWith(name: pseud.name, pseud: pseud.pseud);
  }

  /// Get a user's profile (DUMMY IMPLEMENTATION)
  ///
  /// This function returns a dummy user from placeholders.dart
  Future<Pseud> getUser(
    Pseud user, {
    bool refresh = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network delay
    return Fillers.user.copyWith(name: user.name, pseud: user.pseud);
  }
}
