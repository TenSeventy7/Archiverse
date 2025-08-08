import 'package:archiverse/components/expressive/defaults.dart';
import 'package:archiverse/components/expressive/expanded_title_with_padding.dart';
import 'package:flutter/material.dart';

typedef FlexibleConfigBuilder =
    ScrollUnderFlexibleConfig Function(BuildContext);

const double _kMaxTitleTextScaleFactor =
    1.34; // TODO(perc): Add link to Material spec when available, https://github.com/flutter/flutter/issues/58769.

mixin ScrollUnderFlexibleConfig {
  TextStyle? get collapsedTextStyle;
  TextStyle? get expandedTextStyle;
  EdgeInsetsGeometry get expandedTitlePadding;
  double get roundedOffset => 0.0;
}

class ScrollUnderFlexibleSpace extends StatelessWidget {
  const ScrollUnderFlexibleSpace({
    super.key,
    this.title,
    this.foregroundColor,
    required this.configBuilder,
    this.titleTextStyle,
    required this.bottomHeight,
    this.rounded = true,
  });

  final Widget? title;
  final Color? foregroundColor;
  final FlexibleConfigBuilder configBuilder;
  final TextStyle? titleTextStyle;
  final double bottomHeight;
  final bool rounded;

  @override
  Widget build(BuildContext context) {
    late final AppBarThemeData appBarTheme = AppBarTheme.of(context);
    late final AppBarThemeData defaults = Theme.of(context).useMaterial3
        ? AppBarDefaultsM3(context)
        : AppBarDefaultsM2(context);
    final FlexibleSpaceBarSettings settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final ScrollUnderFlexibleConfig config = configBuilder(context);
    assert(
      config.expandedTitlePadding.isNonNegative,
      'The _ExpandedTitleWithPadding widget assumes that the expanded title padding is non-negative. '
      'Update its implementation to handle negative padding.',
    );

    final TextStyle? expandedTextStyle =
        titleTextStyle ??
        appBarTheme.titleTextStyle ??
        config.expandedTextStyle?.copyWith(
          color:
              foregroundColor ??
              appBarTheme.foregroundColor ??
              defaults.foregroundColor,
        );

    final Widget? expandedTitle = switch ((title, expandedTextStyle)) {
      (null, _) => null,
      (final Widget title, null) => title,
      (final Widget title, final TextStyle textStyle) => DefaultTextStyle(
        style: textStyle,
        child: title,
      ),
    };

    final EdgeInsets resolvedTitlePadding = config.expandedTitlePadding.resolve(
      Directionality.of(context),
    );
    final EdgeInsetsGeometry expandedTitlePadding = bottomHeight > 0
        ? resolvedTitlePadding.copyWith(bottom: 0)
        : resolvedTitlePadding;

    // Set maximum text scale factor to [_kMaxTitleTextScaleFactor] for the
    // title to keep the visual hierarchy the same even with larger font
    // sizes. To opt out, wrap the [title] widget in a [MediaQuery] widget
    // with a different TextScaler.
    // TODO(tahatesser): Add link to Material spec when available, https://github.com/flutter/flutter/issues/58769.
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: _kMaxTitleTextScaleFactor,
      // This column will assume the full height of the parent Stack.
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top:
                  settings.minExtent -
                  (rounded ? config.roundedOffset : 0.0) -
                  bottomHeight,
            ),
          ),
          Flexible(
            child: ClipRect(
              child: ExpandedTitleWithPadding(
                padding: expandedTitlePadding,
                maxExtent: settings.maxExtent - settings.minExtent,
                child: expandedTitle,
              ),
            ),
          ),
          // Reserve space for AppBar.bottom, which is a sibling of this widget,
          // on the parent Stack.
          if (bottomHeight > 0)
            Padding(padding: EdgeInsets.only(bottom: bottomHeight)),
        ],
      ),
    );
  }
}
