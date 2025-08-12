import 'package:archiverse/components/folder_card.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:archiverse/views/lists/activity_library_folders.dart';
import 'package:archiverse/views/lists/activity_library_works.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class LibrarySavedFragment extends StatefulWidget {
  const LibrarySavedFragment({super.key, this.controller});
  final ScrollController? controller;

  @override
  State<LibrarySavedFragment> createState() => _LibrarySavedFragmentState();
}

class _LibrarySavedFragmentState extends State<LibrarySavedFragment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LibraryProvider>().refreshAll();
    });
  }

  // Also refresh categories when the fragment is reloaded
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LibraryProvider>().refreshFolders();
    });
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
              TextHeader.medium(
                title: "Folders",
                actionText: Text("View all"),
                onTap: () {
                  context.navigator
                      .pushNamed(LibraryFoldersActivity.routeName)
                      .then((_) {
                        if (!context.mounted) return;
                        context.read<LibraryProvider>().refreshFolders();
                      });
                },
              ),
              Consumer<LibraryProvider>(
                builder: (context, libraryProvider, child) {
                  return _buildCollectionsList(libraryProvider);
                },
              ),

              // Recent Works
              TextHeader.medium(
                title: "Recent Works",
                actionText: Text("View all"),
                onTap: () {
                  context.navigator
                      .pushNamed(LibraryWorksActivity.routeName)
                      .then((_) {
                        if (context.mounted) {
                          context.read<LibraryProvider>().refreshAll();
                        }
                      });
                },
              ),
              // Recent works
              Consumer<LibraryProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoadingRecentlyAdded) {
                    return _buildLoadingList(4);
                  }

                  return _buildWorksList(
                    provider.recentlyAddedWorks.take(4).toList(),
                  );
                },
              ),
              SizedBox(height: context.commonPaddingDouble),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingList(int count) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildWorksList(List<Work> works) {
    if (works.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: ItemPlaceholder.small(
            icon: TablerIcons.book,
            subtitle: "Add works to your library to see them here",
          ),
        ),
      );
    }

    return WorkSuggestions(works: works, loading: false);
  }

  Widget _buildCollectionsList(LibraryProvider provider) {
    if (provider.isLoadingFolders) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Add "Add Category" card at the end
    final displayItems = [
      ...provider.folders.take(5),
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
        return FolderCard(category: category);
      }).toList(),
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

  void _showAddCategoryDialog() async {
    final result = await EditCategoryDialog.show(context);
    if (result == true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category added successfully')),
        );
      }
    }
  }
}
