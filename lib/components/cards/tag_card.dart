import 'package:archiverse/components/items/tag_item.dart';
import 'package:archiverse/models/tag.dart';
import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  final Tag tag;
  final double? elevation;
  const TagCard({super.key, required this.tag, this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Navigator.pushNamed(context, "", arguments: work);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: TagItem(tag: tag),
        ),
      ),
    );
  }
}
