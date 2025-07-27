import 'package:flutter/material.dart';

/// A customizable animated checkmark widget that draws itself progressively
/// when selected, similar to Flutter's native ChoiceChip checkmark behavior.
class AnimatedCheckmark extends StatefulWidget {
  /// The color of the checkmark
  final Color color;

  /// The size of the checkmark (width and height)
  final double size;

  /// Whether the checkmark should be visible and animated
  final bool selected;

  /// Duration for the checkmark animation
  final Duration duration;

  /// Animation curve for the checkmark
  final Curve curve;

  /// The visual size of the checkmark
  /// This controls the thickness of the checkmark line
  final double visualSize;

  /// An optional widget to display when not selected
  final Widget? unselectedWidget;

  const AnimatedCheckmark({
    super.key,
    required this.color,
    this.size = 16.0,
    this.visualSize = 2.0,
    this.selected = false,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.fastOutSlowIn,
    this.unselectedWidget,
  });

  static Color getContrastingColor(Color color) {
    // Calculate luminance to determine if we should use black or white
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  State<AnimatedCheckmark> createState() => _AnimatedCheckmarkState();
}

class _AnimatedCheckmarkState extends State<AnimatedCheckmark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late _CheckmarkPainter _painter;
  bool _wasSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _painter = _CheckmarkPainter(
      color: widget.color,
      visualSize: widget.visualSize,
      progress: 0.0,
    );
    _wasSelected = widget.selected;

    // Start animation if initially selected
    if (widget.selected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedCheckmark oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animation duration and curve if changed
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.curve != widget.curve) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    }

    // Update painter if color changed
    if (oldWidget.color != widget.color) {
      _painter = _CheckmarkPainter(
        color: widget.color,
        visualSize: widget.visualSize,
        progress: _animation.value,
      );
    }

    // Handle selection state changes
    if (oldWidget.selected != widget.selected) {
      if (widget.selected && !_wasSelected) {
        // Becoming selected - reset and animate from start for smoothness
        _controller.reset();
        _controller.forward();
      }
      // No need to handle unselected case since we don't show the widget
      _wasSelected = widget.selected;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: widget.selected
          ? AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // Update the painter's progress instead of creating a new one
                _painter.progress = _animation.value;
                return CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _painter,
                );
              },
            )
          : widget.unselectedWidget,
    );
  }
}

class _CheckmarkPainter extends CustomPainter {
  final Color color;
  final double visualSize;
  double progress;

  _CheckmarkPainter({
    required this.color,
    required this.visualSize,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = visualSize
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final double checkSize = size.width;

    // Define the checkmark path points
    final Offset start = Offset(checkSize * 0.25, checkSize * 0.5);
    final Offset middle = Offset(checkSize * 0.45, checkSize * 0.7);
    final Offset end = Offset(checkSize * 0.75, checkSize * 0.3);

    // Create the checkmark path
    path.moveTo(start.dx, start.dy);
    path.lineTo(middle.dx, middle.dy);
    path.lineTo(end.dx, end.dy);

    // Create a PathMetric to animate the drawing
    try {
      final pathMetrics = path.computeMetrics();
      if (pathMetrics.isNotEmpty) {
        final pathMetric = pathMetrics.first;
        if (pathMetric.length >= 0) {
          final extractedPath = pathMetric.extractPath(
            0,
            pathMetric.length * progress,
          );
          canvas.drawPath(extractedPath, paint);
        }
      }
    } catch (e) {
      // Fallback: draw a simple checkmark if path computation fails
      canvas.drawLine(start, middle, paint);
      if (progress > 0.5) {
        canvas.drawLine(middle, end, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CheckmarkPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
