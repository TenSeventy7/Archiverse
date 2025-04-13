/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:flutter/material.dart';

class PaddedWrap extends StatelessWidget {
  final List<Widget> children;
  final WrapAlignment? runAlignment;
  final WrapCrossAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final Axis direction;
  final WrapAlignment? alignment;
  final VerticalDirection? verticalDirection;
  final double spacing;
  final double runSpacing;

  const PaddedWrap({
    super.key,
    required this.children,
    this.padding,
    this.runAlignment,
    this.crossAxisAlignment,
    this.direction = Axis.horizontal,
    this.alignment,
    this.verticalDirection,
    this.spacing = 0,
    this.runSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Wrap(
        alignment: alignment ?? WrapAlignment.start,
        direction: direction,
        runAlignment: runAlignment ?? WrapAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        spacing: spacing,
        runSpacing: runSpacing,
        children: children,
      ),
    );
  }
}
