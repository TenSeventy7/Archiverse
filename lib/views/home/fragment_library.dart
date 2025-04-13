import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/library/all_tab.dart';
import 'package:archiverse/views/library/bookmarks_tab.dart';
import 'package:archiverse/views/library/downloads_tab.dart';
import 'package:archiverse/views/library/history_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({Key? key}) : super(key: key);

  @override
  State<LibraryFragment> createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['All', 'Bookmarks', 'History', 'Downloads'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text('Library'),
            pinned: true,
            floating: true,
            shape: RoundedRectangleBorder(),
            forceElevated: innerBoxIsScrolled,
            actions: [
              IconButton(
                icon: const Icon(TablerIcons.search),
                onPressed: () {
                  // Handle search action
                },
                tooltip: 'Search your library',
              ),
              IconButton(
                icon: const Icon(TablerIcons.adjustments),
                onPressed: () {
                  // Handle filter/sort action
                },
                tooltip: 'Filter and sort',
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          LibraryAllTab(),
          LibraryBookmarksTab(),
          LibraryHistoryTab(),
          LibraryDownloadsTab(),
        ],
      ),
    );
  }
}
