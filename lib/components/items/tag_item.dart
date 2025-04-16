import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TagItem extends StatelessWidget {
  final Tag tag;
  final bool compact;

  const TagItem({super.key, required this.tag}) : compact = false;
  const TagItem.compact({super.key, required this.tag}) : compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tag icon with background
          _buildTagIcon(context),

          const SizedBox(width: 16.0),

          // Tag details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildTagName(context)],
            ),
          ),

          // Works count
          _buildWorksCount(context),
        ],
      ),
    );
  }

  IconData _getIconFromType(TagType type) {
    switch (type) {
      case TagType.RELATIONSHIP:
        return TablerIcons.circles_relation;
      case TagType.CHARACTER:
        return TablerIcons.user;
      case TagType.FANDOM:
        return TablerIcons.star;
      default:
        return TablerIcons.tag; // Default icon
    }
  }

  Widget _buildTagIcon(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = compact ? 38.0 : 42.0;

    return Skeleton.leaf(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            _getIconFromType(tag.type),
            size: size / 2,
            color: colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }

  Widget _buildTagName(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            tag.name,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 16.0),
        if (tag.canonical) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Tooltip(
              message: "Canonical Tag",
              child: Icon(
                TablerIcons.check,
                size: 18.0,
                color: colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ],
    );
  }

  Widget _buildWorksCount(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Skeleton.leaf(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              TablerIcons.book,
              size: 14.0,
              color: colorScheme.onTertiaryContainer,
            ),
            const SizedBox(width: 6.0),
            Text(
              _formatCount(tag.count),
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onTertiaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
