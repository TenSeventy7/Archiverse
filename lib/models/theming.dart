import 'package:archiverse/theme.dart';
import 'package:archiverse/themes/blue.dart';
import 'package:archiverse/themes/green.dart';
import 'package:archiverse/themes/yellow.dart';
import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  light,
  dark;

  String get key {
    switch (this) {
      case AppThemeMode.system:
        return 'system';
      case AppThemeMode.light:
        return 'light';
      case AppThemeMode.dark:
        return 'dark';
    }
  }

  static AppThemeMode fromKey(String key) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.key == key,
      orElse: () => AppThemeMode.system,
    );
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }
}

enum AppColorScheme {
  red,
  green,
  blue,
  yellow,
  dynamic;

  String get key {
    switch (this) {
      case AppColorScheme.dynamic:
        return 'dynamic';
      case AppColorScheme.red:
        return 'default';
      case AppColorScheme.green:
        return 'green';
      case AppColorScheme.blue:
        return 'blue';
      case AppColorScheme.yellow:
        return 'yellow';
    }
  }

  static AppColorScheme fromKey(String key) {
    return AppColorScheme.values.firstWhere(
      (scheme) => scheme.key == key,
      orElse: () => AppColorScheme.red,
    );
  }

  ColorScheme get lightColorScheme {
    switch (this) {
      case AppColorScheme.red:
        return MaterialTheme.lightScheme();
      case AppColorScheme.green:
        return MaterialGreenTheme.lightScheme();
      case AppColorScheme.blue:
        return MaterialBlueTheme.lightScheme();
      case AppColorScheme.yellow:
        return MaterialYellowTheme.lightScheme();
      case AppColorScheme
          .dynamic: // Do not use. Please use DynamicColorBuilder.
        return MaterialTheme.lightScheme();
    }
  }

  ColorScheme get darkColorScheme {
    switch (this) {
      case AppColorScheme.red:
        return MaterialTheme.darkScheme();
      case AppColorScheme.green:
        return MaterialGreenTheme.darkScheme();
      case AppColorScheme.blue:
        return MaterialBlueTheme.darkScheme();
      case AppColorScheme.yellow:
        return MaterialYellowTheme.darkScheme();
      case AppColorScheme
          .dynamic: // Do not use. Please use DynamicColorBuilder.
        return MaterialTheme.darkScheme();
    }
  }
}
