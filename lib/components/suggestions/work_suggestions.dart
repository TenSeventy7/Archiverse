/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class WorkSuggestions extends StatelessWidget {
  final List<Work> works;
  final bool loading;
  final Widget? header;
  final Widget? footer;
  final double? elevation;
  const WorkSuggestions({
    super.key,
    required this.works,
    required this.loading,
    this.header,
    this.footer,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    List<Work> trimmed = works.take(5).toList();
    return Visibility(
      visible: trimmed.isNotEmpty,
      replacement: const SizedBox(),
      child: Column(
        children: [
          header ?? const SizedBox(),
          ...trimmed.map(
            (work) => WorkCard(work: work, elevation: elevation ?? 1),
          ),
          footer ?? const SizedBox(),
        ],
      ),
    );
  }
}
