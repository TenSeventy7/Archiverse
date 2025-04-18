
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _AuthorsListDialog extends StatelessWidget {
  final List<Pseud> authors;
  const _AuthorsListDialog({required this.authors});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverToBoxAdapter(
            child: Text(
              "Authors",
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
          sliver: SliverList.separated(
            itemCount: authors.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1),
            itemBuilder: (context, index) => ListTile(
              leading: Skeleton.leaf(
                child: CircleAvatar(
                  maxRadius: 20.0,
                  backgroundColor: context.colorScheme.primaryContainer,
                  child: EnhancedFutureBuilder(
                    future: Ao3Api().getUser(authors[index]),
                    rememberFutureResult: true,
                    whenDone: (author) => UserImage(
                      context: context,
                      user: author,
                      size: 5,
                    ),
                    whenNotDone: UserImage(
                      context: context,
                      user: authors[index],
                      size: 5,
                    ),
                  ),
                ),
              ),
              title: Text(authors[index].name),
              onTap: () {
                if (authors[index].isValid) {
                  Navigator.pushNamed(
                    context,
                    // UserDetail.routeName,
                    '',
                    arguments: authors[index],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AuthorsListDialog {
  static void showSheet(
    BuildContext context, {
    required List<Pseud> authors,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) => _AuthorsListDialog(authors: authors),
    );
  }
}
