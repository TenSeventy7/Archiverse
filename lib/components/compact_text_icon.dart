
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompactTextIcon extends StatelessWidget {
  final IconData? icon;
  final int? statistic;
  final String? text;
  final bool dark;

  const CompactTextIcon({
    super.key,
    required this.icon,
    required this.statistic,
  })  : text = null,
        dark = false;
  const CompactTextIcon.dark({
    super.key,
    required this.icon,
    required this.statistic,
  })  : text = null,
        dark = true;
  const CompactTextIcon.text({
    super.key,
    required this.icon,
    required this.text,
  })  : statistic = null,
        dark = false;
  const CompactTextIcon.textDark({
    super.key,
    required this.icon,
    required this.text,
  })  : statistic = null,
        dark = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14.0,
          color: (dark) ? Colors.red.shade50 : null,
        ),
        const SizedBox(width: 6.0),
        Text(
          _getText(),
          style: context.textTheme.labelMedium?.copyWith(
            color: (dark) ? Colors.red.shade50 : null,
          ),
        )
      ],
    );
  }

  String _getText() {
    if (text != null) {
      return text!;
    } else if (statistic != null) {
      return NumberFormat.compact().format(statistic);
    } else {
      return '';
    }
  }
}
