import 'package:archiverse/components/items/author_item.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthorCard extends StatelessWidget {
  final Pseud author;
  final double? elevation;
  const AuthorCard({super.key, required this.author, this.elevation});

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
          padding: EdgeInsets.all(16.0),
          child: AuthorItem(author: author),
        ),
      ),
    );
  }
}
