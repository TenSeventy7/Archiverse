/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/extensions/context_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum _ItemPlaceholderType { small, medium, large }

class ItemPlaceholder extends StatelessWidget {
  const ItemPlaceholder({super.key, this.message, this.icon})
    : _type = _ItemPlaceholderType.large;
  const ItemPlaceholder.small({super.key, this.message, this.icon})
    : _type = _ItemPlaceholderType.small;

  final String? message;
  final IconData? icon;
  final _ItemPlaceholderType _type;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _ItemPlaceholderType.small:
        return _buildSmallError(context);
      case _ItemPlaceholderType.medium:
      case _ItemPlaceholderType.large:
        return _buildLargeError(context);
    }
  }

  Widget _buildSmallError(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.commonPadding,
          vertical: 24.0,
        ),
        child: Column(
          spacing: 24.0,
          children: [
            Icon(
              icon ?? TablerIcons.template,
              color: context.colorScheme.surfaceContainerHighest,
              size: 64.0,
            ),
            Column(
              spacing: 8.0,
              children: [
                Text(
                  message ?? "Looks empty for now",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center _buildLargeError(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(context.getDrawable("component_empty_img.png")),
            const SizedBox(height: 24.0),
            Text(
              "There's nothing to see here!",
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            // ignore: prefer_const_constructors
            Text(
              "This page seems to be empty for now. Check back in later!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
