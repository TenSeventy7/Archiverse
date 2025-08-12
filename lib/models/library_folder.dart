import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryFolder {
  final int? id;
  final String name;
  final String? icon;
  final String color;
  final int count;

  static const Map<String, Color> colors = {
    'blue': Colors.blue,
    'red': Colors.red,
    'green': Colors.green,
    'amber': Colors.amber,
    'purple': Colors.purple,
    'orange': Colors.orange,
    'pink': Colors.pink,
    'teal': Colors.teal,
    'grey': Colors.grey,
    'brown': Colors.brown,
    'cyan': Colors.cyan,
    'indigo': Colors.indigo,
  };

  static const Map<String, IconData> icons = {
    'folder': TablerIcons.folder,
    'heart': TablerIcons.heart,
    'book': TablerIcons.book_2,
    'wand': TablerIcons.wand,
    'star': TablerIcons.star,
    'bookmark': TablerIcons.bookmark,
    'flame': TablerIcons.flame,
    'diamond': TablerIcons.diamond,
    'crown': TablerIcons.crown,
    'gift': TablerIcons.gift,
    'palette': TablerIcons.palette,
    'music': TablerIcons.music,
    'photo': TablerIcons.photo,
    'video': TablerIcons.video,
    'game': TablerIcons.device_gamepad_2,
    'coffee': TablerIcons.coffee,
    'chef_hat': TablerIcons.chef_hat,
    'plant': TablerIcons.plant,
    'moon': TablerIcons.moon,
    'sun': TablerIcons.sun,
    'sparkles': TablerIcons.sparkles,
    'rainbow': TablerIcons.rainbow,
    'shield': TablerIcons.shield,
    'sword': TablerIcons.sword,
  };

  const LibraryFolder({
    this.id,
    required this.name,
    required this.color,
    this.icon,
    this.count = 0,
  });

  @override
  String toString() {
    return 'LibraryFolder(id: $id, name: $name, icon: $icon, count: $count)';
  }

  LibraryFolder copyWith({
    int? id,
    String? name,
    String? icon,
    String? color,
    int? count,
  }) {
    return LibraryFolder(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      count: count ?? this.count,
    );
  }

  Color get accentColor {
    if (colors.containsKey(color)) {
      return colors[color]!;
    }

    // The color string is stored in hex ffffff if it's custom
    return Color(int.parse('0x$color'));
  }

  IconData get iconData {
    if (icon == null || !icons.containsKey(icon!)) {
      return TablerIcons.folder; // Default icon
    }

    return icons[icon!]!;
  }
}
