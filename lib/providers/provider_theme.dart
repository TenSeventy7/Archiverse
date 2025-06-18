import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/theming.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  late PreferencesProvider _prefs;
  final DeviceInfoPlugin _info = DeviceInfoPlugin();

  AppThemeMode _themeMode = AppThemeMode.system;
  AppColorScheme _colorScheme = AppColorScheme.red;

  bool _supportsDynamicColor = false;
  bool get supportsDynamicColor => _supportsDynamicColor;

  ThemeProvider(BuildContext context) {
    _prefs = context.read<PreferencesProvider>();
    _initSupport(context);
    _themeMode = AppThemeMode.fromKey(
      _prefs.getString(Preferences.themeMode) ?? AppThemeMode.system.key,
    );
    _colorScheme = AppColorScheme.fromKey(
      _prefs.getString(Preferences.colorScheme) ?? AppColorScheme.red.key,
    );
  }

  _initSupport(BuildContext context) async {
    // If running iOS, auto-support dynamic color
    if (context.platform == TargetPlatform.iOS) {
      _supportsDynamicColor = true;
    }

    // If running Android, the feature is only supported if it's
    // running Android S (API 31) or higher
    if (context.platform == TargetPlatform.android) {
      final androidInfo = await _info.androidInfo;
      _supportsDynamicColor = androidInfo.version.sdkInt >= 31;
    }
  }

  AppThemeMode get appThemeMode => _themeMode;
  AppColorScheme get appColorScheme => _colorScheme;

  ThemeMode get themeMode => _themeMode.toThemeMode();
  ColorScheme get lightColorScheme => _colorScheme.lightColorScheme;
  ColorScheme get darkColorScheme => _colorScheme.darkColorScheme;

  ThemeData? getThemeData(TextTheme textTheme, ColorScheme? colorScheme) {
    bool isDynamic =
        _colorScheme == AppColorScheme.dynamic && _supportsDynamicColor;

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme?.brightness,
      colorSchemeSeed: isDynamic ? colorScheme?.primary : null,
      colorScheme: isDynamic ? null : colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme?.onSurface,
        displayColor: colorScheme?.onSurface,
      ),
      scaffoldBackgroundColor: isDynamic ? null : colorScheme?.surface,
      canvasColor: isDynamic ? null : colorScheme?.surface,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) => Icon(
          Directionality.of(context) == TextDirection.rtl
              ? TablerIcons.arrow_right
              : TablerIcons.arrow_left,
          size: 22.0,
          textDirection: TextDirection.rtl,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
    );
  }

  void setThemeMode(AppThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      _prefs.setString(Preferences.themeMode, mode.key);
      notifyListeners();
    }
  }

  void setColorScheme(AppColorScheme scheme) {
    if (_colorScheme != scheme) {
      _colorScheme = scheme;
      _prefs.setString(Preferences.colorScheme, scheme.key);
      notifyListeners();
    }
  }
}
