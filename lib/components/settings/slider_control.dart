import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

/// A titled slider control for general numeric settings
class SliderControl extends StatelessWidget {
  final String title;
  final IconData icon;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;

  const SliderControl({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
    this.min = 0.8,
    this.max = 2.0,
    this.divisions = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.horizontalPadding,
          child: Row(
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: context.textTheme.titleSmall)),
              Text(
                '${(value * 100).toInt()}%',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
