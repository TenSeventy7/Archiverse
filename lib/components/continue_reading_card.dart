import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/providers/provider_read_history.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContinueReadingCard extends StatefulWidget {
  const ContinueReadingCard({super.key, this.showHeader = false});

  final bool showHeader;

  @override
  State<ContinueReadingCard> createState() => _ContinueReadingCardState();
}

class _ContinueReadingCardState extends State<ContinueReadingCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadHistoryProvider>(
      builder: (context, provider, child) {
        if (!provider.isLoading && provider.mostRecentHistory == null) {
          return const SizedBox.shrink(); // No recent history to display
        }

        return Skeletonizer(
          enabled: provider.isLoading,
          child: Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Column(
              children: [
                if (widget.showHeader) ...[
                  TextHeader.medium(title: "Continue Reading"),
                ],
                _buildCard(
                  context,
                  provider.isLoading
                      ? Fillers.history
                      : provider.mostRecentHistory!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Card _buildCard(BuildContext context, ReadHistory readHistory) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Card.filled(
      color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.navigator.pushNamed(
            ReaderActivity.routeName,
            arguments: {
              "work": readHistory.work,
              "chapter": readHistory.chapter,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with title and badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side with title and author
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Continue reading",
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.tertiary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        WorkItem.mini(work: readHistory.work),
                      ],
                    ),
                  ),

                  // Initial letter badge
                  Skeleton.leaf(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryFixedDim.withAlpha(60),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        readHistory.work.title[0].toUpperCase(),
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Chapter progress section
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    readHistory.chapter != null
                        ? "Chapter ${readHistory.chapter!.chapter} of ${readHistory.work.totalChapters ?? '?'}"
                        : readHistory.work.oneshot
                        ? "One-shot"
                        : "Chapter 1 of ${readHistory.work.totalChapters ?? '?'}",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    "${(readHistory.completion * 100).toInt()}%",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Custom styled progress indicator
              const SizedBox(height: 8.0),
              Skeleton.unite(
                child: LinearProgressIndicator(
                  value: readHistory.completion,
                  borderRadius: BorderRadius.circular(24),
                  color: colorScheme.tertiary,
                  stopIndicatorColor: colorScheme.tertiaryFixed,
                  backgroundColor: colorScheme.tertiaryFixedDim.withAlpha(60),
                  minHeight: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
