import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/padded_row.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class DiscoverHeader extends StatefulWidget implements PreferredSizeWidget {
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
  State<DiscoverHeader> createState() => _DiscoverHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(64.0 + 24.0);
}

class _DiscoverHeaderState extends State<DiscoverHeader> {
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(_updateAppBarOpacity);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_updateAppBarOpacity);
    }
    super.dispose();
  }

  void _updateAppBarOpacity() {
    if (!mounted) return;
    if (widget.controller == null || !widget.controller!.hasClients) return;
    if (!widget.controller!.hasClients) return;

    // Adjust these values as needed for your design
    final double fadeStart = 0.0;
    final double fadeEnd = 64.0 + 24.0;
    final double offset = widget.controller!.hasClients
        ? widget.controller!.offset
        : 0.0;
    double opacity = ((offset - fadeStart) / (fadeEnd - fadeStart)).clamp(
      0.0,
      1.0,
    );

    if (opacity != _appBarOpacity) {
      setState(() {
        _appBarOpacity = opacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveAppBar(
      controller: widget.controller,
      centerTitle: false,
      toolbarHeight: 64.0 + 24.0,
      titleSpacing: 16.0,
      title: PaddedRow(
        padding: EdgeInsets.only(bottom: 24.0),
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            disabledColor: context.colorScheme.onSurface,
            onPressed: null,
            icon: const Icon(TablerIcons.home),
          ),
          Flexible(child: _buildSearchBar(context)),
          IconButton(
            onPressed: widget.onNotificationTap,
            icon: const Icon(TablerIcons.bell),
            tooltip: 'Notifications',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(100.0),
      color: Color.lerp(
        context.colorScheme.surfaceContainerHigh,
        context.colorScheme.surfaceContainerLow,
        _appBarOpacity,
      ),
      child: InkWell(
        onTap: widget.onSearchTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Search for works and more",
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Color.lerp(
                context.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                _appBarOpacity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
