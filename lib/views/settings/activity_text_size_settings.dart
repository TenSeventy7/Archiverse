import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/text_size_control.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class TextSizeSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/text_size';
  const TextSizeSettingsActivity({super.key});

  @override
  State<TextSizeSettingsActivity> createState() =>
      _TextSizeSettingsActivityState();
}

class _TextSizeSettingsActivityState extends State<TextSizeSettingsActivity> {
  late PreferencesProvider _prefs;

  // Current values
  double _textScale =
      Preferences.defaults[Preferences.textScaleFactor] as double;

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
          _textScale = _prefs.getDouble(
            Preferences.textScaleFactor,
            defaultValue:
                Preferences.defaults[Preferences.textScaleFactor] as double,
          );
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _textScale = Preferences.defaults[Preferences.textScaleFactor] as double;
    });
    _saveSettings();
  }

  void _saveSettings() {
    _prefs.setDouble(Preferences.textScaleFactor, _textScale);
  }

  void _updateTextScale(double value) {
    setState(() => _textScale = value);
    _prefs.setDouble(Preferences.textScaleFactor, value);
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
      title: Text(context.strings.settings_text_size_title),
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.settings_text_size_preview_title,
            style: context.textTheme.titleLarge,
          ),
          const Divider(height: 24),
          _buildTextSizeExamples(context),
        ],
      ),
    );
  }

  Widget _buildTextSizeExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScaledText(
          context,
          text: context.strings.settings_text_size_heading,
          baseStyle: context.textTheme.headlineSmall,
          spacing: 16,
        ),
        _buildScaledText(
          context,
          text: context.strings.settings_text_size_subheading,
          baseStyle: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.secondary,
          ),
          spacing: 24,
        ),
        _buildScaledText(
          context,
          text: context.strings.settings_text_size_body,
          baseStyle: context.textTheme.bodyMedium,
          spacing: 16,
        ),
        _buildScaledText(
          context,
          text: context.strings.settings_text_size_body,
          baseStyle: context.textTheme.bodyMedium,
          spacing: 0,
        ),
      ],
    );
  }

  Widget _buildScaledText(
    BuildContext context, {
    required String text,
    required TextStyle? baseStyle,
    required double spacing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: baseStyle?.copyWith(
            fontSize: (baseStyle.fontSize ?? 14) * _textScale,
          ),
        ),
        if (spacing > 0) SizedBox(height: spacing),
      ],
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return SettingsBottomPanel(
      child: TextSizeControl(
        value: _textScale,
        onChanged: _updateTextScale,
        label: context.strings.settings_text_size_adjust_label,
      ),
    );
  }
}
