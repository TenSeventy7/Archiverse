import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/storage_info_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';

class LibraryDownloadsFragment extends StatelessWidget {
  const LibraryDownloadsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
