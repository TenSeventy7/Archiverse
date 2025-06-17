import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/slider_control.dart';
import 'package:archiverse/models/reading_layout.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:provider/provider.dart';

class ReadingLayoutSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/reading_layout';
  const ReadingLayoutSettingsActivity({super.key});

  @override
  State<ReadingLayoutSettingsActivity> createState() =>
      _ReadingLayoutSettingsActivityState();
}

class _ReadingLayoutSettingsActivityState
    extends State<ReadingLayoutSettingsActivity> {
  late PreferencesProvider _prefs;

  // Default values
  static const ReadingLayout _defaultLayout = ReadingLayout.singleColumn;
  static const double _defaultParagraphSpacing = 1.0;
  static const double _defaultLineSpacing = 1.2;
  static const bool _defaultJustifyText = false;

  // Current values
  ReadingLayout _selectedLayout = _defaultLayout;
  double _paragraphSpacing = _defaultParagraphSpacing;
  double _lineSpacing = _defaultLineSpacing;
  bool _justifyText = _defaultJustifyText;

  @override
  void initState() {
    super.initState();
    _prefs = context.read<PreferencesProvider>();
    _loadSettings();
  }

  void _loadSettings() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _selectedLayout = ReadingLayout.fromKey(
            _prefs.getString(Preferences.readingLayout) ?? _defaultLayout.key,
          );
          _paragraphSpacing = _prefs.getDouble(
            Preferences.paragraphSpacing,
            defaultValue: _defaultParagraphSpacing,
          );
          _lineSpacing = _prefs.getDouble(
            Preferences.lineHeight,
            defaultValue: _defaultLineSpacing,
          );
          _justifyText = _prefs.getBool(
            Preferences.readerJustifiedText,
            defaultValue: _defaultJustifyText,
          );
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _selectedLayout = _defaultLayout;
      _paragraphSpacing = _defaultParagraphSpacing;
      _lineSpacing = _defaultLineSpacing;
      _justifyText = _defaultJustifyText;
    });
    _saveAllSettings();
  }

  void _saveAllSettings() {
    _prefs.setString(Preferences.readingLayout, _selectedLayout.key);
    _prefs.setDouble(Preferences.paragraphSpacing, _paragraphSpacing);
    _prefs.setDouble(Preferences.lineHeight, _lineSpacing);
    _prefs.setBool(Preferences.readerJustifiedText, _justifyText);
  }

  void _updateLayout(ReadingLayout layout) {
    setState(() => _selectedLayout = layout);
    _prefs.setString(Preferences.readingLayout, layout.key);
  }

  void _updateParagraphSpacing(double value) {
    setState(() => _paragraphSpacing = value);
    _prefs.setDouble(Preferences.paragraphSpacing, value);
  }

  void _updateLineSpacing(double value) {
    setState(() => _lineSpacing = value);
    _prefs.setDouble(Preferences.lineHeight, value);
  }

  void _updateJustifyText(bool value) {
    setState(() => _justifyText = value);
    _prefs.setBool(Preferences.readerJustifiedText, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildAppBar(context),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPadding,
                    ),
                    child: _buildPreviewSection(context),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomControls(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: Text(context.strings.settings_layout_title),
      actions: [
        IconButton(
          icon: const Icon(TablerIcons.rotate_2),
          onPressed: _resetToDefaults,
          tooltip: context.strings.settings_common_reset,
        ),
      ],
      pinned: true,
    );
  }

  Widget _buildPreviewSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPreviewHeader(context),
          const Divider(height: 24),
          _buildLayoutPreview(context),
        ],
      ),
    );
  }

  Widget _buildPreviewHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          _selectedLayout.icon,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          _getLayoutDisplayName(context, _selectedLayout),
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return SettingsBottomPanel(
      padding: EdgeInsets.symmetric(vertical: context.commonPaddingDouble),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: context.commonPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLayoutSelection(context),
            const Divider(height: 24),
            _buildSpacingControls(context),
            _buildTextJustificationControl(context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildLayoutSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.horizontalPaddingDouble,
          child: Row(
            children: [
              const Icon(TablerIcons.spacing_vertical, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.strings.settings_layout_type,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
          child: Row(
            children: ReadingLayout.values.map((layout) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildLayoutChip(context, layout),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLayoutChip(BuildContext context, ReadingLayout layout) {
    return ChoiceChip(
      label: Text(_getLayoutDisplayName(context, layout)),
      selected: _selectedLayout == layout,
      onSelected: (selected) {
        if (selected) _updateLayout(layout);
      },
    );
  }

  Widget _buildSpacingControls(BuildContext context) {
    return Column(
      children: [
        SliderControl(
          title: context.strings.settings_layout_paragraph_spacing,
          icon: TablerIcons.spacing_vertical,
          value: _paragraphSpacing,
          onChanged: _updateParagraphSpacing,
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
        ),
        SliderControl(
          title: context.strings.settings_layout_line_spacing,
          icon: TablerIcons.line_height,
          value: _lineSpacing,
          onChanged: _updateLineSpacing,
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
        ),
      ],
    );
  }

  Widget _buildTextJustificationControl(BuildContext context) {
    return SwitchListTile(
      contentPadding: context.horizontalPaddingDouble,
      title: Row(
        children: [
          const Icon(TablerIcons.align_justified, size: 18),
          const SizedBox(width: 8),
          Text(
            context.strings.settings_layout_justify_text,
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
      value: _justifyText,
      onChanged: _updateJustifyText,
    );
  }

  Widget _buildLayoutPreview(BuildContext context) {
    final textStyle = TextStyle(height: _lineSpacing, fontSize: 16);
    final textAlign = _justifyText ? TextAlign.justify : TextAlign.start;

    final paragraph1 = Text(
      'The library was quiet that morning, with sunlight streaming through tall windows and casting long shadows across the wooden floors.',
      style: textStyle,
      textAlign: textAlign,
    );

    final paragraph2 = Text(
      'Sarah moved silently between the shelves, her fingers tracing the spines of countless books that had become her closest companions.',
      style: textStyle,
      textAlign: textAlign,
    );

    switch (_selectedLayout) {
      case ReadingLayout.singleColumn:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paragraph1,
            SizedBox(height: 16 * _paragraphSpacing),
            paragraph2,
          ],
        );

      case ReadingLayout.dualColumn:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: paragraph1),
            const SizedBox(width: 16),
            Expanded(child: paragraph2),
          ],
        );

      case ReadingLayout.paginated:
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paragraph1,
              SizedBox(height: 16 * _paragraphSpacing),
              const Center(
                child: Text(
                  '— 1 —',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        );
    }
  }

  String _getLayoutDisplayName(BuildContext context, ReadingLayout layout) {
    switch (layout) {
      case ReadingLayout.singleColumn:
        return context.strings.settings_layout_single_column;
      case ReadingLayout.dualColumn:
        return context.strings.settings_layout_dual_column;
      case ReadingLayout.paginated:
        return context.strings.settings_layout_paginated;
    }
  }
}
