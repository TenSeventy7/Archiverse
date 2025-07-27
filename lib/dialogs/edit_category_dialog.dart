import 'package:archiverse/api.dart';
import 'package:archiverse/components/animated_checkmark.dart';
import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/icon_selector.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/api_library.dart';
import 'package:archiverse/extensions/string.dart';
import 'package:archiverse/models/library_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _EditCategoryDialog extends StatefulWidget {
  final LibraryCategory? category; // null for add, non-null for edit

  const _EditCategoryDialog({this.category});

  @override
  State<_EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<_EditCategoryDialog> {
  late final TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();
  String? _nameError;
  IconData? _selectedIcon;
  bool _isLoading = false;
  String _selectedColor = 'blue'; // Default color, can be changed later

  bool get isEditing => widget.category != null;
  bool get isNameValid =>
      _nameError == null && _nameController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.name ?? '');
    _nameController.addListener(_validateName);
    if (widget.category != null) {
      _selectedIcon = widget.category!.iconData;
      _selectedColor = widget.category!.color;
    }
  }

  @override
  void dispose() {
    _nameController.removeListener(_validateName);
    _nameController.dispose();
    super.dispose();
  }

  void _validateName() {
    final name = _nameController.text.trim();
    String? error;

    if (name.isEmpty) {
      error = 'Folder name cannot be empty';
    } else if (name.length < 2) {
      error = 'Folder name must be at least 2 characters';
    } else if (name.length > 50) {
      error = 'Folder name must be less than 50 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9\s\-_\.]+$').hasMatch(name)) {
      error = 'Folder name contains invalid characters';
    }

    if (_nameError != error) {
      setState(() {
        _nameError = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog.fullscreen(
      child: ExpressiveScaffold(
        appBar: (controller) => ExpressiveAppBar(
          controller: controller,
          elevation: 0,
          scrolledUnderElevation: 1,
          title: Text(isEditing ? 'Edit folder' : 'Create folder'),
          leading: IconButton(
            icon: Icon(
              TablerIcons.x,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: _isLoading ? null : () => Navigator.pop(context),
            tooltip: 'Close',
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilledButton(
                onPressed: (_isLoading || !isNameValid) ? null : _handleSave,
                child: _isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    : Text(isEditing ? 'Save' : 'Create'),
              ),
            ),
          ],
        ),
        body: (controller) => SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconSelector(
                selectedIcon: _selectedIcon,
                color: LibraryCategory.colors[_selectedColor],
                onIconSelected: (icon) {
                  setState(() {
                    _selectedIcon = icon;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Folder name',
                  hintText: 'Think of a creative name',
                  prefixIcon: const Icon(TablerIcons.folder),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.3),

                  errorText: _nameError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: colorScheme.error, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: colorScheme.error, width: 2),
                  ),
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 16.0),

              // Color selector section
              TextHeader.medium(
                hasPadding: false,
                title: 'Folder Color',
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    TablerIcons.palette,
                    size: 22,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 4.0),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: LibraryCategory.colors.entries
                    .map(
                      (entry) => _buildColorChip(
                        entry.value,
                        entry.key,
                        _selectedColor == entry.key,
                      ),
                    )
                    .toList(),
              ),

              // TODO: Add custom color picker

              // Bottom spacing for comfortable scrolling
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorChip(Color colorValue, String colorKey, bool isSelected) {
    return ChoiceChip(
      label: CircleAvatar(
        backgroundColor: colorValue,
        radius: 20,
        child: AnimatedCheckmark(
          color: _getContrastingColor(colorValue),
          size: 24,
          selected: isSelected,
        ),
      ),
      labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.all(8),
      selected: isSelected,
      showCheckmark:
          false, // Because f*ck Flutter's ChoiceChip having constraints on the avatar
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedColor = colorKey;
          });
        }
      },
    );
  }

  Color _getContrastingColor(Color backgroundColor) {
    // Calculate luminance to determine if we should use black or white
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Future<void> _handleSave() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      if (isEditing) {
        final updatedCategory = LibraryCategory(
          id: widget.category!.id,
          name: name,
          icon: _getStringFromIcon(_selectedIcon ?? TablerIcons.folder),
          color: _selectedColor,
        );
        await AppApi().updateLibraryCategory(updatedCategory);
      } else {
        await AppApi().createLibraryCategory(
          name,
          color: _selectedColor,
          icon: _getStringFromIcon(_selectedIcon ?? TablerIcons.folder),
        );
      }

      if (mounted) {
        Navigator.pop(context, true); // Return true to indicate success
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEditing
                  ? 'Error updating category: $e'
                  : 'Error adding category: $e',
            ),
          ),
        );
      }
    }
  }

  String _getStringFromIcon(IconData icon) {
    return LibraryCategory.icons.entries
        .firstWhere(
          (entry) => entry.value == icon,
          orElse: () => const MapEntry('folder', TablerIcons.folder),
        )
        .key;
  }
}

class EditCategoryDialog {
  static Future<bool?> show(BuildContext context, {LibraryCategory? category}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => _EditCategoryDialog(category: category),
    );
  }
}
