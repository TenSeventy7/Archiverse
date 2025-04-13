import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';

/// A slider control for text size adjustment
class TextSizeControl extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String? label;
  final double min;
  final double max;
  final int? divisions;

  const TextSizeControl({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.min = 0.8,
    this.max = 1.4,
    this.divisions = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: context.textTheme.titleSmall),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(
              TablerIcons.letter_a,
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: divisions,
                label: '${((value * 100).round())}%',
                onChanged: onChanged,
              ),
            ),
            Icon(
              TablerIcons.letter_a,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
