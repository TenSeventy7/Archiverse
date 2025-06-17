import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum ReadingLayout {
  singleColumn,
  dualColumn,
  paginated;

  String get key {
    switch (this) {
      case ReadingLayout.singleColumn:
        return 'single_column';
      case ReadingLayout.dualColumn:
        return 'dual_column';
      case ReadingLayout.paginated:
        return 'paginated';
    }
  }

  IconData get icon {
    switch (this) {
      case ReadingLayout.singleColumn:
        return TablerIcons.baseline_density_small;
      case ReadingLayout.dualColumn:
        return TablerIcons.columns_3;
      case ReadingLayout.paginated:
        return TablerIcons.book;
    }
  }

  static ReadingLayout fromKey(String key) {
    return ReadingLayout.values.firstWhere(
      (layout) => layout.key == key,
      orElse: () => ReadingLayout.singleColumn,
    );
  }
}
