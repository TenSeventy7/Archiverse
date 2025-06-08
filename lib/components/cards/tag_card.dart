import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/tag_item.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/views/activity_tag.dart';
import 'package:flutter/material.dart';

class TagCard extends BaseCard<Tag> {
  const TagCard({super.key, required Tag tag, super.elevation})
    : super(
        item: tag,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
      );

  @override
  Widget buildContent(BuildContext context) {
    return TagItem(tag: item);
  }

  @override
  String getRouteName() => TagActivity.routeName;
}
