import 'dart:ui';
import 'package:flutter/material.dart';

class AppBarDefaultsM3 extends AppBarThemeData {
  AppBarDefaultsM3(this.context)
    : super(
        elevation: 0.0,
        scrolledUnderElevation: 3.0,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        toolbarHeight: 64.0,
      );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get foregroundColor => _colors.onSurface;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  IconThemeData? get iconTheme =>
      IconThemeData(color: _colors.onSurface, size: 24.0);

  @override
  IconThemeData? get actionsIconTheme =>
      IconThemeData(color: _colors.onSurfaceVariant, size: 24.0);

  @override
  TextStyle? get toolbarTextStyle => _textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _textTheme.titleLarge;

  // TODO(Craftplacer): Consider using EdgeInsets.only(right: 8.0) instead of
  // EdgeInsets.zero for Material 3 in the future,
  // https://github.com/flutter/flutter/issues/155747
  @override
  EdgeInsets? get actionsPadding => EdgeInsets.zero;
}

// Hand coded defaults based on Material Design 2.
class AppBarDefaultsM2 extends AppBarThemeData {
  AppBarDefaultsM2(this.context)
    : super(
        elevation: 4.0,
        shadowColor: const Color(0xFF000000),
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        toolbarHeight: kToolbarHeight,
      );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  Color? get backgroundColor =>
      _colors.brightness == Brightness.dark ? _colors.surface : _colors.primary;

  @override
  Color? get foregroundColor => _colors.brightness == Brightness.dark
      ? _colors.onSurface
      : _colors.onPrimary;

  @override
  IconThemeData? get iconTheme => _theme.iconTheme;

  @override
  TextStyle? get toolbarTextStyle => _theme.textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _theme.textTheme.titleLarge;

  @override
  EdgeInsets? get actionsPadding => EdgeInsets.zero;
}
