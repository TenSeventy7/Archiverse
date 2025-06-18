import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/reading_layout.dart';
import 'package:archiverse/models/theming.dart';
import 'package:archiverse/providers/provider_reader.dart';

class Preferences {
  // Default values for preferences
  static const Map<String, dynamic> defaults = {
    Preferences.useSystemTheme: true,
    Preferences.forceDarkMode: false,
    Preferences.useWallpaperColors: true,
    Preferences.highContrastMode: false,
    Preferences.colorScheme: AppColorScheme.red,
    Preferences.themeMode: AppThemeMode.system,
    Preferences.useSystemAccent: true,
    Preferences.useDynamicColor: true,

    Preferences.textScaleFactor: 1.0,
    Preferences.readerHeadingFont: 'System Default',
    Preferences.readerBodyFont: 'System Default',

    Preferences.readingLayout: ReadingLayout.singleColumn,
    Preferences.paragraphSpacing: 1.0,
    Preferences.lineHeight: 1.5,
    Preferences.readerJustifiedText: false,

    Preferences.scrollingType: ScrollingType.continuous,
    Preferences.keepScreenOn: true,

    Preferences.readerBackgroundColor: ReaderColor.system,
  };

  static const String useSystemTheme = 'use_system_theme';
  static const String forceDarkMode = 'force_dark_mode';
  static const String useWallpaperColors = 'use_wallpaper_colors';
  static const String highContrastMode = 'high_contrast_mode';
  static const String colorScheme = 'theme_color_scheme_preference';

  static const String themeMode = 'theme_mode';
  static const String useSystemAccent = 'use_system_accent';
  static const String useDynamicColor = 'use_dynamic_colors';

  // Text size preferences
  static const String textScaleFactor = 'text_scale_factor';

  // Font preferences
  static const String readerHeadingFont = 'reader_heading_font';
  static const String readerBodyFont = 'reader_body_font';

  // Reading layout preferences
  static const String readingLayout = 'reader_layout_type';
  static const String paragraphSpacing = 'reader_paragraph_spacing';
  static const String lineHeight = 'reader_line_height';
  static const String readerJustifiedText = 'reader_justified_text';
  static const String readerBackgroundColor = 'reader_background_color';

  // Add these to your Preferences class:
  static const String scrollingType = 'scrolling_type';
  static const String scrollingPhysics = 'scrolling_physics';
  static const String scrollingSensitivity = 'scrolling_sensitivity';
  static const String scrollingShowIndicator = 'scrolling_show_indicator';
  static const String scrollingAnimation = 'scrolling_animation';
  static const String scrollingTapEdges = 'scrolling_tap_edges';
  static const String keepScreenOn = 'keep_screen_on';
}
