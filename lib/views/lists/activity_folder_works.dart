import 'package:archiverse/api.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_folder.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class FolderWorksActivity extends CommonListActivity<Work> {
  const FolderWorksActivity({super.key, required this.folder});
  static const String routeName = "/folder/works";
  final LibraryFolder folder;

  @override
  FolderWorksActivityState createState() => FolderWorksActivityState();
}

class FolderWorksActivityState extends CommonListActivityState<Work> {
  LibraryFolder get folder => (widget as FolderWorksActivity).folder;

  @override
  Future<List<Work>> fetchItems(int page) async {
    return await AppApi().getWorksByFolder(folder);
  }

  @override
  Widget buildItemWidget(BuildContext context, Work item, int index) {
    return WorkItem(work: item, folder: folder);
  }

  @override
  void onItemTap(Work item) {
    context.navigator.pushNamed(WorkActivity.routeName, arguments: item);
  }

  @override
  Widget buildPlaceholder(BuildContext context) {
    return ItemPlaceholder(
      message: 'No works',
      subtitle: 'Add works to this folder to see them here',
      icon: TablerIcons.folder,
    );
  }

  @override
  void onItemLongPress(Work item) {
    WorkOptionsDialog.showSheet(
      context,
      work: item,
      folder: folder,
      onWorkRemovedFromFolder: refreshList,
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(folder.name, maxLines: 1, overflow: TextOverflow.ellipsis);
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
