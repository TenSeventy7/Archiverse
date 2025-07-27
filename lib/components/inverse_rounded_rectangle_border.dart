import 'package:flutter/material.dart';

class InverseRoundedRectangleBorder extends ShapeBorder {
  final double radius;

  const InverseRoundedRectangleBorder({this.radius = 28.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    // Create the main rectangle
    path.addRect(rect);

    // Create the inverse rounded bottom
    final roundedRect = RRect.fromLTRBAndCorners(
      rect.left,
      rect.bottom - radius,
      rect.right,
      rect.bottom,
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    // Subtract the rounded area to create the cutout
    path.addRRect(roundedRect);
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // No additional painting needed
  }

  @override
  ShapeBorder scale(double t) {
    return InverseRoundedRectangleBorder(radius: radius * t);
  }
}
