import 'package:archiverse/logging.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/reader_font.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_library.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReaderProvider extends ChangeNotifier {
  final PreferencesProvider _prefs;
  BuildContext? _context;
  ScrollController? _controller;

  ReaderProvider(this._prefs);

  // Initialize the provider with context and scroll controller
  void initialize({
    required BuildContext context,
    ScrollController? controller,
  }) {
    _context = context;
    _controller = controller;
  }

  // Clean up resources
  void cleanup() {
    _context = null;
    _controller = null;
  }

  // Reading Layout Settings
  double get paragraphSpacing => _prefs.getDouble(
    Preferences.paragraphSpacing,
    defaultValue: Preferences.defaults[Preferences.paragraphSpacing] as double,
  );

  double get lineHeight => _prefs.getDouble(
    Preferences.lineHeight,
    defaultValue: Preferences.defaults[Preferences.lineHeight] as double,
  );

  bool get justifyText => _prefs.getBool(
    Preferences.readerJustifiedText,
    defaultValue: Preferences.defaults[Preferences.readerJustifiedText] as bool,
  );

  ReaderColor get readerColor => ReaderColor.fromKey(
    _prefs.getString(Preferences.readerBackgroundColor) ??
        ReaderColor.system.toString(),
  );

  // Font Settings
  ReaderFont get headingFont => ReaderFont.fromKey(
    _prefs.getString(Preferences.readerHeadingFont) ?? ReaderFont.system.key,
  );

  ReaderFont get bodyFont => ReaderFont.fromKey(
    _prefs.getString(Preferences.readerBodyFont) ?? ReaderFont.system.key,
  );

  String get headingFontFamily => headingFont.toFontFamily;
  String get bodyFontFamily => bodyFont.toFontFamily;

  // Text Scale
  double get textScaleFactor => _prefs.getDouble(
    Preferences.textScaleFactor,
    defaultValue: Preferences.defaults[Preferences.textScaleFactor] as double,
  );

  bool get keepScreenOn => _prefs.getBool(
    Preferences.keepScreenOn,
    defaultValue: Preferences.defaults[Preferences.keepScreenOn] as bool,
  );

  // Font family helpers
  String getFontFamily(String fontName) {
    if (fontName == 'System Default') return "Roboto";
    return fontName;
  }

  // Text alignment helper
  TextAlign get textAlignment =>
      justifyText ? TextAlign.justify : TextAlign.start;

  // Read History Management
  Future<void> saveReadHistory({
    required Work work,
    required Chapter chapter,
  }) async {
    if (_context == null) {
      AppLog().w(
        'Cannot save read history: context not initialized',
        tag: "ReaderProvider",
      );
      return;
    }

    try {
      final libraryProvider = Provider.of<LibraryProvider>(
        _context!,
        listen: false,
      );

      final finalScrollPosition = _controller?.hasClients == true
          ? _controller!.offset.toInt()
          : 0;

      final finalTotalScrollPosition = _controller?.hasClients == true
          ? _controller!.position.maxScrollExtent.toInt()
          : 0;

      await libraryProvider.saveReadHistory(
        work: work,
        chapter: chapter,
        scrollPosition: finalScrollPosition,
        totalScrollPosition: finalTotalScrollPosition,
      );

      AppLog().d(
        'Saved read history for: ${work.title} - ${chapter.title}',
        tag: "ReaderProvider",
      );
    } catch (error) {
      AppLog().e('Error saving read history: $error', tag: "ReaderProvider");
    }
  }

  // Method to trigger refresh when settings change
  void refresh() {
    notifyListeners();
  }
}
