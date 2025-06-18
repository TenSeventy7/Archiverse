import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/theming.dart';

class Preferences {
  // Default values for preferences
  static const Map<String, dynamic> defaults = {
    Preferences.themeMode: AppThemeMode.system,
    Preferences.colorScheme: AppColorScheme.red,

    Preferences.textScaleFactor: 1.0,
    Preferences.readerHeadingFont: 'system',
    Preferences.readerBodyFont: 'system',

    Preferences.readerBackgroundColor: ReaderColor.system,
    Preferences.paragraphSpacing: 1.0,
    Preferences.lineHeight: 1.5,
    Preferences.readerJustifiedText: false,
    Preferences.keepScreenOn: true,
  };

  static const String themeMode = 'theme_mode';
  static const String colorScheme = 'theme_color_scheme_preference';

  // Text size and Font preferences
  static const String textScaleFactor = 'text_scale_factor';
  static const String readerHeadingFont = 'reader_heading_font';
  static const String readerBodyFont = 'reader_body_font';

  // Reading layout preferences
  static const String readerBackgroundColor = 'reader_background_color';
  static const String paragraphSpacing = 'reader_paragraph_spacing';
  static const String lineHeight = 'reader_line_height';
  static const String readerJustifiedText = 'reader_justified_text';
  static const String keepScreenOn = 'keep_screen_on';
}
