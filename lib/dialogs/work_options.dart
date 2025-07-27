/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/api.dart';
import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/components/rating_badges.dart';
import 'package:archiverse/dialogs/add_to_category_dialog.dart';
import 'package:archiverse/dialogs/edit_category_dialog.dart';
import 'package:archiverse/dialogs/reader_settings_dialog.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_reader.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class _WorkOptionsDialog extends StatefulWidget {
  final Work work;
  final bool isReader; // Flag to indicate if this is for the reader activity
  final BuildContext context;
  final LibraryCategory? category;
  final VoidCallback? onWorkRemovedFromFolder;

  const _WorkOptionsDialog({
    required this.work,
    this.isReader = false,
    required this.context,
    this.category,
    this.onWorkRemovedFromFolder,
  });

  @override
  State<_WorkOptionsDialog> createState() => _WorkOptionsDialogState();
}

class _WorkOptionsDialogState extends State<_WorkOptionsDialog> {
  ReadHistory? _readHistory;
  bool _isLoadingHistory = true;

  bool _isLoadingLibraryStatus = true;
  bool _isInLibrary = false;
  bool _isInCategory = false;
  late Future<List<LibraryCategory>> future;

  @override
  void initState() {
    super.initState();
    _loadReadHistory();
    _checkLibraryStatus();
  }

  Future<void> _checkLibraryStatus() async {
    try {
      final isInLibrary = await AppApi().isWorkInLibrary(widget.work);
      final isInCategory = widget.category != null
          ? await AppApi().isWorkInCategory(widget.work, widget.category!)
          : false;

      if (mounted) {
        setState(() {
          _isInLibrary = isInLibrary;
          _isInCategory = isInCategory;
          _isLoadingLibraryStatus = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingLibraryStatus = false;
        });
      }
    }
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
        Container(
          margin: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent, // or your desired color
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

        // Library options
        Container(
          margin: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent, // or your desired color
            child: Column(
              children: [
                _buildAddToLibraryAction(context),
                if (_isInLibrary && widget.category == null) ...[
                  _buildDivider(),
                  _buildActionTile(
                    context,
                    icon: TablerIcons.folder_plus,
                    title: "Add to folder",
                    onTap: () {
                      context.navigator.pop();
                      _showAddToCategoryDialog(widget.context);
                    },
                  ),
                ],
                if (_isInLibrary &&
                    widget.category != null &&
                    _isInCategory) ...[
                  _buildDivider(),
                  _buildActionTile(
                    context,
                    icon: TablerIcons.folder_minus,
                    title: "Remove from folder",
                    onTap: () {
                      context.navigator.pop();
                      _removeFromCategory(context, widget.category!);
                    },
                  ),
                ],
              ],
            ),
          ),
        ),

        // Secondary actions
        Container(
          margin: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent, // or your desired color
            child: Column(
              children: [
                if (widget.isReader) ...[
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
                ] else ...[
                  _buildActionTile(
                    context,
                    icon: TablerIcons.library_plus,
                    title: "Mark for later",
                    onTap: () {},
                  ),

                  _buildDivider(),

                  _buildActionTile(
                    context,
                    icon: TablerIcons.bookmark,
                    title: "Bookmark",
                    onTap: () {},
                  ),

                  _buildDivider(),
                ],

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
          const SizedBox(height: 8.0),
          Container(
            margin: const EdgeInsets.only(
              bottom: 12.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(16.0),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent, // or your desired color
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

  Future<void> _removeFromCategory(
    BuildContext context,
    LibraryCategory category,
  ) async {
    try {
      if (await AppApi().isWorkInCategory(widget.work, category)) {
        context.read<LibraryProvider>().removeWorkFromCategory(
          widget.work,
          category,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "${widget.work.title} removed from ${category.name}",
              ),
            ),
          );
        }

        if (widget.onWorkRemovedFromFolder != null) {
          widget.onWorkRemovedFromFolder!();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.work.title} is not in ${category.name}"),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to remove work from category")),
        );
      }
    }
  }

  void _showAddToCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddToCategoryDialog(work: widget.work),
    );
  }

  Widget _buildAddToLibraryAction(BuildContext context) {
    if (_isLoadingLibraryStatus) {
      return _buildActionTile(
        context,
        icon: TablerIcons.library_plus,
        title: "Add to library",
        isHighlighted: true,
        isLoading: true,
        onTap: () {},
      );
    }

    return _buildActionTile(
      context,
      icon: !_isInLibrary ? TablerIcons.plus : TablerIcons.minus,
      title: !_isInLibrary ? "Add to library" : "Remove from library",
      onTap: () async {
        if (_isInLibrary) {
          // Remove from library
          await AppApi().removeWorkFromLibrary(widget.work);
          widget.context.navigator.pop();
          if (widget.context.mounted) {
            widget.context.read<LibraryProvider>().refreshAll();
            ScaffoldMessenger.of(widget.context).showSnackBar(
              SnackBar(
                content: Text("${widget.work.title} removed from library"),
              ),
            );
          }
        } else {
          // Add to library
          await AppApi().addWorkToLibrary(widget.work);
          if (widget.context.mounted) {
            ScaffoldMessenger.of(widget.context).showSnackBar(
              SnackBar(content: Text("${widget.work.title} added to library")),
            );
          }
          setState(() {
            _isInLibrary = true;
          });
        }
      },
    );
  }

  Widget _buildReadAction(BuildContext context) {
    if (_isLoadingHistory) {
      return _buildActionTile(
        context,
        icon: TablerIcons.book_2,
        title: 'Continue reading',
        subtitle: 'Loading...',
        isHighlighted: true,
        isLoading: true,
        onTap: () {},
      );
    }

    if (_readHistory != null) {
      final chapterText = _readHistory!.chapter != null
          ? _readHistory!.chapter!.title
          : 'Beginning';

      return _buildActionTile(
        context,
        textIcon: _readHistory!.chapter?.chapter.toString(),
        title: 'Continue reading',
        subtitle: "Resume from '$chapterText'",
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
        title: 'Read',
        subtitle: "Start from the beginning",
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
    IconData? icon,
    String? textIcon,
    required String title,
    String? subtitle,
    Widget? trailing,
    bool isHighlighted = false,
    bool isLoading = false,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    // Ensure only either textIcon or icon is used
    if (icon != null && textIcon != null) {
      throw ArgumentError('Only one of icon or textIcon should be provided.');
    }

    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      tileColor: isHighlighted
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerLow,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isHighlighted
              ? colorScheme.onPrimaryContainer
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? CircularProgressIndicator(
                padding: EdgeInsets.all(8.0),
                strokeWidth: 3.0,
                color: isHighlighted
                    ? colorScheme.primaryContainer
                    : colorScheme.onSurface,
              )
            : textIcon != null
            ? Text(
                textIcon,
                style: context.textTheme.titleMedium
                    ?.copyWith(
                      color: isHighlighted
                          ? colorScheme.primaryContainer
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    )
                    .apply(fontSizeDelta: 1.0),
              )
            : Icon(
                icon,
                size: 20,
                color: isHighlighted
                    ? colorScheme.primaryContainer
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
    return const SizedBox(height: 4.0);
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
    LibraryCategory? category,
    bool isReader = false,
    AnimationController? bottomSheetAnimator,
    VoidCallback? onWorkRemovedFromFolder,
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
      builder: (BuildContext context) => _WorkOptionsDialog(
        work: work,
        isReader: isReader,
        context: context,
        category: category,
        onWorkRemovedFromFolder: onWorkRemovedFromFolder,
      ),
    );
  }
}
