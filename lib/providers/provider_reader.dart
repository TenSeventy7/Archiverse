import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/reader_font.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';

class ReaderProvider extends ChangeNotifier {
  final PreferencesProvider _prefs;

  ReaderProvider(this._prefs);

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

  // Method to trigger refresh when settings change
  void refresh() {
    notifyListeners();
  }
}
