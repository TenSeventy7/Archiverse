import 'package:archiverse/api.dart';
import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/folder_card.dart';
import 'package:archiverse/components/icon_selector.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibrarySavedFragment extends StatefulWidget {
  const LibrarySavedFragment({super.key, this.controller});
  final ScrollController? controller;

  @override
  State<LibrarySavedFragment> createState() => _LibrarySavedFragmentState();
}

class _LibrarySavedFragmentState extends State<LibrarySavedFragment> {
  List<LibraryCategory> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() => _isLoading = true);
    try {
      final categories = await AppApi().getLibraryCategories();
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading categories: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverList.list(
            children: [
              TextHeader.medium(title: "Folders"),
              _buildCollectionsList(),

              // Recent Works
              TextHeader.medium(title: "Recent Works"),
              _buildWorksList(5),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorksList(int count) {
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: WorkCard(work: Fillers.work),
        );
      }),
    );
  }

  Widget _buildCollectionsList() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Add "Add Category" card at the end
    final displayItems = [
      ..._categories,
      null, // This will be the "Add Category" card
    ];

    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.25,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: displayItems.map((category) {
        if (category == null) {
          return _buildAddCategoryCard();
        }
        return _buildCategoryCard(category);
      }).toList(),
    );
  }

  Widget _buildCategoryCard(LibraryCategory category) {
    return GestureDetector(
      onLongPress: () => _showCategoryOptions(category),
      child: FolderCard(
        title: category.name,
        count: category.count,
        icon: category.iconData,
        accentColor: category.accentColor,
      ),
    );
  }

  Widget _buildAddCategoryCard() {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: _showAddCategoryDialog,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              TablerIcons.plus,
              size: 32,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(height: 8),
            Text(
              'Add Folder',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryOptions(LibraryCategory category) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(TablerIcons.edit),
            title: const Text('Edit Category'),
            onTap: () {
              Navigator.pop(context);
              _showEditCategoryDialog(category);
            },
          ),
          ListTile(
            leading: const Icon(TablerIcons.trash),
            title: const Text('Delete Category'),
            onTap: () {
              Navigator.pop(context);
              _showDeleteCategoryDialog(category);
            },
          ),
        ],
      ),
    );
  }

  void _showAddCategoryDialog() async {
    final result = await EditCategoryDialog.show(context);
    if (result == true) {
      await _loadCategories();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category added successfully')),
        );
      }
    }
  }

  void _showEditCategoryDialog(LibraryCategory category) async {
    final result = await EditCategoryDialog.show(context, category: category);
    if (result == true) {
      await _loadCategories();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category updated successfully')),
        );
      }
    }
  }

  void _showDeleteCategoryDialog(LibraryCategory category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category'),
        content: Text('Are you sure you want to delete "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteCategory(category);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCategory(LibraryCategory category) async {
    try {
      await AppApi().deleteLibraryCategory(category);
      await _loadCategories();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category deleted successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting category: $e')));
      }
    }
  }
}
