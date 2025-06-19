import 'package:archiverse/api.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:flutter/material.dart';

class ContinueReadingCard extends StatefulWidget {
  const ContinueReadingCard({super.key});

  @override
  State<ContinueReadingCard> createState() => _ContinueReadingCardState();
}

class _ContinueReadingCardState extends State<ContinueReadingCard> {
  ReadHistory? _readHistory;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReadHistory();
  }

  Future<void> _loadReadHistory() async {
    try {
      final history = await AppApi().getMostRecentReadHistory();
      if (mounted) {
        setState(() {
          _readHistory = history;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _readHistory = null;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink();
    }

    if (_readHistory == null) {
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
              "work": _readHistory!.work,
              "chapter": _readHistory!.chapter,
            },
          );
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
                          _readHistory!.work.title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          _readHistory!.work.authors
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
                      _readHistory!.work.title[0].toUpperCase(),
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
                    _readHistory!.chapter != null
                        ? "Chapter ${_readHistory!.chapter!.chapter} of ${_readHistory!.work.totalChapters ?? '?'}"
                        : _readHistory!.work.oneshot
                        ? "One-shot"
                        : "Chapter 1 of ${_readHistory!.work.totalChapters ?? '?'}",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    "${(_readHistory!.completion * 100).toInt()}%",
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
                value: _readHistory!.completion,
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
