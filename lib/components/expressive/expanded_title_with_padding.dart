import 'package:archiverse/components/expressive/render_expanded_title_box.dart';
import 'package:flutter/material.dart';

class ExpandedTitleWithPadding extends SingleChildRenderObjectWidget {
  const ExpandedTitleWithPadding({
    super.key,
    required this.padding,
    required this.maxExtent,
    super.child,
  });

  final EdgeInsetsGeometry padding;
  final double maxExtent;

  @override
  RenderExpandedTitleBox createRenderObject(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    return RenderExpandedTitleBox(
      padding.resolve(textDirection),
      AlignmentDirectional.bottomStart.resolve(textDirection),
      maxExtent,
      null,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderExpandedTitleBox renderObject,
  ) {
    final TextDirection textDirection = Directionality.of(context);
    renderObject
      ..padding = padding.resolve(textDirection)
      ..titleAlignment = AlignmentDirectional.bottomStart.resolve(textDirection)
      ..maxExtent = maxExtent;
  }
}
