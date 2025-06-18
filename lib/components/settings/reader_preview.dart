import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReaderPreview extends StatelessWidget {
  const ReaderPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReaderProvider>(
      builder: (context, readerProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: readerProvider.readerColor.toBackgroundColor(context),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPreviewHeader(context, readerProvider),
              Divider(
                height: 24,
                color: readerProvider.readerColor.toForegroundColor(context),
              ),
              _buildPreviewContent(context, readerProvider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPreviewHeader(
    BuildContext context,
    ReaderProvider readerProvider,
  ) {
    final foregroundColor = readerProvider.readerColor.toForegroundColor(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(TablerIcons.book_2, size: 20, color: foregroundColor),
            const SizedBox(width: 8),
            Text(
              "Preview",
              style: context.textTheme.titleMedium?.copyWith(
                color: foregroundColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildScaledText(
          'The Bookworm',
          readerProvider,
          style: _getHeadingStyle(context, readerProvider, isTitle: true),
        ),
        _buildScaledText(
          'By Arthur Reading',
          readerProvider,
          style: _getHeadingStyle(context, readerProvider, isSubtitle: true),
        ),
      ],
    );
  }

  Widget _buildPreviewContent(
    BuildContext context,
    ReaderProvider readerProvider,
  ) {
    final bodyStyle = _getBodyStyle(context, readerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScaledText(
          'It was an ordinary Tuesday when Sarah discovered the book that would change her life. Bound in worn leather with faded gold lettering, it seemed to call to her from the dusty shelf in the back corner of the antique store.',
          readerProvider,
          style: bodyStyle,
        ),
        SizedBox(height: 16 * readerProvider.paragraphSpacing),
        _buildScaledText(
          'As she turned the first yellowed page, the words began to shimmer and dance before her eyes. She blinked, thinking it must be a trick of the light, but when she looked again, the text was transforming right in front of her.',
          readerProvider,
          style: bodyStyle,
        ),
      ],
    );
  }

  Widget _buildScaledText(
    String text,
    ReaderProvider readerProvider, {
    required TextStyle? style,
  }) {
    return Text(
      text,
      style: style?.copyWith(
        fontSize: (style.fontSize ?? 14) * readerProvider.textScaleFactor,
        height: readerProvider.lineHeight,
      ),
      textAlign: readerProvider.textAlignment,
    );
  }

  TextStyle? _getHeadingStyle(
    BuildContext context,
    ReaderProvider readerProvider, {
    bool isTitle = false,
    bool isSubtitle = false,
  }) {
    final foregroundColor = readerProvider.readerColor.toForegroundColor(
      context,
    );
    final fontFamily = readerProvider.headingFontFamily;

    if (isTitle) {
      return GoogleFonts.getFont(
        fontFamily,
        textStyle: context.textTheme.headlineSmall?.copyWith(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: foregroundColor,
        ),
      );
    } else if (isSubtitle) {
      return GoogleFonts.getFont(
        fontFamily,
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontFamily: fontFamily,
          fontStyle: FontStyle.italic,
          color: foregroundColor.withValues(alpha: 0.8),
        ),
      );
    }

    return GoogleFonts.getFont(
      fontFamily,
      textStyle: context.textTheme.titleSmall?.copyWith(
        fontFamily: fontFamily,
        color: foregroundColor,
      ),
    );
  }

  TextStyle? _getBodyStyle(
    BuildContext context,
    ReaderProvider readerProvider,
  ) {
    final foregroundColor = readerProvider.readerColor.toForegroundColor(
      context,
    );
    final fontFamily = readerProvider.bodyFontFamily;

    return GoogleFonts.getFont(
      fontFamily,
      textStyle: context.textTheme.bodyMedium?.copyWith(
        fontFamily: fontFamily,
        color: foregroundColor,
      ),
    );
  }
}
