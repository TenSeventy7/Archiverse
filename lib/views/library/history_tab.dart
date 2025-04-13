import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';

class LibraryHistoryTab extends StatelessWidget {
  const LibraryHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverList.list(
            children: [
              // Today Section
              TextHeader.medium(title: "Today"),
              _buildWorksList(2),

              // Yesterday Section
              TextHeader.medium(title: "Yesterday"),
              _buildWorksList(3),

              // Last Week Section
              TextHeader.medium(title: "Last Week"),
              _buildWorksList(3),
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
