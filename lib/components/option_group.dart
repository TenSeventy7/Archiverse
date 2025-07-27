import 'package:archiverse/components/option_tile.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/extensions/context.dart';

class OptionGroup extends StatelessWidget {
  final String? title;
  final List<OptionTile> children;

  const OptionGroup({super.key, this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              title!,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
        Card.filled(
          clipBehavior: Clip.antiAlias,
          color: context.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.0,
            children: _buildChildrenWithDividers(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChildrenWithDividers(BuildContext context) {
    final result = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
    }

    return result;
  }
}
