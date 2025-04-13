import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RecentSearchItem extends StatelessWidget {
  final String searchTerm;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const RecentSearchItem({
    Key? key,
    required this.searchTerm,
    required this.onTap,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: const Icon(TablerIcons.clock),
      title: Text(searchTerm),
      trailing: IconButton(
        icon: const Icon(TablerIcons.x),
        onPressed: onRemove,
      ),
    );
  }
}
