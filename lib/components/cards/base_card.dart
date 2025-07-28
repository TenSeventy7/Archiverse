import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

abstract class BaseCard<T> extends StatelessWidget {
  final T item;
  final double? elevation;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final bool isSelectable;

  const BaseCard({
    super.key,
    required this.item,
    this.elevation,
    this.contentPadding = const EdgeInsets.all(16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.isSelectable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: context.colorScheme.surfaceContainerLowest,
      elevation: elevation ?? 0.0,
      margin: EdgeInsets.zero,
      child: isSelectable
          ? InkWell(
              borderRadius: borderRadius,
              onTap: () => onTap(context),
              onLongPress: onLongPress != null
                  ? () => onLongPress!(context)
                  : null,
              child: _buildCardContent(context),
            )
          : _buildCardContent(context),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeader(context),
        Padding(padding: contentPadding, child: buildContent(context)),
        buildFooter(context),
      ],
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
