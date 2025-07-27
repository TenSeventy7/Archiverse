import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/continue_reading_card.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:archiverse/views/lists/activity_library_works.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class LibraryAllFragment extends StatefulWidget {
  const LibraryAllFragment({super.key, this.controller});
  final ScrollController? controller;

  @override
  State<LibraryAllFragment> createState() => _LibraryAllFragmentState();
}

class _LibraryAllFragmentState extends State<LibraryAllFragment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LibraryProvider>().refreshAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<LibraryProvider>().refreshAll();
      },
      child: CustomScrollView(
        controller: widget.controller,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverPadding(
            padding: context.horizontalPadding,
            sliver: SliverList.list(
              children: [
                // Continue reading card
                ContinueReadingCard(),

                // Recently Added Section
                TextHeader.medium(
                  title: "Recently Added",
                  actionText: Text("View all"),
                  onTap: () {
                    context.navigator.pushNamed(LibraryWorksActivity.routeName);
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

                // Most Read Section
                TextHeader.medium(
                  title: "Most Read",
                  actionText: Text("View all"),
                  onTap: () {
                    // Navigate to most read works
                  },
                ),

                // Most read works
                Consumer<LibraryProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoadingMostRead) {
                      return _buildLoadingList(2);
                    }

                    return _buildWorksList(
                      provider.mostReadWorks.take(2).toList(),
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
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

    return Column(
      children: works.map((work) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: WorkCard(work: work),
        );
      }).toList(),
    );
  }

  Widget _buildLoadingList(int count) {
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: WorkCard(work: Fillers.work), // Use placeholder while loading
        );
      }),
    );
  }
}
