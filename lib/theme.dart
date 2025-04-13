/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFFAB3428),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder:
          (BuildContext context) => const Icon(TablerIcons.chevron_left),
    ),

    // Temporarily set this to false to use new Material 3 progress indicators
    progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFFAB3428),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder:
          (BuildContext context) => const Icon(TablerIcons.chevron_left),
    ),

    // Temporarily set this to false to use new Material 3 progress indicators
    progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
  );
}
