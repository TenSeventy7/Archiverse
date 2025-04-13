/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

enum TextHeaderSize { small, medium, large }

class TextHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? actionText;
  final Function()? onTap;
  final TextHeaderSize size;
  const TextHeader.small({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onTap,
  }) : size = TextHeaderSize.small;

  const TextHeader.medium({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onTap,
  }) : size = TextHeaderSize.medium;

  const TextHeader.large({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onTap,
  }) : size = TextHeaderSize.large;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle;
    TextStyle? subtitleStyle;

    switch (size) {
      case TextHeaderSize.small:
        titleStyle = context.textTheme.titleSmall;
        subtitleStyle = context.textTheme.labelSmall;
        break;
      case TextHeaderSize.medium:
        titleStyle = context.textTheme.titleMedium;
        subtitleStyle = context.textTheme.labelMedium;
        break;
      case TextHeaderSize.large:
        titleStyle = context.textTheme.titleLarge!.apply(fontWeightDelta: 1);
        subtitleStyle = context.textTheme.labelLarge;
        break;
    }

    return ListTile(
      contentPadding: EdgeInsets.only(
        left: context.commonPaddingHalf,
        right: context.commonPaddingHalf,
        top: (size == TextHeaderSize.small) ? 0.0 : 8.0,
      ),
      onTap: onTap,
      title: Text(title, style: titleStyle),
      subtitle:
          subtitle != null
              ? Text(
                subtitle!,
                style: subtitleStyle?.apply(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              )
              : null,
      trailing:
          actionText != null
              ? TextButton(onPressed: onTap, child: actionText!)
              : null,
    );
  }
}
