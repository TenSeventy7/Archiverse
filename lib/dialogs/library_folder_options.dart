/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/dialogs/folder_edit_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class _FolderOptionsDialog extends StatefulWidget {
  final LibraryFolder folder;
  final BuildContext context;
  const _FolderOptionsDialog({required this.folder, required this.context});

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
                    final folder = widget.folder;
                    context.navigator.pop();
                    _showEditFolderDialog(widget.context, folder);
                  },
                ),

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.trash,
                  title: "Delete folder",
                  onTap: () {
                    final folder = widget.folder;
                    context.navigator.pop();
                    _showDeleteFolderDialog(folder);
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
                  color: widget.folder.accentColor.withAlpha(50),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  widget.folder.iconData,
                  color: widget.folder.accentColor,
                  size: 32,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.folder.name,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${widget.folder.count} works",
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
          : colorScheme.surfaceContainerLowest,
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

  void _showEditFolderDialog(BuildContext context, LibraryFolder folder) async {
    final result = await EditFolderDialog.show(context, folder: folder);
    if (result == true) {
      if (context.mounted) {
        context.read<LibraryProvider>().refreshFolders();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder updated successfully')),
        );
      }
    }
  }

  void _showDeleteFolderDialog(LibraryFolder folder) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            TablerIcons.folder_cancel,
            size: 28.0,
            color: context.colorScheme.secondary,
          ),
          title: const Text('Delete this folder?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to delete this folder? This action cannot be undone.',
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 48.0,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          await _deleteFolder(widget.context, folder);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: context.colorScheme.error,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: const Text('Delete folder'),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      height: 48.0,
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteFolder(BuildContext context, LibraryFolder folder) async {
    Navigator.pop(context);
    try {
      await context.read<LibraryProvider>().deleteFolder(folder);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder deleted successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting folder: $e')));
      }
    }
  }
}

class FolderOptionsDialog {
  static void showSheet(
    BuildContext context, {
    required LibraryFolder folder,
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
        folder: folder,
        context: Navigator.of(context, rootNavigator: true).context,
      ),
    );
  }
}
