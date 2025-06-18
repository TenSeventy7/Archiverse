import 'package:flutter/material.dart';
import 'package:archiverse/extensions/context.dart';

class SettingsBottomPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SettingsBottomPanel({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 4,
      shadowColor: Theme.of(context).shadowColor.withValues(alpha: 0.1),
      child: Padding(
        padding: padding ?? EdgeInsets.all(context.commonPaddingDouble),
        child: child,
      ),
    );
  }
}
