import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/continue_reading_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';

class LibraryAllTab extends StatelessWidget {
  const LibraryAllTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: context.horizontalPadding,
          sliver: SliverList.list(
            children: [
              // Continue Reading Section
              TextHeader.medium(
                title: "Continue Reading",
                actionText: Text("See more"),
                onTap: () {
                  // Navigate to all continuing works
                },
              ),

              // A single continue reading card
              ContinueReadingCard(),

              // Recently Added Section
              TextHeader.medium(
                title: "Recently Added",
                actionText: Text("View all"),
                onTap: () {
                  // Navigate to recent works
                },
              ),

              // Recent works
              _buildWorksList(4),

              // Most Read Section
              TextHeader.medium(
                title: "Most Read",
                actionText: Text("View all"),
                onTap: () {
                  // Navigate to most read works
                },
              ),

              // Most read works
              _buildWorksList(2),

              const SizedBox(height: 32),
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
