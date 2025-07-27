import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderExpandedTitleBox extends RenderShiftedBox {
  RenderExpandedTitleBox(
    this._padding,
    this._titleAlignment,
    this._maxExtent,
    super.child,
  );

  EdgeInsets get padding => _padding;
  EdgeInsets _padding;
  set padding(EdgeInsets value) {
    if (_padding == value) {
      return;
    }
    assert(value.isNonNegative);
    _padding = value;
    markNeedsLayout();
  }

  Alignment get titleAlignment => _titleAlignment;
  Alignment _titleAlignment;
  set titleAlignment(Alignment value) {
    if (_titleAlignment == value) {
      return;
    }
    _titleAlignment = value;
    markNeedsLayout();
  }

  double get maxExtent => _maxExtent;
  double _maxExtent;
  set maxExtent(double value) {
    if (_maxExtent == value) {
      return;
    }
    _maxExtent = value;
    markNeedsLayout();
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final RenderBox? child = this.child;
    return child == null
        ? 0.0
        : child.getMaxIntrinsicHeight(math.max(0, width - padding.horizontal)) +
              padding.vertical;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final RenderBox? child = this.child;
    return child == null
        ? 0.0
        : child.getMaxIntrinsicWidth(double.infinity) + padding.horizontal;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final RenderBox? child = this.child;
    return child == null
        ? 0.0
        : child.getMinIntrinsicHeight(math.max(0, width - padding.horizontal)) +
              padding.vertical;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final RenderBox? child = this.child;
    return child == null
        ? 0.0
        : child.getMinIntrinsicWidth(double.infinity) + padding.horizontal;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      child == null ? Size.zero : constraints.biggest;

  Offset _childOffsetFromSize(Size childSize, Size size) {
    assert(child != null);
    assert(padding.isNonNegative);

    // Calculate available space for the title
    final double availableHeight = maxExtent - padding.vertical;
    final double titleSpace = math.max(0, availableHeight);

    // Center the title vertically within the available space
    final double yAdjustment =
        math.max(0, (titleSpace - childSize.height) / 2) + 8.0;

    final double offsetX =
        (titleAlignment.x + 1) /
            2 *
            (size.width - padding.horizontal - childSize.width) +
        padding.left;

    final double offsetY =
        size.height - childSize.height - padding.bottom - yAdjustment;

    return Offset(offsetX, offsetY);
  }

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final RenderBox? child = this.child;
    if (child == null) {
      return null;
    }
    final BoxConstraints childConstraints = constraints
        .widthConstraints()
        .deflate(padding);
    final BaselineOffset result =
        BaselineOffset(child.getDryBaseline(childConstraints, baseline)) +
        _childOffsetFromSize(
          child.getDryLayout(childConstraints),
          getDryLayout(constraints),
        ).dy;
    return result.offset;
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child == null) {
      size = constraints.smallest;
      return;
    }
    size = constraints.biggest;
    child.layout(
      constraints.widthConstraints().deflate(padding),
      parentUsesSize: true,
    );
    final BoxParentData childParentData = child.parentData! as BoxParentData;
    childParentData.offset = _childOffsetFromSize(child.size, size);
  }
}
