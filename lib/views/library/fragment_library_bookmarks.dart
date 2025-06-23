import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/collection_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryBookmarksFragment extends StatelessWidget {
  const LibraryBookmarksFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverList.list(
            children: [
              _buildCollectionsList(),

              // Recent Bookmarks
              TextHeader.medium(title: "Recent Bookmarks"),
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
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.25,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: const [
        CollectionCard(
          title: "Favorites",
          count: 42,
          icon: TablerIcons.heart,
          accentColor: Colors.red,
        ),
        CollectionCard(
          title: "To Read",
          count: 23,
          icon: TablerIcons.book_2,
          accentColor: Colors.blue,
        ),
        CollectionCard(
          title: "Harry Potter",
          count: 18,
          icon: TablerIcons.wand,
          accentColor: Colors.amber,
        ),
        CollectionCard(
          title: "Recipes",
          count: 7,
          icon: TablerIcons.chef_hat,
          accentColor: Colors.green,
        ),
      ],
    );
  }
}
