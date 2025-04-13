/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/pseud.dart';

class User {
  final String name;
  final String? imageUrl, bio;
  final DateTime? joinDate;
  final int? works, series, bookmarks, collections, gifts;
  final bool guest;
  final List<Pseud> pseuds;

  // For auth
  final String? email;
  final bool isAuthenticated;

  const User({
    required this.name,
    this.imageUrl,
    this.bio,
    this.joinDate,
    this.works,
    this.series,
    this.bookmarks,
    this.collections,
    this.gifts,
    this.guest = false,
    this.pseuds = const [],
    this.email,
    this.isAuthenticated = false,
  });

  bool get hasImage => (imageUrl?.contains("otw-ao3-icons") ?? false);
  bool get isAnonymous => name == "Anonymous";
  bool get isOrphan => name == "orphan_account";
  bool get isValid => !isAnonymous && !isOrphan && !guest;

  User copyWith({
    String? name,
    String? imageUrl,
    String? bio,
    DateTime? joinDate,
    int? works,
    int? series,
    int? bookmarks,
    int? collections,
    int? gifts,
    bool? guest,
    List<Pseud>? pseuds,
    String? email,
    bool? isAuthenticated,
  }) {
    return User(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
      joinDate: joinDate ?? this.joinDate,
      works: works ?? this.works,
      series: series ?? this.series,
      bookmarks: bookmarks ?? this.bookmarks,
      collections: collections ?? this.collections,
      gifts: gifts ?? this.gifts,
      guest: guest ?? this.guest,
      pseuds: pseuds ?? this.pseuds,
      email: email ?? this.email,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, imageUrl: $imageUrl, bio: $bio, joinDate: $joinDate, works: $works, series: $series, bookmarks: $bookmarks, collections: $collections, gifts: $gifts, guest: $guest, pseuds: $pseuds)';
  }
}
