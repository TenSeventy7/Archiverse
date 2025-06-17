/*
 * (C) 2024, John Vincent Corcega <flutter@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * This extends Flutter's BuildContext class to bring creature comforts
 * developers are used to (like me) in native Android development.
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:archiverse/strings/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  NavigatorState get navigator => Navigator.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);

  // Returns if the current device is in dark mode
  bool get isDarkMode =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  // Returns the current device's screen width
  double get screenWidth => mediaQuery.size.width;

  // Returns the current device's screen height
  double get screenHeight => mediaQuery.size.height;

  // Returns the current device's screen width - with insets
  double get safeScreenWidth =>
      mediaQuery.size.width -
      mediaQuery.viewInsets.left -
      mediaQuery.viewInsets.right;

  // Returns the current device's screen height - with insets
  double get safeScreenHeight =>
      mediaQuery.size.height -
      mediaQuery.viewInsets.top -
      mediaQuery.viewInsets.bottom;

  // Returns the orientation of the current device
  Orientation get screenOrientation => mediaQuery.orientation;

  // Returns the current device's screen padding
  EdgeInsets get screenPadding => mediaQuery.padding;

  // Returns the current device's screen insets
  EdgeInsets get screenInsets => mediaQuery.viewInsets;

  // Return a common EdgeInset for padding
  EdgeInsets get horizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 8.0);
  EdgeInsets get horizontalPaddingDouble =>
      const EdgeInsets.symmetric(horizontal: 16.0);
  double get commonPadding => 8.0;
  double get commonPaddingHalf => 8.0;
  double get commonPaddingDouble => 16.0;

  // Return a common list tile visual density
  VisualDensity get commonDensity => const VisualDensity(vertical: 2);

  // Returns a specific asset image
  Image getImage(String asset) => Image.asset(asset);

  // Returns a vector image
  Image getVector(String asset) => Image.asset(asset, package: 'flutter_svg');

  // Sets navigation bar color
  void setNavigationBarColor(Color color) {
    // Determine icon color based on brightness and set color of system navigation bar
    var style = isDarkMode
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(
      style.copyWith(
        systemNavigationBarColor: color,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDarkMode
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  // Returns if app is running in debug mode
  bool get isDebugMode {
    return kDebugMode;
  }

  /// Returns a scaled width based on the device's screen width
  /// @param ratio The ratio to scale the width by (e.g., 0.5 for half the width)
  /// @return The scaled width
  double vw(double ratio) {
    return screenWidth * ratio;
  }

  /// Returns a scaled height based on the device's screen height
  /// @param ratio The ratio to scale the height by (e.g., 0.5 for half the height)
  /// @return The scaled height
  double vh(double ratio) {
    return screenHeight * ratio;
  }
}
