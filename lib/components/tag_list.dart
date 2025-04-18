/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TagList extends StatelessWidget {
  const TagList({super.key, required this.title, required this.tags})
    : placeholder = false,
      shortcut = false;

  const TagList.placeholder({
    super.key,
    required this.title,
    required this.tags,
  }) : placeholder = true,
       shortcut = false;

  const TagList.shortcut({super.key, required this.title, required this.tags})
    : placeholder = false,
      shortcut = true;

  const TagList.shortcutPlaceholder({
    super.key,
    required this.title,
    required this.tags,
  }) : placeholder = true,
       shortcut = true;

  final String title;
  final List<Tag> tags;
  final bool placeholder;
  final bool shortcut;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tags.isNotEmpty,
      child: Skeletonizer(
        enabled: placeholder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeader.medium(title: title),
            _buildTagsWidget(tags, context),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsWidget(List<Tag> tags, BuildContext context) {
    return Visibility(
      visible: tags.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.commonPaddingDouble),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 2,
          children:
              tags.map<Widget>((tag) => _buildTagChip(tag, context)).toList(),
        ),
      ),
    );
  }

  Widget _buildTagChip(Tag tag, BuildContext context) {
    return Skeleton.leaf(
      child: ActionChip(
        label: Text(tag.name),
        onPressed:
            shortcut
                ? () => Navigator.pushNamed(
                  context,
                  // WorksByTag.routeName,
                  "",
                  arguments: tag,
                )
                : () => Navigator.pushNamed(
                  context,
                  // TagDetail.routeName,
                  "",
                  arguments: tag,
                ),
      ),
    );
  }
}
