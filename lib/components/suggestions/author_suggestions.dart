/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/cards/author_card.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthorSuggestions extends StatelessWidget {
  final List<Pseud> authors;
  final bool loading;
  final Widget? header;
  final Widget? footer;
  final double? elevation;
  const AuthorSuggestions({
    super.key,
    required this.authors,
    required this.loading,
    this.header,
    this.footer,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    List<Pseud> trimmed = authors.take(8).toList();
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
              (author) => AuthorCard(author: author, elevation: elevation ?? 1),
            ),
            footer ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
