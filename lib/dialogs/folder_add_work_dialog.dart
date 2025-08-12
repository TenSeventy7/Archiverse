import 'package:archiverse/api.dart';
import 'package:archiverse/dialogs/folder_edit_dialog.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddWorkToFolderDialog extends StatefulWidget {
  final Work work;
  const AddWorkToFolderDialog({super.key, required this.work});

  @override
  State<AddWorkToFolderDialog> createState() => _AddWorkToFolderDialogState();
}

class _AddWorkToFolderDialogState extends State<AddWorkToFolderDialog> {
  late Future<Map<LibraryFolder, bool>> future;

  @override
  void initState() {
    super.initState();
    future = _fetchCategories();
  }

  Future<Map<LibraryFolder, bool>> _fetchCategories() async {
    final categories = await AppApi().getAllLibraryFolders();
    final result = <LibraryFolder, bool>{};
    for (final folder in categories) {
      result[folder] = await AppApi().isWorkInFolder(widget.work, folder);
    }
    return result;
  }

  void _showAddFolderDialog(BuildContext context) async {
    final result = await EditFolderDialog.show(context);
    if (result == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Folder added successfully')),
      );
      setState(() {
        future = _fetchCategories();
      });
    }
  }

  Future<void> _addToFolder(BuildContext context, LibraryFolder folder) async {
    try {
      if (await AppApi().isWorkInFolder(widget.work, folder)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.work.title} is already in ${folder.name}"),
          ),
        );
        return;
      }
      await AppApi().addWorkToFolder(widget.work, folder);
      if (context.mounted) {
        context.read<LibraryProvider>().refreshAll();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.work.title} added to ${folder.name}"),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to add work to folder")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add to folder"),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      content: SizedBox(
        width: double.maxFinite,
        child: EnhancedFutureBuilder(
          future: future,
          rememberFutureResult: false,
          whenDone: (categories) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                LibraryFolder folder = categories.keys.elementAt(index);
                bool isInFolder = categories[folder] ?? false;

                return ListTile(
                  enabled: !isInFolder,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: folder.accentColor.withAlpha(isInFolder ? 30 : 50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      folder.iconData,
                      color: folder.accentColor.withAlpha(
                        !isInFolder ? 255 : 150,
                      ),
                      size: 24,
                    ),
                  ),
                  title: Text(
                    folder.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: isInFolder
                          ? context.colorScheme.onSurface.withOpacity(0.6)
                          : null,
                    ),
                  ),
                  subtitle: Text(
                    isInFolder
                        ? "Already in this folder"
                        : "${folder.count} works",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(
                        isInFolder ? 0.3 : 0.6,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _addToFolder(context, folder);
                  },
                );
              },
            );
          },
          whenNotDone: const Center(child: CircularProgressIndicator()),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _showAddFolderDialog(context),
          child: const Text("Create folder"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
