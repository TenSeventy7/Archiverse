import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BaseSuggestions<T, C extends Widget> extends StatelessWidget {
  final List<T> items;
  final bool loading;
  final Widget? header;
  final Widget? footer;
  final double? elevation;
  final int maxItems;

  const BaseSuggestions({
    super.key,
    required this.items,
    required this.loading,
    this.header,
    this.footer,
    this.elevation,
    required this.maxItems,
  });

  @override
  Widget build(BuildContext context) {
    List<T> trimmed = items.take(maxItems).toList();
    return Visibility(
      visible: trimmed.isNotEmpty,
      replacement: const SizedBox(),
      child: Skeletonizer(
        enabled: loading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            header ?? const SizedBox(),
            ...trimmed.map((item) => buildCard(item, elevation ?? 1)),
            footer ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  // Abstract method to be implemented by subclasses
  C buildCard(T item, double elevation);
}
