/*
 * (C) 2024-2025, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import "package:flutter/material.dart";
import "package:flutter_tabler_icons/flutter_tabler_icons.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a42),
      surfaceTint: Color(0xff904a42),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad5),
      onPrimaryContainer: Color(0xff73342d),
      secondary: Color(0xff8c4a5f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd9e2),
      onSecondaryContainer: Color(0xff703348),
      tertiary: Color(0xff865318),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdcbe),
      onTertiaryContainer: Color(0xff693c00),
      error: Color(0xff904b40),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad4),
      onErrorContainer: Color(0xff73342a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff534341),
      outline: Color(0xff857370),
      outlineVariant: Color(0xffd8c2bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb4aa),
      primaryFixed: Color(0xffffdad5),
      onPrimaryFixed: Color(0xff3b0906),
      primaryFixedDim: Color(0xffffb4aa),
      onPrimaryFixedVariant: Color(0xff73342d),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff3a071c),
      secondaryFixedDim: Color(0xffffb1c7),
      onSecondaryFixedVariant: Color(0xff703348),
      tertiaryFixed: Color(0xffffdcbe),
      onTertiaryFixed: Color(0xff2d1600),
      tertiaryFixedDim: Color(0xfffdb975),
      onTertiaryFixedVariant: Color(0xff693c00),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xfffceae7),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e231e),
      surfaceTint: Color(0xff904a42),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa25850),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5c2237),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9d586e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff522d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff976126),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e241c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa1594d),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff180f0e),
      onSurfaceVariant: Color(0xff413331),
      outline: Color(0xff5f4f4d),
      outlineVariant: Color(0xff7b6967),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb4aa),
      primaryFixed: Color(0xffa25850),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff844139),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9d586e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff814056),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff976126),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7a490f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3c0),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xfff6e4e2),
      surfaceContainerHigh: Color(0xffebd9d6),
      surfaceContainerHighest: Color(0xffdfcecb),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511a15),
      surfaceTint: Color(0xff904a42),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff76362f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f182d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff73354a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff442500),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6c3e02),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a13),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362d),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362927),
      outlineVariant: Color(0xff554543),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb4aa),
      primaryFixed: Color(0xff76362f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59201a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff73354a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff571f34),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6c3e02),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5b3),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffedea),
      surfaceContainer: Color(0xfff1dedc),
      surfaceContainerHigh: Color(0xffe2d0ce),
      surfaceContainerHighest: Color(0xffd4c3c0),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4aa),
      surfaceTint: Color(0xffffb4aa),
      onPrimary: Color(0xff561e18),
      primaryContainer: Color(0xff73342d),
      onPrimaryContainer: Color(0xffffdad5),
      secondary: Color(0xffffb1c7),
      onSecondary: Color(0xff541d31),
      secondaryContainer: Color(0xff703348),
      onSecondaryContainer: Color(0xffffd9e2),
      tertiary: Color(0xfffdb975),
      onTertiary: Color(0xff4a2800),
      tertiaryContainer: Color(0xff693c00),
      onTertiaryContainer: Color(0xffffdcbe),
      error: Color(0xffffb4a8),
      onError: Color(0xff561e16),
      errorContainer: Color(0xff73342a),
      onErrorContainer: Color(0xffffdad4),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dedc),
      onSurfaceVariant: Color(0xffd8c2bf),
      outline: Color(0xffa08c8a),
      outlineVariant: Color(0xff534341),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff904a42),
      primaryFixed: Color(0xffffdad5),
      onPrimaryFixed: Color(0xff3b0906),
      primaryFixedDim: Color(0xffffb4aa),
      onPrimaryFixedVariant: Color(0xff73342d),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff3a071c),
      secondaryFixedDim: Color(0xffffb1c7),
      onSecondaryFixedVariant: Color(0xff703348),
      tertiaryFixed: Color(0xffffdcbe),
      onTertiaryFixed: Color(0xff2d1600),
      tertiaryFixedDim: Color(0xfffdb975),
      onTertiaryFixedVariant: Color(0xff693c00),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2cc),
      surfaceTint: Color(0xffffb4aa),
      onPrimary: Color(0xff48130f),
      primaryContainer: Color(0xffcc7b71),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd0dc),
      onSecondary: Color(0xff471226),
      secondaryContainer: Color(0xffc67b92),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd5ae),
      onTertiary: Color(0xff3b1f00),
      tertiaryContainer: Color(0xffc08446),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cb),
      onError: Color(0xff48140d),
      errorContainer: Color(0xffcc7b6f),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1110),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d4),
      outline: Color(0xffc2adaa),
      outlineVariant: Color(0xffa08c89),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff74352e),
      primaryFixed: Color(0xffffdad5),
      onPrimaryFixed: Color(0xff2c0101),
      primaryFixedDim: Color(0xffffb4aa),
      onPrimaryFixedVariant: Color(0xff5e231e),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff2b0012),
      secondaryFixedDim: Color(0xffffb1c7),
      onSecondaryFixedVariant: Color(0xff5c2237),
      tertiaryFixed: Color(0xffffdcbe),
      onTertiaryFixed: Color(0xff1e0d00),
      tertiaryFixedDim: Color(0xfffdb975),
      onTertiaryFixedVariant: Color(0xff522d00),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff4e4240),
      surfaceContainerLowest: Color(0xff0d0605),
      surfaceContainerLow: Color(0xff251b1a),
      surfaceContainer: Color(0xff302524),
      surfaceContainerHigh: Color(0xff3b302f),
      surfaceContainerHighest: Color(0xff463b3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece9),
      surfaceTint: Color(0xffffb4aa),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaea4),
      onPrimaryContainer: Color(0xff220000),
      secondary: Color(0xffffebef),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfffeabc3),
      onSecondaryContainer: Color(0xff20000c),
      tertiary: Color(0xffffeddf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff8b572),
      onTertiaryContainer: Color(0xff150800),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea1),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff1a1110),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece9),
      outlineVariant: Color(0xffd4bebb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff74352e),
      primaryFixed: Color(0xffffdad5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb4aa),
      onPrimaryFixedVariant: Color(0xff2c0101),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb1c7),
      onSecondaryFixedVariant: Color(0xff2b0012),
      tertiaryFixed: Color(0xffffdcbe),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfffdb975),
      onTertiaryFixedVariant: Color(0xff1e0d00),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff5a4d4c),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1c),
      surfaceContainer: Color(0xff392e2d),
      surfaceContainerHigh: Color(0xff443937),
      surfaceContainerHighest: Color(0xff504442),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
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

    // Temporarily set this to false to use new Material 3 progress indicators
    progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
