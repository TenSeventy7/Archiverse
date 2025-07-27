import 'package:archiverse/api.dart';
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/extensions/api_library.dart';
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
  late Future<List<LibraryCategory>> future;

  @override
  void initState() {
    super.initState();
    future = _fetchCategories();
  }

  Future<List<LibraryCategory>> _fetchCategories() async {
    return await AppApi().getAllLibraryCategories();
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
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: categories[index].accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      categories[index].iconData,
                      color: categories[index].accentColor,
                      size: 24,
                    ),
                  ),
                  title: Text(categories[index].name),
                  onTap: () {
                    Navigator.of(context).pop();
                    _addToCategory(context, categories[index]);
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
          child: const Text("Add folder"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
