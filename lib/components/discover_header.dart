import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscoverHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final ScrollController? controller;

  const DiscoverHeader({
    super.key,
    this.onSearchTap,
    this.onNotificationTap,
    this.controller,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 48.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpressiveAppBar(
      controller: controller,
      centerTitle: false,
      toolbarHeight: kToolbarHeight + 48.0,
      titleSpacing: 16.0,
      // shape: RoundedRectangleBorder(),
      title: PaddedColumn(
        padding: EdgeInsets.only(
          left: context.commonPadding,
          right: context.commonPadding,
          bottom: 24.0,
        ),
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
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Skeletonizer(
                enabled: userProvider.isFetching,
                child: Text(
                  "${userProvider.user?.name ?? "Explorer"}!",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 24.0),
          child: IconButton(
            onPressed: onNotificationTap,
            icon: const Icon(TablerIcons.bell),
            tooltip: 'Notifications',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.0, left: 4.0, bottom: 24.0),
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
