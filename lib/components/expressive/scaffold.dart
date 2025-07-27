import 'package:archiverse/extensions/context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// An implementation of the Material Scaffold widget that provides a design
/// similar to that of Material 3 Expressive, which was introduced in April 2025
/// but hasn't been implemented in Flutter yet.
///
/// This widget is recommended for use with the [ExpressiveAppBar] widget.

// Default toolbar height for Material 3
const double _kToolbarHeight = 64.0;

class ExpressiveScaffold extends StatefulWidget {
  const ExpressiveScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.restorationId,
    this.nested = false,
    this.rounded = true,
  });

  const ExpressiveScaffold.nested({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.restorationId,
    this.rounded = true,
  }) : nested = true;

  final PreferredSizeWidget? Function(ScrollController)? appBar;
  final Widget? Function(ScrollController)? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final DragStartBehavior drawerDragStartBehavior;
  final String? restorationId;
  final bool nested;
  final bool rounded;

  @override
  State<ExpressiveScaffold> createState() => _ExpressiveScaffoldState();
}

class _ExpressiveScaffoldState extends State<ExpressiveScaffold> {
  late final ScrollController _scrollController;
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateAppBarOpacity);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateAppBarOpacity() {
    if (!mounted) return;
    if (!_scrollController.hasClients) return;

    // Adjust these values as needed for your design
    final double fadeStart = 0.0;
    final double fadeEnd = _kToolbarHeight;
    final double offset = _scrollController.hasClients
        ? _scrollController.offset
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

  double _getAppBarHeight(BuildContext context) {
    final appBar = widget.appBar?.call(_scrollController);
    if (appBar != null) {
      return appBar.preferredSize.height +
          context.screenPadding.top; // Include top padding for status bar
    }
    return _kToolbarHeight + context.screenPadding.top;
  }

  @override
  Widget build(BuildContext context) {
    bool nested = widget.nested;

    // We can assume that if `widget.appBar` is null, then it's a Scaffold that uses
    // a NestedScrollView and uses a sliver header inside; there's just some use cases
    // where the app bar is not sliver-based (i.e. the default) but needs to have
    // the rounded container effect.
    bool sliverHeader = widget.appBar == null;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: !nested || sliverHeader
          ? Container(
              margin: !sliverHeader
                  ? EdgeInsets.only(
                      top:
                          _getAppBarHeight(context) -
                          (widget.rounded ? 24.0 : 0.0),
                    )
                  : null,
              child: widget.body != null
                  ? widget.body!(_scrollController)
                  : null,
            )
          : widget.body != null
          ? widget.body!(_scrollController)
          : SizedBox.shrink(),
      backgroundColor: widget.backgroundColor ?? _getBackgroundColor(context),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      persistentFooterAlignment: widget.persistentFooterAlignment,
      drawer: widget.drawer,
      onDrawerChanged: widget.onDrawerChanged,
      endDrawer: widget.endDrawer,
      onEndDrawerChanged: widget.onEndDrawerChanged,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      restorationId: widget.restorationId,
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    if (widget.appBar == null) return null;
    return widget.appBar!(_scrollController);
  }

  Color? _getBackgroundColor(BuildContext context) {
    if (!widget.nested) return null;

    return Color.lerp(
      context.theme.colorScheme.surfaceContainer,
      context.theme.colorScheme.surfaceContainerHigh,
      _appBarOpacity,
    );
  }
}
