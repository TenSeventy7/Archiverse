// ignore_for_file: deprecated_member_use

import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/reader/reader_chapter_header.dart';
import 'package:archiverse/components/reader/reader_chapter_notes.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/logging.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as html;
import 'package:provider/provider.dart';

class ReaderContent extends StatelessWidget {
  const ReaderContent({
    super.key,
    required this.chapter,
    required this.chapters,
    required this.currentChapterIndex,
    required this.scrollController,
    required this.onContentTap,
    required this.onHorizontalDragStart,
    required this.onHorizontalDragUpdate,
    required this.onHorizontalDragEnd,
    required this.onHorizontalDragCancel,
    required this.dragOpacity,
    required this.isDragging,
  });

  final Chapter? chapter;
  final List<Chapter> chapters;
  final int currentChapterIndex;
  final ScrollController scrollController;
  final Function(TapUpDetails) onContentTap;
  final Function(DragStartDetails) onHorizontalDragStart;
  final Function(DragUpdateDetails) onHorizontalDragUpdate;
  final Function(DragEndDetails) onHorizontalDragEnd;
  final VoidCallback onHorizontalDragCancel;
  final double dragOpacity;
  final bool isDragging;

  static const Duration _animationDuration = Duration(milliseconds: 300);
  static const Duration _fadeAnimationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return GestureDetector(
          onTapUp: onContentTap,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onHorizontalDragEnd: onHorizontalDragEnd,
          onHorizontalDragCancel: onHorizontalDragCancel,
          child: AnimatedSwitcher(
            duration: isDragging ? Duration.zero : _animationDuration,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: AnimatedOpacity(
              duration: isDragging ? Duration.zero : _fadeAnimationDuration,
              opacity: dragOpacity,
              child: _buildScrollContent(context, settings),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScrollContent(BuildContext context, ReaderProvider settings) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(
            settings.readerColor.toForegroundColor(context).withOpacity(0.5),
          ),
          trackColor: WidgetStateProperty.all(
            settings.readerColor.toContainerColor(context).withOpacity(0.3),
          ),
        ),
      ),
      child: Stack(
        children: [
          Scrollbar(
            controller: scrollController,
            thumbVisibility: false,
            radius: const Radius.circular(4.0),
            child: _buildChapterContent(context, settings),
          ),
          _buildTopShadow(context, settings),
          _buildBottomShadow(context, settings),
        ],
      ),
    );
  }

  Widget _buildChapterContent(BuildContext context, ReaderProvider settings) {
    final textStyle = GoogleFonts.getFont(settings.bodyFontFamily).copyWith(
      height: settings.lineHeight,
      color: settings.readerColor.toForegroundColor(context),
    );

    // So we can track scroll position, we need to put it in a ListView
    // Capture each top-level HTML element as separate strings
    final elements =
        html
            .parse(chapter!.content!)
            .body
            ?.children
            .map((element) => element.outerHtml)
            .toList() ??
        [];

    return ListView.separated(
      key: ValueKey(currentChapterIndex),
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: context.screenPadding.top + kToolbarHeight + 24.0 + 8.0,
        horizontal: context.commonPaddingDouble,
      ),
      itemCount: elements.length + 2, // Add for header and footer
      separatorBuilder: (context, i) =>
          SizedBox(height: 16 * settings.paragraphSpacing),
      itemBuilder: (context, index) {
        if (index == 0) {
          return ReaderChapterHeader(
            chapter: chapter,
            totalChapters: chapters.length,
          );
        }

        if (index == elements.length + 1) {
          return ReaderChapterNotes(chapter: chapter);
        }

        return _buildChapterParagraph(
          settings,
          paragraph: elements[index - 1],
          style: textStyle,
        );
      },
    );
  }

  Widget _buildChapterParagraph(
    ReaderProvider settings, {
    required String paragraph,
    required TextStyle style,
  }) {
    if (paragraph.isEmpty) return const SizedBox.shrink();

    return HtmlWidget(
      paragraph,
      key: ValueKey(
        'html_${settings.justifyText ? 'justified' : 'normal'}_${settings.readerColor.toString()}',
      ),
      textStyle: style.copyWith(height: settings.lineHeight),
      customStylesBuilder: (element) {
        if (settings.justifyText) {
          return {'text-align': 'justify'};
        }
        return {};
      },
    );
  }

  Widget _buildTopShadow(BuildContext context, ReaderProvider settings) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: context.screenPadding.top + kToolbarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              settings.readerColor.toBackgroundColor(context),
              settings.readerColor.toBackgroundColor(context).withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomShadow(BuildContext context, ReaderProvider settings) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: context.screenPadding.bottom + 48.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              settings.readerColor.toBackgroundColor(context),
              settings.readerColor.toBackgroundColor(context).withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }
}
