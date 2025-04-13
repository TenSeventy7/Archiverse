import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

class DiscoverFragment extends StatefulWidget {
  const DiscoverFragment({Key? key}) : super(key: key);

  @override
  _DiscoverFragmentState createState() => _DiscoverFragmentState();
}

class _DiscoverFragmentState extends State<DiscoverFragment> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar.large(
            title: const Text('Discover'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Handle search action
                },
              ),
            ],
          ),
        ];
      },
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {
                    // Handle item tap
                  },
                );
              },
              childCount: 20, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
