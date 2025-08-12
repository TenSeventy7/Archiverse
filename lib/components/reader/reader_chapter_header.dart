import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReaderChapterHeader extends StatelessWidget {
  const ReaderChapterHeader({
    super.key,
    this.chapter,
    required this.totalChapters,
  });

  final Chapter? chapter;
  final int totalChapters;

  @override
  Widget build(BuildContext context) {
    if (chapter == null) return const SizedBox.shrink();

    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildChapterTitle(context, settings),
            const SizedBox(height: 8),
            _buildChapterInfo(context, settings),
            ..._buildChapterSummary(context, settings),
            ..._buildChapterPreface(context, settings),
          ],
        );
      },
    );
  }

  Widget _buildChapterTitle(BuildContext context, ReaderProvider settings) {
    return Text(
      chapter!.title.isNotEmpty
          ? chapter!.title
          : 'Chapter ${chapter!.chapter}',
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        settings.headingFontFamily,
        textStyle: context.theme.textTheme.titleLarge?.copyWith(
          color: settings.readerColor.toForegroundColor(context),
          fontWeight: FontWeight.bold,
          fontFamily: settings.headingFontFamily,
        ),
      ),
    );
  }

  Widget _buildChapterInfo(BuildContext context, ReaderProvider settings) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${chapter?.chapter.toString() ?? ""} of $totalChapters',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            settings.bodyFontFamily,
            textStyle: context.theme.textTheme.titleSmall?.copyWith(
              color: settings.readerColor
                  .toForegroundColor(context)
                  .withAlpha(170),
            ),
          ),
        ),
        if (chapter!.words > 0) ...[
          const SizedBox(width: 16),
          Text(
            '${chapter!.words} words',
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.theme.colorScheme.onSurfaceVariant,
              fontFamily: settings.bodyFontFamily,
            ),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildChapterSummary(
    BuildContext context,
    ReaderProvider settings,
  ) {
    if (chapter?.summary?.isNotEmpty != true) {
      return [];
    }

    return [
      SizedBox(height: 16 * settings.paragraphSpacing),
      _buildInfoContainer(
        context,
        content: chapter!.summary!,
        textStyle: GoogleFonts.getFont(
          settings.bodyFontFamily,
          textStyle: context.theme.textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.bodyFontFamily,
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildChapterPreface(
    BuildContext context,
    ReaderProvider settings,
  ) {
    if (chapter?.preface?.isNotEmpty != true) {
      return [];
    }

    return [
      SizedBox(height: 16 * settings.paragraphSpacing),
      Opacity(
        opacity: 0.7,
        child: TextHeader.small(
          title: "Notes",
          hasPadding: false,
          color: settings.readerColor.toForegroundColor(context),
        ),
      ),
      _buildInfoContainer(
        context,
        content: chapter!.preface!,
        backgroundColor: settings.readerColor.toContainerColor(context),
        textStyle: GoogleFonts.getFont(
          settings.bodyFontFamily,
          textStyle: TextStyle(
            height: settings.lineHeight,
            color: settings.readerColor.toForegroundColor(context),
            fontFamily: settings.bodyFontFamily,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
    ];
  }

  Widget _buildInfoContainer(
    BuildContext context, {
    required String content,
    Color? backgroundColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 4.0,
      vertical: 16.0,
    ),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: HtmlWidget(
        content,
        textStyle: textStyle ?? context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
