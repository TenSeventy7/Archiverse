import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
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

class FontOption {
  final String name;
  final String? fontFamily;
  final bool isSystemDefault;

  const FontOption({
    required this.name,
    this.fontFamily,
    this.isSystemDefault = false,
  });

  static const systemDefault = FontOption(
    name: 'System Default',
    isSystemDefault: true,
  );
}

class FontSelectionSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/font_selection';
  const FontSelectionSettingsActivity({super.key});

  @override
  State<FontSelectionSettingsActivity> createState() =>
      _FontSelectionSettingsActivityState();
}

class _FontSelectionSettingsActivityState
    extends State<FontSelectionSettingsActivity>
    with TickerProviderStateMixin {
  late PreferencesProvider _prefs;
  late TabController _tabController;

  // Font selections
  String _selectedHeadingFont = FontOption.systemDefault.name;
  String _selectedBodyFont = FontOption.systemDefault.name;

  // Available fonts
  static const List<FontOption> _availableFonts = [
    FontOption.systemDefault,
    FontOption(name: 'Roboto', fontFamily: 'Roboto'),
    FontOption(name: 'Open Sans', fontFamily: 'Open Sans'),
    FontOption(name: 'Merriweather', fontFamily: 'Merriweather'),
    FontOption(name: 'Lora', fontFamily: 'Lora'),
    FontOption(name: 'Source Serif Pro', fontFamily: 'Source Serif Pro'),
    FontOption(name: 'Playfair Display', fontFamily: 'Playfair Display'),
    FontOption(name: 'Montserrat', fontFamily: 'Montserrat'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _prefs = context.read<PreferencesProvider>();
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
          _selectedHeadingFont =
              _prefs.getString(
                Preferences.readerHeadingFont,
                defaultValue: FontOption.systemDefault.name,
              ) ??
              FontOption.systemDefault.name;

          _selectedBodyFont =
              _prefs.getString(
                Preferences.readerBodyFont,
                defaultValue: FontOption.systemDefault.name,
              ) ??
              FontOption.systemDefault.name;
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _selectedHeadingFont = FontOption.systemDefault.name;
      _selectedBodyFont = FontOption.systemDefault.name;
    });
    _saveAllSettings();
  }

  void _saveAllSettings() {
    _prefs.setString(Preferences.readerHeadingFont, _selectedHeadingFont);
    _prefs.setString(Preferences.readerBodyFont, _selectedBodyFont);
  }

  void _updateFont(FontType type, String fontName) {
    setState(() {
      switch (type) {
        case FontType.heading:
          _selectedHeadingFont = fontName;
          break;
        case FontType.body:
          _selectedBodyFont = fontName;
          break;
      }
    });
    _prefs.setString(type.preferenceKey, fontName);
  }

  String _getSelectedFont(FontType type) {
    switch (type) {
      case FontType.heading:
        return _selectedHeadingFont;
      case FontType.body:
        return _selectedBodyFont;
    }
  }

  String? _getFontFamily(String fontName) {
    final fontOption = _availableFonts.firstWhere(
      (font) => font.name == fontName,
      orElse: () => FontOption.systemDefault,
    );
    return fontOption.isSystemDefault ? null : fontOption.fontFamily;
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
      title: Text(context.strings.settings_font_title),
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

  Widget _buildPreviewSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'The Bookworm',
            style: context.textTheme.headlineSmall?.copyWith(
              fontFamily: _getFontFamily(_selectedHeadingFont),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'By Arthur Reading',
            style: context.textTheme.titleMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedHeadingFont),
              fontStyle: FontStyle.italic,
              color: context.colorScheme.secondary,
            ),
          ),
          const Divider(height: 32),
          Text(
            'It was an ordinary Tuesday when Sarah discovered the book that would change her life. Bound in worn leather with faded gold lettering, it seemed to call to her from the dusty shelf in the back corner of the antique store.',
            style: context.textTheme.bodyMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedBodyFont),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'As she turned the first yellowed page, the words began to shimmer and dance before her eyes. She blinked, thinking it must be a trick of the light, but when she looked again, the text was transforming right in front of her.',
            style: context.textTheme.bodyMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedBodyFont),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return SettingsBottomPanel(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
          child: Text(header, style: context.textTheme.titleSmall),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: context.commonPaddingDouble,
            ),
            itemCount: _availableFonts.length,
            itemBuilder: (context, index) {
              final font = _availableFonts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildFontChip(
                  context,
                  font: font,
                  isSelected: selectedFont == font.name,
                  isHeading: isHeading,
                  onSelected: () => _updateFont(type, font.name),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFontChip(
    BuildContext context, {
    required FontOption font,
    required bool isSelected,
    required bool isHeading,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      label: Text(
        font.name,
        style: font.isSystemDefault
            ? null
            : TextStyle(
                fontFamily: font.fontFamily,
                fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
              ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) onSelected();
      },
    );
  }
}
