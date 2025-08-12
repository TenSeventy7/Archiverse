import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ReaderToolbar extends StatelessWidget {
  static const double _iconSize = 22.0;

  const ReaderToolbar({
    super.key,
    required this.hasPrevious,
    required this.hasNext,
    required this.onPreviousChapter,
    required this.onNextChapter,
    required this.onShowChapterList,
    required this.onShowBookmarks,
    required this.onShowOptions,
  });

  final bool hasPrevious;
  final bool hasNext;
  final VoidCallback? onPreviousChapter;
  final VoidCallback? onNextChapter;
  final VoidCallback onShowChapterList;
  final VoidCallback onShowBookmarks;
  final VoidCallback onShowOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.surfaceContainer,
      height: kToolbarHeight + context.screenPadding.bottom,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavigationButton(
              icon: TablerIcons.chevron_left,
              onPressed: hasPrevious ? onPreviousChapter : null,
            ),
            _buildNavigationButton(
              icon: TablerIcons.chevron_right,
              onPressed: hasNext ? onNextChapter : null,
            ),
            _buildChapterListButton(context),
            _buildBookmarkButton(),
            _buildOptionsButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      iconSize: _iconSize,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget _buildChapterListButton(BuildContext context) {
    return IconButton.filled(
      iconSize: _iconSize,
      style: IconButton.styleFrom(
        backgroundColor: context.theme.colorScheme.tertiary,
        foregroundColor: context.theme.colorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      icon: const Icon(TablerIcons.list),
      onPressed: onShowChapterList,
    );
  }

  Widget _buildBookmarkButton() {
    return IconButton(
      iconSize: _iconSize,
      icon: const Icon(TablerIcons.bookmark),
      onPressed: onShowBookmarks,
    );
  }

  Widget _buildOptionsButton() {
    return IconButton(
      iconSize: _iconSize,
      icon: const Icon(TablerIcons.dots_vertical),
      onPressed: onShowOptions,
    );
  }
}
