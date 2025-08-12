import 'package:archiverse/components/inverse_rounded_rectangle_border.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

/// An implementation of the Material AppBar widget that provides a design
/// similar to that of Material 3 Expressive, which was introduced in April 2025
/// but hasn't been implemented in Flutter yet.

// Default toolbar height for Material 3
const double _kToolbarHeight = 64.0;

const double kExpressiveToolbarHeight =
    _kToolbarHeight + ExpressiveAppBar.defaultRadius;

class ExpressiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Default radius for the rounded corners
  static const double defaultRadius = 24.0;

  const ExpressiveAppBar({
    super.key,
    this.leading,
    this.controller,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.unelevatedColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.rounded = true,
  });

  final ScrollController? controller;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? unelevatedColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final bool rounded;

  @override
  Size get preferredSize => Size.fromHeight(
    (toolbarHeight ?? _kToolbarHeight) +
        (bottom?.preferredSize.height ?? 0.0) +
        (rounded && bottom == null ? 24.0 : 0.0),
  );

  @override
  State<ExpressiveAppBar> createState() => _ExpressiveAppBarState();
}

class _ExpressiveAppBarState extends State<ExpressiveAppBar> {
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
    final double fadeEnd = _kToolbarHeight;
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
    return AppBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.title,
      titleTextStyle:
          widget.titleTextStyle ??
          context.theme.textTheme.titleMedium?.apply(fontSizeDelta: 5.0),
      titleSpacing: widget.titleSpacing ?? 8.0,
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
      bottom: widget.bottom,
      elevation: widget.elevation ?? 0,
      scrolledUnderElevation: widget.scrolledUnderElevation ?? 0,
      notificationPredicate: widget.notificationPredicate,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      shape:
          widget.shape ??
          (widget.rounded
              ? const InverseRoundedRectangleBorder(
                  radius: ExpressiveAppBar.defaultRadius,
                )
              : null),
      backgroundColor: Color.lerp(
        widget.unelevatedColor ?? context.colorScheme.surface,
        widget.backgroundColor ?? context.colorScheme.surfaceContainerHigh,
        _appBarOpacity,
      ),
      foregroundColor: widget.foregroundColor,
      iconTheme: widget.iconTheme,
      actionsIconTheme: widget.actionsIconTheme,
      primary: widget.primary,
      centerTitle: widget.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      toolbarOpacity: widget.toolbarOpacity,
      bottomOpacity: widget.bottomOpacity,
      toolbarHeight: widget.toolbarHeight ?? _kToolbarHeight,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: widget.toolbarTextStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
    );
  }
}
