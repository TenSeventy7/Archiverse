import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

typedef ExpressiveNestedScrollViewHeaderSliversBuilder =
    List<Widget> Function(
      BuildContext context,
      bool innerBoxIsScrolled,
      ScrollController controller,
    );

/// A NestedScrollView with expressive background and scroll controller logic, similar to ExpressiveScaffold.
class ExpressiveNestedScrollView extends StatefulWidget {
  const ExpressiveNestedScrollView({
    super.key,
    this.headerSliverBuilder,
    this.body,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
    this.floatHeaderSlivers = false,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.background,
    this.backgroundDecoration,
    this.backgroundClipBehavior = Clip.hardEdge,
    this.appBarHeight,
  });

  final ExpressiveNestedScrollViewHeaderSliversBuilder? headerSliverBuilder;
  final Widget? body;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final DragStartBehavior dragStartBehavior;
  final bool floatHeaderSlivers;
  final Clip clipBehavior;
  final String? restorationId;

  // Expressive additions
  final Widget? background;
  final Decoration? backgroundDecoration;
  final Clip backgroundClipBehavior;
  final double? appBarHeight;

  @override
  State<ExpressiveNestedScrollView> createState() =>
      _ExpressiveNestedScrollViewState();
}

class _ExpressiveNestedScrollViewState
    extends State<ExpressiveNestedScrollView> {
  late final ScrollController _internalController;
  ScrollController get _controller => widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = ScrollController();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a single Container for background, borderRadius, and clip, matching CommonDetailActivity
    return NestedScrollView(
      controller: _controller,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        final builder = widget.headerSliverBuilder;
        if (builder != null) {
          // Pass controller as third argument
          return builder(context, innerBoxIsScrolled, _controller);
        }
        return <Widget>[];
      },
      body: widget.body ?? SizedBox(),
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      physics: widget.physics,
      dragStartBehavior: widget.dragStartBehavior,
      floatHeaderSlivers: widget.floatHeaderSlivers,
      clipBehavior: widget.clipBehavior,
      restorationId: widget.restorationId,
    );
  }
}
