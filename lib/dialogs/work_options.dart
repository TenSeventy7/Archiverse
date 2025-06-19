/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/api.dart';
import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/components/rating_badges.dart';
import 'package:archiverse/dialogs/reader_settings_dialog.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:archiverse/views/activity_settings.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _WorkOptionsDialog extends StatefulWidget {
  final Work work;
  final bool isReader; // Flag to indicate if this is for the reader activity
  const _WorkOptionsDialog({required this.work, this.isReader = false});

  @override
  State<_WorkOptionsDialog> createState() => _WorkOptionsDialogState();
}

class _WorkOptionsDialogState extends State<_WorkOptionsDialog> {
  ReadHistory? _readHistory;
  bool _isLoadingHistory = true;

  @override
  void initState() {
    super.initState();
    _loadReadHistory();
  }

  Future<void> _loadReadHistory() async {
    try {
      final history = await AppApi().getLatestReadHistory(widget.work);
      if (mounted) {
        setState(() {
          _readHistory = history;
          _isLoadingHistory = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingHistory = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildWorkHeader(context),

        // Primary actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Card(
            elevation: 0,
            color: colorScheme.surfaceContainer,
            margin: const EdgeInsets.only(bottom: 12.0),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                if (!widget.isReader) ...[
                  _buildReadAction(context),
                ] else ...[
                  _buildActionTile(
                    context,
                    icon: TablerIcons.book,
                    title: "View Work Details",
                    trailing: Icon(TablerIcons.chevron_right, size: 20),
                    isHighlighted: true,
                    onTap: () {
                      context.navigator.pop();
                      context.navigator.pushNamed(
                        WorkActivity.routeName,
                        arguments: widget.work,
                      );
                    },
                  ),
                ],

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.download,
                  title: context.strings.work_download,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),

        // Secondary actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Card(
            elevation: 0,
            color: colorScheme.surfaceContainer,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _buildActionTile(
                  context,
                  icon: TablerIcons.heart,
                  title: context.strings.work_kudos,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.message,
                  title: context.strings.work_comment,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.share,
                  title: context.strings.work_share,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildActionTile(
                  context,
                  icon: TablerIcons.bell_plus,
                  title: context.strings.work_subscribe,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),

        if (widget.isReader) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              elevation: 0,
              color: colorScheme.surfaceContainer,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  _buildActionTile(
                    context,
                    icon: TablerIcons.settings,
                    title: "Settings",
                    onTap: () => {
                      Navigator.pop(context),
                      ReaderSettingsDialog.showSheet(context),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],

        SizedBox(height: context.screenPadding.bottom + context.commonPadding),
      ],
    );
  }

  Widget _buildReadAction(BuildContext context) {
    if (_isLoadingHistory) {
      return _buildActionTile(
        context,
        icon: TablerIcons.book_2,
        title: 'Read',
        subtitle: 'Loading...',
        isHighlighted: true,
        onTap: () {},
      );
    }

    if (_readHistory != null) {
      final completionPercentage = (_readHistory!.completion * 100).toInt();
      final chapterText = _readHistory!.chapter != null
          ? 'Chapter ${_readHistory!.chapter!.chapter}'
          : 'Beginning';

      return _buildActionTile(
        context,
        icon: TablerIcons.book_2,
        title: 'Continue Reading',
        subtitle:
            'Resume from $chapterText • ${completionPercentage}% complete',
        isHighlighted: true,
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            ReaderActivity.routeName,
            arguments: {'work': widget.work, 'chapter': _readHistory!.chapter},
          );
        },
      );
    } else {
      return _buildActionTile(
        context,
        icon: TablerIcons.book_2,
        title: 'Start Reading',
        subtitle: 'Begin from Chapter 1',
        isHighlighted: true,
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            ReaderActivity.routeName,
            arguments: {'work': widget.work, 'chapter': null},
          );
        },
      );
    }
  }

  Widget _buildWorkHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title, author and rating badges
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.work.title,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppUtils.formatAuthorList(widget.work.authors),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              RatingBadges(work: widget.work),
            ],
          ),

          const SizedBox(height: 12),

          // Fandom tags
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              AppUtils.formatFandomsList(widget.work.fandoms),
              style: context.textTheme.labelSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Statistics row with shadows
          _buildWorkStatistics(),

          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    bool isHighlighted = false,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isHighlighted
              ? colorScheme.primaryContainer
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 20,
          color: isHighlighted
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: isHighlighted ? colorScheme.primary : null,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: context.textTheme.bodySmall)
          : null,
      trailing: trailing,
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 72),
      child: Divider(height: 1),
    );
  }

  Row _buildWorkStatistics() {
    return Row(
      spacing: 12.0,
      children: [
        CompactTextIcon(
          icon: TablerIcons.book,
          statistic: widget.work.chapters,
        ),
        CompactTextIcon(
          icon: TablerIcons.align_left,
          statistic: widget.work.words,
        ),
        CompactTextIcon(
          icon: TablerIcons.message,
          statistic: widget.work.comments,
        ),
        CompactTextIcon(icon: TablerIcons.heart, statistic: widget.work.kudos),
      ],
    );
  }
}

class WorkOptionsDialog {
  static void showSheet(
    BuildContext context, {
    required Work work,
    bool isReader = false,
    AnimationController? bottomSheetAnimator,
  }) {
    showModalBottomSheet<void>(
      context: Navigator.of(context, rootNavigator: true).context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      transitionAnimationController: bottomSheetAnimator,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (BuildContext context) =>
          _WorkOptionsDialog(work: work, isReader: isReader),
    );
  }
}
