import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';

class ContinueReadingCard extends StatelessWidget {
  final Work work;
  final ReadHistory history;
  const ContinueReadingCard({
    super.key,
    required this.work,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = context.textTheme;

    return Card.filled(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Add navigation to continue reading
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
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
                          work.title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          work.authors.map((author) => author.name).join(", "),
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
                      work.title[0].toUpperCase(),
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
                    "Chapter ${history.position} of ${work.totalChapters}",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    "${(history.completion * 100).toInt()}%",
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
                value: history.completion,
                borderRadius: BorderRadius.circular(24),
                backgroundColor: colorScheme.surfaceContainerLow,
                minHeight: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
