import 'package:archiverse/api.dart';
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCategoryDialog extends StatefulWidget {
  final Work work;
  const AddToCategoryDialog({Key? key, required this.work}) : super(key: key);

  @override
  State<AddToCategoryDialog> createState() => _AddToCategoryDialogState();
}

class _AddToCategoryDialogState extends State<AddToCategoryDialog> {
  late Future<Map<LibraryCategory, bool>> future;

  @override
  void initState() {
    super.initState();
    future = _fetchCategories();
  }

  Future<Map<LibraryCategory, bool>> _fetchCategories() async {
    final categories = await AppApi().getAllLibraryCategories();
    final result = <LibraryCategory, bool>{};
    for (final category in categories) {
      result[category] = await AppApi().isWorkInCategory(widget.work, category);
    }
    return result;
  }

  void _showAddCategoryDialog(BuildContext context) async {
    final result = await EditCategoryDialog.show(context);
    if (result == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category added successfully')),
      );
      setState(() {
        future = _fetchCategories();
      });
    }
  }

  Future<void> _addToCategory(
    BuildContext context,
    LibraryCategory category,
  ) async {
    try {
      if (await AppApi().isWorkInCategory(widget.work, category)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${widget.work.title} is already in ${category.name}",
            ),
          ),
        );
        return;
      }
      await AppApi().addWorkToCategory(widget.work, category);
      if (context.mounted) {
        context.read<LibraryProvider>().refreshAll();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.work.title} added to ${category.name}"),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add work to category")),
        );
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
                LibraryCategory category = categories.keys.elementAt(index);
                bool isInCategory = categories[category] ?? false;

                return ListTile(
                  enabled: !isInCategory,
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
                      color: category.accentColor.withAlpha(
                        isInCategory ? 30 : 50,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      category.iconData,
                      color: category.accentColor.withAlpha(
                        !isInCategory ? 255 : 150,
                      ),
                      size: 24,
                    ),
                  ),
                  title: Text(
                    category.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: isInCategory
                          ? context.colorScheme.onSurface.withOpacity(0.6)
                          : null,
                    ),
                  ),
                  subtitle: Text(
                    isInCategory
                        ? "Already in this folder"
                        : "${category.count} works",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(
                        isInCategory ? 0.3 : 0.6,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _addToCategory(context, category);
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
          onPressed: () => _showAddCategoryDialog(context),
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
