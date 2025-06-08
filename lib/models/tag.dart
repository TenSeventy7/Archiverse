/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

enum TagType {
  FANDOM,
  CHARACTER,
  RELATIONSHIP,
  FREEFORM;

  @override
  String toString() {
    switch (this) {
      case TagType.FANDOM:
        return "Fandom";
      case TagType.CHARACTER:
        return "Character";
      case TagType.RELATIONSHIP:
        return "Relationship";
      case TagType.FREEFORM:
        return "Freeform";
    }
  }
}

class Tag {
  final String name;
  final int count;
  final bool canonical;
  final List<Tag> parents, children, synonyms, mergers, subtags;
  final TagType type;

  Tag({
    required this.name,
    this.count = 0,
    this.type = TagType.FREEFORM,
    this.canonical = false,
    this.parents = const [],
    this.children = const [],
    this.synonyms = const [],
    this.mergers = const [],
    this.subtags = const [],
  });

  String get encodedName =>
      name.replaceAll(".", "*d*").replaceAll("/", "*s*").replaceAll("&", "*a*");

  bool get isRomanticRelationship =>
      type == TagType.RELATIONSHIP && name.toLowerCase().contains("/");

  bool get isPlatonicRelationship =>
      type == TagType.RELATIONSHIP && !isRomanticRelationship;

  Tag copyWith({
    String? name,
    int? count,
    bool? canonical,
    TagType? type,
    List<Tag>? parents,
    List<Tag>? children,
    List<Tag>? synonyms,
    List<Tag>? mergers,
    List<Tag>? subtags,
  }) {
    return Tag(
      name: name ?? this.name,
      type: type ?? this.type,
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
