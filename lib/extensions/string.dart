import 'dart:ui';

extension StringExtensions on String {
  /// Converts a string to a valid color hex code.
  Color toColor() {
    // Remove any leading '#' if present
    final color = replaceFirst('#', '');
    // The color string is stored in hex ffffff if it's custom
    return Color(int.parse('0x$color'));
  }

  /// Capitalizes the first letter of the string.
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
