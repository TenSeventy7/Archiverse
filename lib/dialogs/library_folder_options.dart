/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class _FolderOptionsDialog extends StatefulWidget {
  final LibraryCategory category;
  final BuildContext context;
  const _FolderOptionsDialog({required this.category, required this.context});

  @override
  State<_FolderOptionsDialog> createState() => _FolderOptionsDialogState();
}

class _FolderOptionsDialogState extends State<_FolderOptionsDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context),

        // Primary actions
        Container(
          margin: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent, // or your desired color
            child: Column(
              children: [
                _buildActionTile(
                  context,
                  icon: TablerIcons.pencil,
                  title: "Edit folder",
                  onTap: () {
                    final category = widget.category;
                    context.navigator.pop();
                    _showEditCategoryDialog(widget.context, category);
                  },
                ),

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.trash,
                  title: "Delete folder",
                  onTap: () {
                    final category = widget.category;
                    context.navigator.pop();
                    _showDeleteCategoryDialog(category);
                  },
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: context.screenPadding.bottom + context.commonPadding),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16.0,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: widget.category.accentColor.withAlpha(50),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  widget.category.iconData,
                  color: widget.category.accentColor,
                  size: 32,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category.name,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${widget.category.count} works",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    IconData? icon,
    String? textIcon,
    required String title,
    String? subtitle,
    Widget? trailing,
    bool isHighlighted = false,
    bool isLoading = false,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    // Ensure only either textIcon or icon is used
    if (icon != null && textIcon != null) {
      throw ArgumentError('Only one of icon or textIcon should be provided.');
    }

    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      tileColor: isHighlighted
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerLow,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isHighlighted
              ? colorScheme.primaryContainer
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? CircularProgressIndicator(
                padding: EdgeInsets.all(8.0),
                strokeWidth: 3.0,
                color: isHighlighted
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurface,
              )
            : textIcon != null
            ? Text(
                textIcon,
                style: context.textTheme.titleMedium
                    ?.copyWith(
                      color: isHighlighted
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    )
                    .apply(fontSizeDelta: 1.0),
              )
            : Icon(
                icon,
                size: 20,
                color: isHighlighted
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurface,
              ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: isHighlighted ? colorScheme.primary : null,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: context.textTheme.bodySmall)
          : null,
      trailing: trailing,
    );
  }

  Widget _buildDivider() {
    return const SizedBox(height: 4.0);
  }

  void _showEditCategoryDialog(
    BuildContext context,
    LibraryCategory category,
  ) async {
    final result = await EditCategoryDialog.show(context, category: category);
    if (result == true) {
      if (context.mounted) {
        context.read<LibraryProvider>().refreshCategories();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category updated successfully')),
        );
      }
    }
  }

  void _showDeleteCategoryDialog(LibraryCategory category) {
    showDialog(
      context: widget.context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category'),
        content: Text('Are you sure you want to delete "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(widget.context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _deleteCategory(widget.context, category);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCategory(
    BuildContext context,
    LibraryCategory category,
  ) async {
    Navigator.pop(context);
    try {
      await context.read<LibraryProvider>().deleteCategory(category);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category deleted successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting category: $e')));
      }
    }
  }
}

class FolderOptionsDialog {
  static void showSheet(
    BuildContext context, {
    required LibraryCategory category,
    AnimationController? bottomSheetAnimator,
  }) {
    showModalBottomSheet<void>(
      context: Navigator.of(context, rootNavigator: true).context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      transitionAnimationController: bottomSheetAnimator,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (BuildContext _) => _FolderOptionsDialog(
        category: category,
        context: Navigator.of(context, rootNavigator: true).context,
      ),
    );
  }
}
