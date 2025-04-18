import 'package:flutter/material.dart';

abstract class BaseCard<T> extends StatelessWidget {
  final T item;
  final double? elevation;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;

  const BaseCard({
    super.key,
    required this.item,
    this.elevation,
    this.contentPadding = const EdgeInsets.all(16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onTap(context),
        onLongPress: onLongPress != null ? () => onLongPress!(context) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(context),
            Padding(padding: contentPadding, child: buildContent(context)),
            buildFooter(context),
          ],
        ),
      ),
    );
  }

  // Required implementation
  Widget buildContent(BuildContext context);

  // Optional implementations with default behavior
  Widget buildHeader(BuildContext context) => const SizedBox.shrink();
  Widget buildFooter(BuildContext context) => const SizedBox.shrink();
  void onTap(BuildContext context) {
    // Default navigation behavior
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushNamed(getRouteName(), arguments: item);
  }

  Function(BuildContext)? get onLongPress => null;
  String getRouteName() => '';
}
