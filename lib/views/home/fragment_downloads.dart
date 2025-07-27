import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/storage_info_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryDownloadsFragment extends StatelessWidget {
  const LibraryDownloadsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      appBar: (controller) => ExpressiveAppBar(
        controller: controller,
        titleSpacing: 16.0,
        title: Text('Downloads'),
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
      ),
      body: (controller) => _buildBody(context, controller),
    );
  }

  Widget _buildBody(BuildContext context, ScrollController controller) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 16),

              // Storage info card
              const StorageInfoCard(
                usedPercentage: 0.34,
                usedSpace: "1.7 GB",
                totalSpace: "5.0 GB",
              ),

              // Downloads section
              TextHeader.medium(title: "Downloaded works"),
              _buildWorksList(6),
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
}
