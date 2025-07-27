import 'package:archiverse/components/animated_checkmark.dart';
import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/slider_control.dart';
import 'package:archiverse/components/settings/reader_preview.dart';
import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:provider/provider.dart';

class ReadingExperienceSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/reading_environment';
  const ReadingExperienceSettingsActivity({super.key});

  @override
  State<ReadingExperienceSettingsActivity> createState() =>
      _ReadingEnvironmentSettingsActivityState();
}

class _ReadingEnvironmentSettingsActivityState
    extends State<ReadingExperienceSettingsActivity> {
  late PreferencesProvider _prefs;
  late ReaderProvider _readerProvider;

  // Current values
  double _paragraphSpacing =
      Preferences.defaults[Preferences.paragraphSpacing] as double;
  double _lineSpacing = Preferences.defaults[Preferences.lineHeight] as double;
  bool _justifyText =
      Preferences.defaults[Preferences.readerJustifiedText] as bool;
  bool _keepScreenOn = Preferences.defaults[Preferences.keepScreenOn] as bool;
  ReaderColor _readerBackgroundColor =
      Preferences.defaults[Preferences.readerBackgroundColor] as ReaderColor;

  @override
  void initState() {
    super.initState();
    _prefs = context.read<PreferencesProvider>();
    _readerProvider = context.read<ReaderProvider>();
    _loadSettings();
  }

  void _loadSettings() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _paragraphSpacing = _prefs.getDouble(
            Preferences.paragraphSpacing,
            defaultValue:
                Preferences.defaults[Preferences.paragraphSpacing] as double,
          );
          _lineSpacing = _prefs.getDouble(
            Preferences.lineHeight,
            defaultValue:
                Preferences.defaults[Preferences.lineHeight] as double,
          );
          _justifyText = _prefs.getBool(
            Preferences.readerJustifiedText,
            defaultValue:
                Preferences.defaults[Preferences.readerJustifiedText] as bool,
          );
          _keepScreenOn = _prefs.getBool(
            Preferences.keepScreenOn,
            defaultValue:
                Preferences.defaults[Preferences.keepScreenOn] as bool,
          );
          _readerBackgroundColor = ReaderColor.fromKey(
            _prefs.getString(Preferences.readerBackgroundColor) ??
                (Preferences.defaults[Preferences.readerBackgroundColor]
                        as ReaderColor)
                    .toString(),
          );
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _paragraphSpacing =
          Preferences.defaults[Preferences.paragraphSpacing] as double;
      _lineSpacing = Preferences.defaults[Preferences.lineHeight] as double;
      _justifyText =
          Preferences.defaults[Preferences.readerJustifiedText] as bool;
      _keepScreenOn = Preferences.defaults[Preferences.keepScreenOn] as bool;
      _readerBackgroundColor =
          Preferences.defaults[Preferences.readerBackgroundColor]
              as ReaderColor;
    });
    _saveAllSettings();
  }

  void _saveAllSettings() {
    _prefs.setDouble(Preferences.paragraphSpacing, _paragraphSpacing);
    _prefs.setDouble(Preferences.lineHeight, _lineSpacing);
    _prefs.setBool(Preferences.readerJustifiedText, _justifyText);
    _prefs.setBool(Preferences.keepScreenOn, _keepScreenOn);
    _prefs.setString(
      Preferences.readerBackgroundColor,
      _readerBackgroundColor.toString(),
    );
    _readerProvider.refresh();
  }

  void _updateParagraphSpacing(double value) {
    setState(() => _paragraphSpacing = value);
    _prefs.setDouble(Preferences.paragraphSpacing, value);
    _readerProvider.refresh();
  }

  void _updateLineSpacing(double value) {
    setState(() => _lineSpacing = value);
    _prefs.setDouble(Preferences.lineHeight, value);
    _readerProvider.refresh();
  }

  void _updateJustifyText(bool value) {
    setState(() => _justifyText = value);
    _prefs.setBool(Preferences.readerJustifiedText, value);
    _readerProvider.refresh();
  }

  void _updateKeepScreenOn(bool value) {
    setState(() => _keepScreenOn = value);
    _prefs.setBool(Preferences.keepScreenOn, value);
    _readerProvider.refresh();
  }

  void _updateReaderBackgroundColor(ReaderColor color) {
    setState(() => _readerBackgroundColor = color);
    _prefs.setString(Preferences.readerBackgroundColor, color.toString());
    _readerProvider.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      appBar: (controller) => _buildAppBar(context, controller),
      body: (controller) => Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPadding,
                    ),
                    child: const ReaderPreview(),
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

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ScrollController controller,
  ) {
    return ExpressiveAppBar(
      controller: controller,
      title: Text("Reader Settings"),
      actions: [
        IconButton(
          icon: const Icon(TablerIcons.rotate_2),
          onPressed: _resetToDefaults,
          tooltip: context.strings.settings_common_reset,
        ),
      ],
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return SettingsBottomPanel(
      padding: EdgeInsets.only(
        top: context.commonPaddingDouble,
        bottom: context.commonPadding,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: context.commonPadding,
          bottom: context.screenPadding.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildReaderBackgroundSelection(context),
            const Divider(height: 24),
            _buildSpacingControls(context),
            _buildTextOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReaderBackgroundSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.horizontalPaddingDouble,
          child: Row(
            children: [
              const Icon(TablerIcons.palette, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Background Color",
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
            children: ReaderColor.values.map((color) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  selected: _readerBackgroundColor == color,
                  onSelected: (selected) {
                    if (selected) _updateReaderBackgroundColor(color);
                  },
                  backgroundColor: color.toBackgroundColor(context),
                  showCheckmark: false,
                  labelPadding: EdgeInsets.zero,
                  label: CircleAvatar(
                    backgroundColor: color.toBackgroundColor(context),
                    radius: 18.0,
                    child: AnimatedCheckmark(
                      color: color.toForegroundColor(context),
                      size: 24.0,
                      selected: _readerBackgroundColor == color,
                      unselectedWidget: Icon(
                        color == ReaderColor.system
                            ? TablerIcons.sun_moon
                            : TablerIcons.letter_a,
                        color: color.toForegroundColor(context),
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
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

  Widget _buildTextOptions(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
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
        ),
        SwitchListTile(
          contentPadding: context.horizontalPaddingDouble,
          title: Row(
            children: [
              const Icon(TablerIcons.screen_share, size: 18),
              const SizedBox(width: 8),
              Text(
                context.strings.settings_scrolling_keep_screen_on,
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              context.strings.settings_scrolling_keep_screen_on_subtitle,
              style: context.textTheme.bodySmall,
            ),
          ),
          value: _keepScreenOn,
          onChanged: _updateKeepScreenOn,
        ),
      ],
    );
  }
}
