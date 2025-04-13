
/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final BuildContext context;
  final User user;
  final double size;
  final double imageSize;

  const UserImage({
    super.key,
    required this.context,
    required this.user,
    this.size = 0,
    this.imageSize = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    if (user.hasImage) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: user.imageUrl!,
          fit: BoxFit.cover,
          width: imageSize,
          height: imageSize,
          placeholder: (context, url) => Center(
            child: _buildPlaceholder(context),
          ),
          errorWidget: (context, url, error) => Center(
            child: _buildPlaceholder(context),
          ),
        ),
      );
    }

    return _buildPlaceholder(context);
  }

  Text _buildPlaceholder(BuildContext context) {
    return Text(
      user.name.substring(0, 1),
      style: context.textTheme.labelSmall?.apply(
        color: context.colorScheme.onPrimaryContainer,
        fontWeightDelta: 1,
        fontSizeDelta: size,
      ),
    );
  }
}
