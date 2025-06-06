/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/extensions/context_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum _LoadErrorType { small, medium, large }

class LoadError extends StatelessWidget {
  const LoadError({super.key, required this.onPressed})
    : _type = _LoadErrorType.large;
  const LoadError.small({super.key, required this.onPressed})
    : _type = _LoadErrorType.small;

  final Function()? onPressed;
  final _LoadErrorType _type;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _LoadErrorType.small:
        return _buildSmallError(context);
      case _LoadErrorType.medium:
      case _LoadErrorType.large:
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
              TablerIcons.wifi_off,
              color: context.colorScheme.surfaceContainerHighest,
              size: 64.0,
            ),
            Column(
              spacing: 8.0,
              children: [
                Text(
                  "There was a problem loading this content.",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium,
                ),
                FilledButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(TablerIcons.reload),
                  label: Text("Try again"),
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
            Image.asset(context.getDrawable("component_error_img.png")),
            const SizedBox(height: 24.0),
            Text(
              "Uh-oh! There seems to be a problem.",
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            // ignore: prefer_const_constructors
            Text(
              "It seems like your internet connection might be taking a break. No worries, these things happen!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            FilledButton.icon(
              onPressed: onPressed,
              icon: const Icon(TablerIcons.reload),
              label: Text("Try again"),
            ),
          ],
        ),
      ),
    );
  }
}
