import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_read_history.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinueReadingCard extends StatefulWidget {
  const ContinueReadingCard({super.key});

  @override
  State<ContinueReadingCard> createState() => _ContinueReadingCardState();
}

class _ContinueReadingCardState extends State<ContinueReadingCard> {
  @override
  void initState() {
    super.initState();
    // Load most recent history when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReadHistoryProvider>().loadMostRecentHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadHistoryProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SizedBox.shrink();
        }

        final readHistory = provider.mostRecentHistory;
        if (readHistory == null) {
          return const SizedBox.shrink();
        }

        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = context.textTheme;

        return Card.filled(
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 18.0,
              ),
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
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              readHistory.work.title,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              readHistory.work.authors
                                  .map((author) => author.name)
                                  .join(", "),
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      // Initial letter badge
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withAlpha(50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          readHistory.work.title[0].toUpperCase(),
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
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
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Custom styled progress indicator
                  const SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value: readHistory.completion,
                    borderRadius: BorderRadius.circular(24),
                    backgroundColor: colorScheme.surfaceContainerLow,
                    minHeight: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
