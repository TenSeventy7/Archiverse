import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color accentColor;

  const FolderCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surfaceContainer,
      elevation: 0,
      child: InkWell(
        onTap: () {
          // Navigate to collection
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(icon, color: accentColor, size: 24),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                "$count works",
                style: context.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
