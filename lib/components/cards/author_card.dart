import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/author_item.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';

class AuthorCard extends BaseCard<Pseud> {
  const AuthorCard({super.key, required Pseud author, super.elevation})
    : super(item: author);

  @override
  Widget buildContent(BuildContext context) {
    return AuthorItem(author: item);
  }

  // @override
  // String getRouteName() => 'author';
}
