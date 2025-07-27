import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scroll_under_flexible_configs.dart';
import 'package:archiverse/components/expressive/scroll_under_flexible_space.dart';
import 'package:archiverse/components/inverse_rounded_rectangle_border.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum _ExpressiveSliverType { normal, medium, large }

// Default collapsed toolbar height for Material 3
const double _kToolbarHeight = 64.0;

/// An expressive SliverAppBar supporting .medium, .large, and normal modes,
/// with inverse rounded background and scroll-based opacity.
class ExpressiveSliverAppBar extends StatefulWidget {
  // Default collapsed toolbar height for Material 3
  static const double kToolbarHeight = _kToolbarHeight;

  /// Large variant, matching upstream SliverAppBar.large
  const ExpressiveSliverAppBar.large({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
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
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.expandedTitleTextStyle,
    this.forceElevated = false,
    this.pinned,
    this.floating,
    this.snap,
    this.stretch,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.expandedHeight,
    this.collapsedHeight,
    this.controller,
    this.background,
    this.clipBehavior,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.rounded = true,
  }) : _type = _ExpressiveSliverType.large;

  /// Medium variant, matching upstream SliverAppBar.medium
  const ExpressiveSliverAppBar.medium({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
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
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.expandedTitleTextStyle,
    this.forceElevated = false,
    this.pinned,
    this.floating,
    this.snap,
    this.stretch,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.expandedHeight,
    this.collapsedHeight,
    this.controller,
    this.background,
    this.clipBehavior,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.rounded = true,
  }) : _type = _ExpressiveSliverType.medium;

  const ExpressiveSliverAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
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
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.expandedTitleTextStyle,
    this.forceElevated = false,
    this.pinned,
    this.floating,
    this.snap,
    this.stretch,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.expandedHeight,
    this.collapsedHeight,
    this.controller,
    this.background,
    this.clipBehavior,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.rounded = true,
  }) : _type = _ExpressiveSliverType.normal;

  // Standard SliverAppBar parameters
  final _ExpressiveSliverType _type;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? Function(ScrollController?, double)? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
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
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? expandedTitleTextStyle;
  final TextStyle? titleTextStyle;
  final bool forceElevated;
  final bool? pinned;
  final bool? floating;
  final bool? snap;
  final bool? stretch;
  final double stretchTriggerOffset;
  final Future<void> Function()? onStretchTrigger;
  final double? expandedHeight;
  final double? collapsedHeight;
  final ScrollController? controller;
  final Widget? background;
  final Clip? clipBehavior;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final bool rounded;

  @override
  State<ExpressiveSliverAppBar> createState() => _ExpressiveSliverAppBarState();
}

class _ExpressiveSliverAppBarState extends State<ExpressiveSliverAppBar> {
  double _appBarOpacity = 0.0;

