/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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
    this.imageSize = 200.0,
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
          placeholder:
              (context, url) => Center(child: _buildPlaceholder(context)),
          errorWidget:
              (context, url, error) =>
                  Center(child: _buildPlaceholder(context)),
        ),
      );
    }

    return _buildPlaceholder(context);
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Icon(
      _getIcon(),
      size: size,
      color: context.colorScheme.onPrimaryContainer,
    );
  }

  IconData _getIcon() {
    if (user.isAnonymous) {
      return TablerIcons.user_question;
    }

    if (user.isOrphan) {
      return TablerIcons.user_x;
    }

    return TablerIcons.user;
  }
}
