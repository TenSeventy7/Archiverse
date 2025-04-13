import 'package:flutter/material.dart';

class TrendingTagChip extends StatelessWidget {
  final String tag;
  final VoidCallback onTap;

  const TrendingTagChip({Key? key, required this.tag, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ActionChip(
      label: Text(tag),
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.7),
      side: BorderSide.none,
      onPressed: onTap,
    );
  }
}
