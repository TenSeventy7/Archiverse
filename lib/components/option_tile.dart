import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? routeName;
  final bool enabled;
  final Widget? trailing;

  const OptionTile({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
    this.onTap,
    this.routeName,
    this.enabled = true,
  });

  // Factory constructor for switch variant
  const factory OptionTile.switcher({
    required String title,
    IconData? icon,
    Widget? trailing,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool enabled,
  }) = _SwitchOptionTile;

  // Factory constructor for list variant
  const factory OptionTile.list({
    required String title,
    IconData? icon,
    Widget? trailing,
    required List<String> entries,
    required List<dynamic> values,
    required dynamic selectedValue,
    required ValueChanged<dynamic> onChanged,
  }) = _ListOptionTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon != null ? Icon(icon) : null,
      trailing: _buildTrailingWidget(
        child: const Icon(TablerIcons.chevron_right),
      ),
      onTap:
          onTap ??
          (routeName != null
              ? () => context.navigator.pushNamed(routeName!)
              : null),
    );
  }

  Widget? _buildTrailingWidget({required Widget child}) {
    if (trailing == null) {
      return child;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [trailing!, const SizedBox(width: 8), child],
    );
  }
}

class _SwitchOptionTile extends OptionTile {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchOptionTile({
    required super.title,
    super.icon,
    super.trailing,
    super.enabled = true,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon != null ? Icon(icon) : null,
      trailing: _buildTrailingWidget(
        child: Switch(value: value, onChanged: enabled ? onChanged : null),
      ),
      enabled: enabled,
      onTap:
          enabled
              ? () {
                onChanged(!value);
              }
              : null,
    );
  }
}

class _ListOptionTile extends OptionTile {
  final List<String> entries;
  final List<dynamic> values;
  final dynamic selectedValue;
  final ValueChanged<dynamic> onChanged;

  const _ListOptionTile({
    required super.title,
    super.icon,
    super.trailing,
    required this.entries,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(_getSelectedEntryName()),
      leading: icon != null ? Icon(icon) : null,
      trailing: trailing,
      onTap: () => _showOptionsDialog(context),
    );
  }

  String _getSelectedEntryName() {
    final index = values.indexOf(selectedValue);
    if (index != -1 && index < entries.length) {
      return entries[index];
    }
    return '';
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final isSelected = values[index] == selectedValue;
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Text(entries[index]),
                  trailing: isSelected ? const Icon(TablerIcons.check) : null,
                  onTap: () {
                    onChanged(values[index]);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.strings.dialog_cancel),
            ),
          ],
        );
      },
    );
  }
}
