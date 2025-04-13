/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:flutter/material.dart';

class PaddedDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const PaddedDivider({super.key, this.height = 1, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(height: height, color: color),
    );
  }
}
