import 'package:archiverse/models/library_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class IconSelector extends StatelessWidget {
  final IconData? selectedIcon;
  final Color? color;
  final Function(IconData) onIconSelected;

  const IconSelector({
    super.key,
    this.selectedIcon,
    this.color,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.only(top: 24.0, bottom: 32.0),
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: effectiveColor.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                selectedIcon ?? TablerIcons.folder,
                color: effectiveColor,
                size: 48,
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton.filledTonal(
                onPressed: () => _showIconSelectionDialog(context),
                iconSize: 22,
                icon: Icon(
                  selectedIcon != null ? TablerIcons.pencil : TablerIcons.plus,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showIconSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Icon'),
          children: [
            Divider(height: 1),
            Container(
              width: 300,
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Scrollbar(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: LibraryFolder.icons.length,
                  itemBuilder: (context, index) {
                    final entry = LibraryFolder.icons.entries.elementAt(index);
                    final isSelected = selectedIcon == entry.value;

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          onIconSelected(entry.value);
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerLowest,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(
                                      context,
                                    ).colorScheme.outline.withOpacity(0.2),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Icon(
                              entry.value,
                              size: 32,
                              color: isSelected
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(height: 1),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ],
        );
      },
    );
  }
}
