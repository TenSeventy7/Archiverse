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
              children: [
                // Tag name and canonical indicator
                _buildTagName(context),

                if (!compact && tag.parents.isNotEmpty) ...[
                  const SizedBox(height: 6.0),
                  _buildParentTags(context),
                ],
              ],
            ),
          ),

          // Works count
          _buildWorksCount(context),
        ],
      ),
    );
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
            TablerIcons.tag,
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
        if (tag.canonical)
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
      ],
    );
  }

  Widget _buildParentTags(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        for (var parent in tag.parents.take(2))
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.6),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  TablerIcons.arrow_up,
                  size: 12.0,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 4.0),
                Text(
                  parent.name,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        if (tag.parents.length > 2)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.4),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              "+${tag.parents.length - 2} more",
              style: context.textTheme.labelSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
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
