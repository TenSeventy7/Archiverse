import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/reader_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSelectionWidget extends StatelessWidget {
  final List<ReaderFont> fonts;
  final ReaderFont selectedFont;
  final ValueChanged<ReaderFont> onFontSelected;
  final bool isHeading;
  final double height;
  final EdgeInsetsGeometry? padding;

  const FontSelectionWidget({
    super.key,
    required this.fonts,
    required this.selectedFont,
    required this.onFontSelected,
    this.isHeading = false,
    this.height = 64.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:
            padding ??
            EdgeInsets.symmetric(horizontal: context.commonPaddingDouble),
        itemCount: fonts.length,
        itemBuilder: (context, index) {
          final font = fonts[index];
          final isSelected = selectedFont == font;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              selected: isSelected,
              onSelected: (_) => onFontSelected(font),
              label: Text(
                font.name,
                style: _buildTextStyle(context, font, isSelected),
              ),
            ),
          );
        },
      ),
    );
  }

  TextStyle? _buildTextStyle(
    BuildContext context,
    ReaderFont font,
    bool isSelected,
  ) {
    if (font == ReaderFont.system) {
      return context.textTheme.bodyMedium?.copyWith(
        color: isSelected
            ? context.colorScheme.onPrimaryContainer
            : context.colorScheme.onSurface,
        fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
      );
    }

    return GoogleFonts.getFont(
      font.toFontFamily,
      textStyle: TextStyle(
        fontSize: 14,
        color: isSelected
            ? context.colorScheme.onPrimaryContainer
            : context.colorScheme.onSurface,
        fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
