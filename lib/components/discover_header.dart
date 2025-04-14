import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class DiscoverHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  const DiscoverHeader({
    super.key,
    this.userName = 'Explorer',
    this.onSearchTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      centerTitle: false,
      pinned: true,
      floating: true,
      toolbarHeight: kToolbarHeight + 24.0,
      shape: RoundedRectangleBorder(),
      title: PaddedColumn(
        padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back,",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '$userName! 👋',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onNotificationTap,
          icon: const Icon(TablerIcons.bell),
          tooltip: 'Notifications',
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.0, left: 4.0),
          child: IconButton.filled(
            onPressed: onSearchTap,
            // Tabler Icons are a bit larger than Material Icons
            // so we need to adjust the size for contained buttons
            icon: Icon(
              TablerIcons.search,
              size: 22.0,
              color: context.colorScheme.onPrimary,
            ),
            tooltip: 'Search',
          ),
        ),
      ],
    );
  }
}
