import 'package:archiverse/components/expressive/scroll_under_flexible_space.dart';
import 'package:flutter/material.dart';

class MediumScrollUnderFlexibleConfig with ScrollUnderFlexibleConfig {
  MediumScrollUnderFlexibleConfig(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  static const double collapsedHeight = 64.0;
  static const double expandedHeight = 112.0;

  @override
  double get roundedOffset => 30.0;

  @override
  TextStyle? get collapsedTextStyle =>
      _textTheme.titleLarge?.apply(color: _colors.onSurface);

  @override
  TextStyle? get expandedTextStyle =>
      _textTheme.headlineSmall?.apply(color: _colors.onSurface);

  @override
  EdgeInsetsGeometry get expandedTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 20);
}

class LargeScrollUnderFlexibleConfig with ScrollUnderFlexibleConfig {
  LargeScrollUnderFlexibleConfig(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  static const double collapsedHeight = 64.0;
  static const double expandedHeight = 120.0;

  @override
  double get roundedOffset => 28.0;

  @override
  TextStyle? get collapsedTextStyle =>
      _textTheme.titleLarge?.apply(color: _colors.onSurface);

  @override
  TextStyle? get expandedTextStyle =>
      _textTheme.headlineMedium?.apply(color: _colors.onSurface);

  @override
  EdgeInsetsGeometry get expandedTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 20);
}
