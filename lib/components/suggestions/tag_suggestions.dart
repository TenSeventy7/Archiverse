/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/cards/tag_card.dart';
import 'package:archiverse/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TagSuggestions extends StatelessWidget {
  final List<Tag> tags;
  final bool loading;
  final Widget? header;
  final Widget? footer;
  final double? elevation;
  const TagSuggestions({
    super.key,
    required this.tags,
    required this.loading,
    this.header,
    this.footer,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    List<Tag> trimmed = tags.take(5).toList();
    return Visibility(
      visible: trimmed.isNotEmpty,
      replacement: const SizedBox(),
      child: Skeletonizer(
        enabled: loading,
        child: Column(
          spacing: 4.0,
          children: [
            header ?? const SizedBox(),
            ...trimmed.map(
              (tag) => TagCard(tag: tag, elevation: elevation ?? 1),
            ),
            footer ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
