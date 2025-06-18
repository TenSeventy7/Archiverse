import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

enum ReaderColor {
  system,
  light,
  dark,
  gray,
  sepia;

  @override
  String toString() {
    switch (this) {
      case ReaderColor.system:
        return 'system';
      case ReaderColor.light:
        return 'light';
      case ReaderColor.dark:
        return 'dark';
      case ReaderColor.gray:
        return 'gray';
      case ReaderColor.sepia:
        return 'sepia';
    }
  }

  static ReaderColor fromKey(String key) {
    return ReaderColor.values.firstWhere(
      (color) => color.toString() == key,
      orElse: () => ReaderColor.system,
    );
  }

  Color toBackgroundColor(BuildContext context) {
    switch (this) {
      case ReaderColor.system:
        return context.colorScheme.surface;
      case ReaderColor.light:
        return context.themeProvider.lightColorScheme.surface;
      case ReaderColor.dark:
        return context.themeProvider.darkColorScheme.surface;
      case ReaderColor.gray:
        return Colors.grey.shade400;
      case ReaderColor.sepia:
        return const Color(0xFFFBF0D9);
    }
  }

  Color toForegroundColor(BuildContext context) {
    switch (this) {
      case ReaderColor.system:
        return context.colorScheme.onSurface;
      case ReaderColor.light:
        return context.themeProvider.lightColorScheme.onSurface;
      case ReaderColor.dark:
        return context.themeProvider.darkColorScheme.onSurface;
      case ReaderColor.gray:
        return Colors.black87;
      case ReaderColor.sepia:
        return const Color(0xFF5F4B32);
    }
  }
}
