
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

class Tag {
  final String name;
  final int count;
  final bool canonical;
  final List<Tag> parents, children, synonyms, mergers, subtags;

  Tag({
    required this.name,
    this.count = 0,
    this.canonical = false,
    this.parents = const [],
    this.children = const [],
    this.synonyms = const [],
    this.mergers = const [],
    this.subtags = const [],
  });

  String get encodedName =>
      name.replaceAll(".", "*d*").replaceAll("/", "*s*").replaceAll("&", "*a*");

  Tag copyWith({
    String? name,
    int? count,
    bool? canonical,
    List<Tag>? parents,
    List<Tag>? children,
    List<Tag>? synonyms,
    List<Tag>? mergers,
    List<Tag>? subtags,
  }) {
    return Tag(
      name: name ?? this.name,
      count: count ?? this.count,
      canonical: canonical ?? this.canonical,
      parents: parents ?? this.parents,
      children: children ?? this.children,
      synonyms: synonyms ?? this.synonyms,
      mergers: mergers ?? this.mergers,
      subtags: subtags ?? this.subtags,
    );
  }

  @override
  String toString() {
    return 'Tag{name: $name, count: $count, canonical: $canonical, parents: $parents, children: $children, synonyms: $synonyms, mergers: $mergers, subtags: $subtags}';
  }
}


