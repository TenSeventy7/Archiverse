/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/dialogs/authors_list_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthorTile extends StatelessWidget {
  const AuthorTile({super.key, required this.authors, required this.context})
    : dark = false;
  const AuthorTile.dark({
    super.key,
    required this.authors,
    required this.context,
  }) : dark = true;

  final List<Pseud> authors;
  final BuildContext context;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.commonPaddingHalf / 2,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildAuthorTitle(authors, context),
      ),
      onTap: () {
        if (authors.length == 1 && authors[0].isValid) {
          Navigator.pushNamed(
            context,
            // UserDetail.routeName,
            "", // TODO: Add route name
            arguments: authors[0],
          );
        } else {
          AuthorsListDialog.showSheet(context, authors: authors);
        }
      },
    );
  }

  List<Widget> _buildAuthorTitle(List<Pseud> authors, BuildContext context) {
    return [
      const SizedBox(width: 14.0),
      for (var author in authors.take(4)) ...[
        Align(
          widthFactor: 0.35,
          child: Skeleton.leaf(
            child: CircleAvatar(
              maxRadius: 16.0,
              backgroundColor: context.colorScheme.primaryContainer,
              child: EnhancedFutureBuilder(
                future: Ao3Api().getUser(author),
                rememberFutureResult: false,
                whenDone:
                    (author) =>
                        UserImage(context: context, user: author, size: 8),
                whenNotDone: UserImage(context: context, user: author, size: 5),
              ),
            ),
          ),
        ),
      ],
      const SizedBox(width: 24.0),
      Flexible(
        child: Text(
          _formatAuthorNames(),
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleSmall?.apply(
            color: dark ? Colors.red.shade50 : context.colorScheme.primary,
          ),
        ),
      ),
    ];
  }

  String _formatAuthorNames() {
    return (authors.length == 1)
        ? authors[0].name
        : "${authors.length} authors";
  }
}