  ScrollController? get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _controller?.addListener(_updateAppBarOpacity);
  }

  @override
  void dispose() {
    _controller?.removeListener(_updateAppBarOpacity);
    super.dispose();
  }

  void _updateAppBarOpacity() {
    if (!mounted) return;
    if (_controller == null || !_controller!.hasClients) return;
    final double fadeStart = 0.0;
    final double fadeEnd = _kToolbarHeight;
    final double offset = _controller!.hasClients ? _controller!.offset : 0.0;
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

  double _getToolbarHeight(BuildContext context) {
    if (widget.toolbarHeight != null) {
      return widget.toolbarHeight!;
    }

    double height =
        _kToolbarHeight +
        (widget.bottom?.preferredSize.height ?? 0.0) +
        context.screenPadding.top;
    if (widget.rounded) {
      height += 24.0; // Additional space for rounded corners
    }

    return height;
  }

  @override
  Widget build(BuildContext context) {
    final commonParams = {
      'leading': widget.leading,
      'automaticallyImplyLeading': widget.automaticallyImplyLeading,
      'title': widget.title,
      'flexibleSpace': widget.flexibleSpace?.call(_controller, _appBarOpacity),
      'actions': widget.actions,
      'bottom': widget.bottom,
      'elevation': widget.elevation ?? 0.0,
      'scrolledUnderElevation': widget.scrolledUnderElevation ?? 0.0,
      'shadowColor': widget.shadowColor,
      'surfaceTintColor': widget.surfaceTintColor,
      'shape':
          widget.shape ??
          (widget.rounded
              ? const InverseRoundedRectangleBorder(
                  radius: ExpressiveAppBar.defaultRadius,
                )
              : null),
      'backgroundColor': Color.lerp(
        widget.unelevatedColor ?? context.colorScheme.surface,
        widget.backgroundColor ?? context.colorScheme.surfaceContainerHigh,
        _appBarOpacity,
      ),
      'foregroundColor': widget.foregroundColor,
      'iconTheme': widget.iconTheme,
      'actionsIconTheme': widget.actionsIconTheme,
      'primary': widget.primary,
      'centerTitle': widget.centerTitle,
      'excludeHeaderSemantics': widget.excludeHeaderSemantics,
      'titleSpacing': widget.titleSpacing ?? 8.0,
      'toolbarHeight': widget.toolbarHeight ?? _kToolbarHeight,
      'leadingWidth': widget.leadingWidth,
      'toolbarTextStyle': widget.toolbarTextStyle,
      'titleTextStyle':
          widget.titleTextStyle ??
          context.theme.textTheme.titleMedium?.apply(fontSizeDelta: 5.0),
      'expandedTitleTextStyle': widget.expandedTitleTextStyle,
      'forceElevated': widget.forceElevated,
      'pinned': widget.pinned,
      'floating': widget.floating,
      'snap': widget.snap,
      'stretch': widget.stretch,
      'stretchTriggerOffset': widget.stretchTriggerOffset,
      'onStretchTrigger': widget.onStretchTrigger,
      'expandedHeight': widget.expandedHeight,
      'collapsedHeight': widget.collapsedHeight ?? _getToolbarHeight(context),
      'clipBehavior': widget.clipBehavior,
      'systemOverlayStyle': widget.systemOverlayStyle,
      'forceMaterialTransparency': widget.forceMaterialTransparency,
      'rounded': widget.rounded,
    };
    return _buildSliverAppBar(context, commonParams);
  }

  Widget _buildSliverAppBar(BuildContext context, Map<String, dynamic> params) {
    switch (widget._type) {
      case _ExpressiveSliverType.large:
        return _buildLargeSliverAppBar(params);
      case _ExpressiveSliverType.medium:
        return _buildMediumSliverAppBar(params);
      case _ExpressiveSliverType.normal:
        return _buildNormalSliverAppBar(params);
    }
  }

  double _getBottomHeight(BuildContext context) {
    if (widget.bottom == null) {
      return 0.0;
    }
    return widget.bottom!.preferredSize.height;
  }

  Widget _buildLargeSliverAppBar(Map<String, dynamic> params) {
    return SliverAppBar.large(
      leading: params['leading'],
      automaticallyImplyLeading: params['automaticallyImplyLeading'],
      title: params['title'],
      flexibleSpace:
          params['flexibleSpace'] ??
          ScrollUnderFlexibleSpace(
            title: params['title'],
            foregroundColor: params['foregroundColor'],
            configBuilder: (context) => LargeScrollUnderFlexibleConfig(context),
            titleTextStyle:
                params['expandedTitleTextStyle'] ??
                context.theme.textTheme.headlineMedium?.apply(
                  color: context.colorScheme.onSurface,
                  fontWeightDelta: 1,
                ),
            bottomHeight: _getBottomHeight(context),
            rounded: params['rounded'],
          ),
      actions: params['actions'],
      bottom: params['bottom'],
      elevation: params['elevation'],
      scrolledUnderElevation: params['scrolledUnderElevation'],
      shadowColor: params['shadowColor'],
      surfaceTintColor: params['surfaceTintColor'],
      shape: params['shape'],
      backgroundColor: params['backgroundColor'],
      foregroundColor: params['foregroundColor'],
      iconTheme: params['iconTheme'],
      actionsIconTheme: params['actionsIconTheme'],
      primary: params['primary'],
      centerTitle: params['centerTitle'],
      excludeHeaderSemantics: params['excludeHeaderSemantics'],
      titleSpacing: params['titleSpacing'],
      toolbarHeight: params['toolbarHeight'],
      leadingWidth: params['leadingWidth'],
      toolbarTextStyle: params['toolbarTextStyle'],
      titleTextStyle: params['titleTextStyle'],
      forceElevated: params['forceElevated'],
      stretchTriggerOffset: params['stretchTriggerOffset'],
      onStretchTrigger: params['onStretchTrigger'],
      expandedHeight:
          params['expandedHeight'] ??
          LargeScrollUnderFlexibleConfig.expandedHeight,
      collapsedHeight: params['collapsedHeight'] ?? _getToolbarHeight(context),
      pinned: params['pinned'] ?? true,
      floating: params['floating'] ?? false,
      snap: params['snap'] ?? false,
      stretch: params['stretch'] ?? false,
      clipBehavior: params['clipBehavior'],
      systemOverlayStyle: params['systemOverlayStyle'],
      forceMaterialTransparency: params['forceMaterialTransparency'],
    );
  }

  Widget _buildMediumSliverAppBar(Map<String, dynamic> params) {
    return SliverAppBar.medium(
      leading: params['leading'],
      automaticallyImplyLeading: params['automaticallyImplyLeading'],
      title: params['title'],
      flexibleSpace:
          params['flexibleSpace'] ??
          ScrollUnderFlexibleSpace(
            title: params['title'],
            foregroundColor: params['foregroundColor'],
            configBuilder: (context) =>
                MediumScrollUnderFlexibleConfig(context),
            titleTextStyle:
                params['expandedTitleTextStyle'] ??
                context.theme.textTheme.headlineSmall?.apply(
                  color: context.colorScheme.onSurface,
                  fontWeightDelta: 1,
                ),
            bottomHeight: _getBottomHeight(context),
            rounded: params['rounded'],
          ),
      actions: params['actions'],
      bottom: params['bottom'],
      elevation: params['elevation'],
      scrolledUnderElevation: params['scrolledUnderElevation'],
      shadowColor: params['shadowColor'],
      surfaceTintColor: params['surfaceTintColor'],
      shape: params['shape'],
      backgroundColor: params['backgroundColor'],
      foregroundColor: params['foregroundColor'],
      iconTheme: params['iconTheme'],
      actionsIconTheme: params['actionsIconTheme'],
      primary: params['primary'],
      centerTitle: params['centerTitle'],
      excludeHeaderSemantics: params['excludeHeaderSemantics'],
      titleSpacing: params['titleSpacing'],
      toolbarHeight: params['toolbarHeight'],
      leadingWidth: params['leadingWidth'],
      toolbarTextStyle: params['toolbarTextStyle'],
      titleTextStyle: params['titleTextStyle'],
      forceElevated: params['forceElevated'],
      stretchTriggerOffset: params['stretchTriggerOffset'],
      onStretchTrigger: params['onStretchTrigger'],
      expandedHeight:
          params['expandedHeight'] ??
          MediumScrollUnderFlexibleConfig.expandedHeight,
      collapsedHeight: params['collapsedHeight'] ?? _getToolbarHeight(context),
      pinned: params['pinned'] ?? true,
      floating: params['floating'] ?? false,
      snap: params['snap'] ?? false,
      stretch: params['stretch'] ?? false,
      clipBehavior: params['clipBehavior'],
      systemOverlayStyle: params['systemOverlayStyle'],
      forceMaterialTransparency: params['forceMaterialTransparency'],
    );
  }

  Widget _buildNormalSliverAppBar(Map<String, dynamic> params) {
    return SliverAppBar(
      leading: params['leading'],
      automaticallyImplyLeading: params['automaticallyImplyLeading'],
      title: params['title'],
      actions: params['actions'],
      flexibleSpace: params['flexibleSpace'],
      bottom: params['bottom'],
      elevation: params['elevation'],
      scrolledUnderElevation: params['scrolledUnderElevation'],
      shadowColor: params['shadowColor'],
      surfaceTintColor: params['surfaceTintColor'],
      shape: params['shape'],
      backgroundColor: params['backgroundColor'],
      foregroundColor: params['foregroundColor'],
      iconTheme: params['iconTheme'],
      actionsIconTheme: params['actionsIconTheme'],
      primary: params['primary'],
      centerTitle: params['centerTitle'],
      excludeHeaderSemantics: params['excludeHeaderSemantics'],
      titleSpacing: params['titleSpacing'],
      toolbarHeight: params['toolbarHeight'],
      leadingWidth: params['leadingWidth'],
      toolbarTextStyle: params['toolbarTextStyle'],
      titleTextStyle: params['titleTextStyle'],
      forceElevated: params['forceElevated'],
      pinned: params['pinned'] ?? true,
      floating: params['floating'] ?? false,
      snap: params['snap'] ?? false,
      stretch: params['stretch'] ?? false,
      stretchTriggerOffset: params['stretchTriggerOffset'],
      onStretchTrigger: params['onStretchTrigger'],
      expandedHeight: params['expandedHeight'],
      collapsedHeight: params['collapsedHeight'] ?? _getToolbarHeight(context),
      clipBehavior: params['clipBehavior'],
      systemOverlayStyle: params['systemOverlayStyle'],
      forceMaterialTransparency: params['forceMaterialTransparency'],
    );
  }
}
