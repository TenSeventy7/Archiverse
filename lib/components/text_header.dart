/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum TextHeaderSize { small, medium, large }

class TextHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? actionText;
  final Function()? onTap;
  final TextHeaderSize size;
  final EdgeInsets? padding;
  final bool hasPadding;
  const TextHeader.small({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actionText,
    this.onTap,
    this.padding,
    this.hasPadding = true,
  }) : size = TextHeaderSize.small;

  const TextHeader.medium({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actionText,
    this.onTap,
    this.padding,
    this.hasPadding = true,
  }) : size = TextHeaderSize.medium;

  const TextHeader.large({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actionText,
    this.onTap,
    this.padding,
    this.hasPadding = true,
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
        left:
            (hasPadding ? context.commonPaddingDouble : 0.0) +
            (padding?.left ?? 0.0),
        right:
            (hasPadding ? context.commonPadding : 0.0) +
            (padding?.right ?? 0.0),
        top: (size == TextHeaderSize.small) ? 0.0 : 8.0 + (padding?.top ?? 0.0),
        bottom: padding?.bottom ?? 0.0,
      ),
      leading:
          icon != null
              ? Icon(
                icon,
                size:
                    size == TextHeaderSize.small
                        ? 20.0
                        : size == TextHeaderSize.medium
                        ? 24.0
                        : 28.0,
                color: context.colorScheme.primary.withValues(alpha: 0.6),
              )
              : null,
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
