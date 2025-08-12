import 'package:archiverse/api.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/dialogs/folder_edit_dialog.dart';
import 'package:archiverse/dialogs/library_folder_options.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/lists/activity_folder_works.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryFoldersActivity extends CommonListActivity<LibraryFolder> {
  const LibraryFoldersActivity({super.key});
  static const String routeName = "/library/folders";

  @override
  FolderWorksActivityState createState() => FolderWorksActivityState();
}

class FolderWorksActivityState extends CommonListActivityState<LibraryFolder> {
  @override
  Future<List<LibraryFolder>> fetchItems(int page) async {
    return AppApi().getLibraryFolders(page);
  }

  @override
  EdgeInsets get padding => super.padding.copyWith(top: 0, bottom: 0);

  @override
  List<Widget> buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          _showCreateFolderDialog();
        },
      ),
    ];
  }

  @override
  Widget buildPlaceholder(BuildContext context) {
    return ItemPlaceholder(
      message: 'No folders',
      subtitle: 'Organize your works by creating folders to group them',
      icon: TablerIcons.folders,
    );
  }

  void _showCreateFolderDialog() async {
    final result = await EditFolderDialog.show(context);
    if (result == true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder created successfully')),
        );

        // Refresh the list to show the new folder
        refreshList();
      }
    }
  }

  @override
  Widget buildItemWidget(BuildContext context, LibraryFolder item, int index) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: item.accentColor.withAlpha(50),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(item.iconData, color: item.accentColor, size: 24),
      ),
      title: Text(item.name, style: context.textTheme.titleMedium),
      subtitle: Text("${item.count} works", style: context.textTheme.bodySmall),
    );
  }

  @override
  void onItemTap(LibraryFolder item) {
    context.navigator.pushNamed(FolderWorksActivity.routeName, arguments: item);
  }

  @override
  void onItemLongPress(LibraryFolder item) {
    FolderOptionsDialog.showSheet(context, folder: item);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text("Folders", maxLines: 1, overflow: TextOverflow.ellipsis);
  }

  // @override
  // double getExpandedHeight(BuildContext context) {
  //   return MediaQuery.of(context).size.height * 0.3;
  // }

  // @override
  // Widget buildExpandedAppBarWidget(BuildContext context) {
  //   final colorScheme = Theme.of(context).colorScheme;

  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // Works count subtitle
  //       Text(
  //         "Works tagged with",
  //         style: context.textTheme.labelLarge?.copyWith(
  //           color: colorScheme.onSurfaceVariant,
  //         ),
  //       ),
  //       SizedBox(height: 8),

  //       // Tag name
  //       Text(
  //         tag.name,
  //         style: context.textTheme.headlineSmall?.copyWith(
  //           fontWeight: FontWeight.w600,
  //           color: colorScheme.onSurface,
  //         ),
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //       ),

  //       SizedBox(height: 8),
  //       // Tag type and action button row
  //       Row(
  //         children: [
  //           // Tag type chip
  //           Chip(
  //             avatar: Icon(
  //               _getTagTypeIcon(tag.type),
  //               size: 16,
  //               color: colorScheme.onPrimaryContainer,
  //             ),
  //             label: Text(
  //               tag.type.toString(),
  //               style: context.textTheme.labelLarge?.copyWith(
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             backgroundColor: colorScheme.primaryContainer,
  //             side: BorderSide.none,
  //           ),

  //           Spacer(),

  //           // View tag details button
  //           ActionChip(
  //             onPressed: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 TagActivity.routeName,
  //                 arguments: tag,
  //               );
  //             },
  //             label: Text("View Tag"),
  //             avatar: Icon(TablerIcons.chevron_right, size: 18),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
