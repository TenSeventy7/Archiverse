import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/font_selection.dart';
import 'package:archiverse/components/settings/text_size_control.dart';
import 'package:archiverse/components/settings/reader_preview.dart';
import 'package:archiverse/models/reader_font.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum FontType {
  heading,
  body;

  String get preferenceKey {
    switch (this) {
      case FontType.heading:
        return Preferences.readerHeadingFont;
      case FontType.body:
        return Preferences.readerBodyFont;
    }
  }
}

class TextFontsSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/typography';
  const TextFontsSettingsActivity({super.key});

  @override
  State<TextFontsSettingsActivity> createState() =>
      _TypographySettingsActivityState();
}

class _TypographySettingsActivityState extends State<TextFontsSettingsActivity>
    with TickerProviderStateMixin {
  late PreferencesProvider _prefs;
  late ReaderProvider _readerProvider;
  late TabController _tabController;

  // Current values
  double _textScale =
      Preferences.defaults[Preferences.textScaleFactor] as double;
  ReaderFont _selectedHeadingFont = ReaderFont.system;
  ReaderFont _selectedBodyFont = ReaderFont.system;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _prefs = context.read<PreferencesProvider>();
    _readerProvider = context.read<ReaderProvider>();
    _loadSettings();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          _selectedHeadingFont = ReaderFont.fromKey(
            _prefs.getString(Preferences.readerHeadingFont) ??
                ReaderFont.system.key,
          );
          _selectedBodyFont = ReaderFont.fromKey(
            _prefs.getString(Preferences.readerBodyFont) ??
                ReaderFont.system.key,
          );
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _textScale = Preferences.defaults[Preferences.textScaleFactor] as double;
      _selectedHeadingFont = ReaderFont.system;
      _selectedBodyFont = ReaderFont.system;
    });
    _saveAllSettings();
  }

  void _saveAllSettings() {
    _prefs.setDouble(Preferences.textScaleFactor, _textScale);
    _prefs.setString(Preferences.readerHeadingFont, _selectedHeadingFont.key);
    _prefs.setString(Preferences.readerBodyFont, _selectedBodyFont.key);
    _readerProvider.refresh();
  }

  void _updateTextScale(double value) {
    setState(() => _textScale = value);
    _prefs.setDouble(Preferences.textScaleFactor, value);
    _readerProvider.refresh();
  }

  void _updateFont(FontType type, ReaderFont font) {
    setState(() {
      switch (type) {
        case FontType.heading:
          _selectedHeadingFont = font;
          break;
        case FontType.body:
          _selectedBodyFont = font;
          break;
      }
    });
    _prefs.setString(type.preferenceKey, font.key);
    _readerProvider.refresh();
  }

  ReaderFont _getSelectedFont(FontType type) {
    switch (type) {
      case FontType.heading:
        return _selectedHeadingFont;
      case FontType.body:
        return _selectedBodyFont;
    }
  }

  String? _getFontFamily(ReaderFont font) {
    return font == ReaderFont.system ? null : font.toFontFamily;
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

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: Text("Text and Fonts"),
      pinned: true,
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
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text Size Control
          Padding(
            padding: EdgeInsets.all(context.commonPaddingDouble),
            child: TextSizeControl(
              value: _textScale,
              onChanged: _updateTextScale,
              label: context.strings.settings_text_size_adjust_label,
            ),
          ),
          const Divider(height: 1),
          // Font Selection Tabs
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: context.strings.settings_font_tab_headings),
              Tab(text: context.strings.settings_font_tab_body),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.15,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFontSelection(
                    context,
                    type: FontType.heading,
                    header: context.strings.settings_font_heading_select,
                  ),
                  _buildFontSelection(
                    context,
                    type: FontType.body,
                    header: context.strings.settings_font_body_select,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontSelection(
    BuildContext context, {
    required FontType type,
    required String header,
  }) {
    final selectedFont = _getSelectedFont(type);
    final isHeading = type == FontType.heading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
          child: Text(header, style: context.textTheme.titleSmall),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: FontSelectionWidget(
            fonts: ReaderFont.values,
            selectedFont: selectedFont,
            onFontSelected: (font) => _updateFont(type, font),
            isHeading: isHeading,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
