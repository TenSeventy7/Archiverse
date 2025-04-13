/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/user.dart';

class Pseud extends User {
  final String pseud;

  const Pseud({
    required super.name,
    required this.pseud,
    super.imageUrl,
    super.bio,
    super.joinDate,
    super.works,
    super.series,
    super.bookmarks,
    super.collections,
    super.gifts,
    super.guest = false,
    super.pseuds = const [],
  });

  bool get isPseud => pseud != name;

  @override
  Pseud copyWith({
    String? name,
    String? pseud,
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
    return Pseud(
      name: name ?? this.name,
      pseud: pseud ?? this.pseud,
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
    );
  }

  Pseud fromUser({required User user, required String pseud}) {
    return Pseud(
      name: user.name,
      pseud: pseud,
      imageUrl: user.imageUrl,
      bio: user.bio,
      joinDate: user.joinDate,
      works: user.works,
      series: user.series,
      bookmarks: user.bookmarks,
      collections: user.collections,
      gifts: user.gifts,
      guest: user.guest,
      pseuds: user.pseuds,
    );
  }

  @override
  String toString() {
    return 'Pseud{name: $name, pseud: $pseud, imageUrl: $imageUrl, bio: $bio, joinDate: $joinDate, works: $works, series: $series, bookmarks: $bookmarks, collections: $collections, gifts: $gifts, guest: $guest, pseuds: $pseuds}';
  }
}
