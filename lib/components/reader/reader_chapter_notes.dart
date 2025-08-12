import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReaderChapterNotes extends StatelessWidget {
  const ReaderChapterNotes({super.key, this.chapter});

  final Chapter? chapter;

  @override
  Widget build(BuildContext context) {
    if (chapter?.postface?.isNotEmpty != true) {
      return const SizedBox.shrink();
    }

    return Consumer<ReaderProvider>(
      builder: (context, settings, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16 * settings.paragraphSpacing),
            Opacity(
              opacity: 0.7,
              child: TextHeader.small(
                title: "Notes",
                hasPadding: false,
                color: settings.readerColor.toForegroundColor(context),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: settings.readerColor
                    .toContainerColor(context)
                    .withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: HtmlWidget(
                chapter!.postface!,
                textStyle: GoogleFonts.getFont(
                  settings.bodyFontFamily,
                  textStyle: TextStyle(
                    height: settings.lineHeight,
                    fontFamily: settings.bodyFontFamily,
                    color: settings.readerColor.toForegroundColor(context),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
