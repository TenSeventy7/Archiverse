import 'package:flutter/material.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({Key? key}) : super(key: key);

  @override
  State<LibraryFragment> createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: const Text('Library'),
          floating: true,
          snap: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
          ],
        ),
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
    );
  }
}
