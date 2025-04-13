import 'package:flutter/material.dart';
import 'package:archiverse/extensions/context.dart';

class SettingsBottomPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SettingsBottomPanel({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(context.commonPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: child,
    );
  }
}
