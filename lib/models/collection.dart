// ignore_for_file: constant_identifier_names

import 'package:archiverse/models/user.dart';

enum CollectionType {
  GIFT_EXCHANGE,
  PROMPT_MEME,
  NONE,
}

class Collection {
  final String title;
  final String name;
  final User owner;
  final List<User> maintainers;
  final DateTime creationDate;
  final Collection? parent;
  final String? email;
  final String imageUrl;
  final String? description;

  final bool moderated;
  final bool open;
  final bool unrevealed;
  final bool anonymous;
  final CollectionType type;

  final String? introduction;
  final String? faq;
  final String? rules;

  final int subcollections;
  final int bookmarks;
  final int fandoms;
  final int works;

  Collection({
    required this.title,
    required this.name,
    required this.owner,
    required this.maintainers,
    required this.creationDate,
    required this.subcollections,
    required this.bookmarks,
    required this.fandoms,
    required this.works,
    this.parent,
    this.email,
    required this.imageUrl,
    this.description,
    required this.moderated,
    required this.open,
    required this.unrevealed,
    required this.anonymous,
    required this.type,
    this.introduction,
    this.faq,
    this.rules,
  });

  bool get hasImage => (imageUrl.contains("otw-ao3-icons"));
  String get image =>
      hasImage ? imageUrl : "https://archiveofourown.org$imageUrl";

  Collection copyWith({
    String? title,
    String? name,
    User? owner,
    List<User>? maintainers,
    DateTime? creationDate,
    int? subcollections,
    int? bookmarks,
    int? fandoms,
    int? works,
    Collection? parent,
    String? email,
    String? imageUrl,
    String? description,
    bool? moderated,
    bool? open,
    bool? unrevealed,
    bool? anonymous,
    CollectionType? type,
    String? introduction,
    String? faq,
    String? rules,
  }) {
    return Collection(
      title: title ?? this.title,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      maintainers: maintainers ?? this.maintainers,
      creationDate: creationDate ?? this.creationDate,
      subcollections: subcollections ?? this.subcollections,
      bookmarks: bookmarks ?? this.bookmarks,
      fandoms: fandoms ?? this.fandoms,
      works: works ?? this.works,
      parent: parent ?? this.parent,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      moderated: moderated ?? this.moderated,
      open: open ?? this.open,
      unrevealed: unrevealed ?? this.unrevealed,
      anonymous: anonymous ?? this.anonymous,
      type: type ?? this.type,
      introduction: introduction ?? this.introduction,
      faq: faq ?? this.faq,
      rules: rules ?? this.rules,
    );
  }
}
