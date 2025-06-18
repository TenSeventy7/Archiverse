import 'package:archiverse/models/reading_layout.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';

enum ScrollingType {
  continuous,
  paged;

  String get key {
    switch (this) {
      case ScrollingType.continuous:
        return 'continuous';
      case ScrollingType.paged:
        return 'paged';
    }
  }

  static ScrollingType fromKey(String key) {
    return ScrollingType.values.firstWhere(
      (type) => type.key == key,
      orElse: () => ScrollingType.continuous,
    );
  }
}

class ReaderProvider extends ChangeNotifier {
  final PreferencesProvider _prefs;

  ReaderProvider(this._prefs);

  // Reading Layout Settings
  ReadingLayout get readingLayout => ReadingLayout.fromKey(
    _prefs.getString(Preferences.readingLayout) ?? 'single_column',
  );

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

  // Font Settings
  String get headingFont =>
      _prefs.getString(
        Preferences.readerHeadingFont,
        defaultValue: 'System Default',
      ) ??
      'System Default';

  String get bodyFont =>
      _prefs.getString(
        Preferences.readerBodyFont,
        defaultValue: 'System Default',
      ) ??
      'System Default';

  // Text Scale
  double get textScaleFactor => _prefs.getDouble(
    Preferences.textScaleFactor,
    defaultValue: Preferences.defaults[Preferences.textScaleFactor] as double,
  );

  // Scrolling Settings
  ScrollingType get scrollingType => ScrollingType.fromKey(
    _prefs.getString(Preferences.scrollingType) ?? 'continuous',
  );

  bool get useScrollPhysics =>
      _prefs.getBool(Preferences.scrollingPhysics, defaultValue: true);

  double get scrollSensitivity =>
      _prefs.getDouble(Preferences.scrollingSensitivity, defaultValue: 1.0);

  bool get showScrollIndicator =>
      _prefs.getBool(Preferences.scrollingShowIndicator, defaultValue: true);

  bool get useScrollAnimation =>
      _prefs.getBool(Preferences.scrollingAnimation, defaultValue: true);

  bool get tapEdges =>
      _prefs.getBool(Preferences.scrollingTapEdges, defaultValue: true);

  bool get keepScreenOn => _prefs.getBool(
    Preferences.keepScreenOn,
    defaultValue: Preferences.defaults[Preferences.keepScreenOn] as bool,
  );

  // Font family helpers
  String? getFontFamily(String fontName) {
    if (fontName == 'System Default') return null;
    return fontName;
  }

  // Text alignment helper
  TextAlign get textAlignment =>
      justifyText ? TextAlign.justify : TextAlign.start;

  // Physics helper
  ScrollPhysics get scrollPhysics {
    if (!useScrollPhysics) return const NeverScrollableScrollPhysics();
    if (scrollingType == ScrollingType.paged) return const PageScrollPhysics();
    return const BouncingScrollPhysics();
  }

  // Method to trigger refresh when settings change
  void refresh() {
    notifyListeners();
  }
}
