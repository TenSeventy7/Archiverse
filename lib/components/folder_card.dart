import 'package:archiverse/dialogs/library_folder_options.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/views/lists/activity_folder_works.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  final LibraryCategory category;

  const FolderCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surfaceContainer,
      elevation: 0,
      child: InkWell(
        onTap: () {
          context.navigator.pushNamed(
            FolderWorksActivity.routeName,
            arguments: category,
          );
        },
        onLongPress: () =>
            FolderOptionsDialog.showSheet(context, category: category),
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
                      color: category.accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      category.iconData,
                      color: category.accentColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                category.name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                "${category.count} works",
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
