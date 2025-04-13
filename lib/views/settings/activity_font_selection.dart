import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';

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
  String _selectedHeadingFont = 'System Default';
  String _selectedBodyFont = 'System Default';

  late TabController _tabController;

  // Sample fonts - in a real app, you'd have more options and actual font families
  final List<String> _availableFonts = [
    'System Default',
    'Roboto',
    'Open Sans',
    'Merriweather',
    'Lora',
    'Source Serif Pro',
    'Playfair Display',
    'Montserrat',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedHeadingFont = context.strings.settings_font_system_default;
        _selectedBodyFont = context.strings.settings_font_system_default;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top section with app bar and preview
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar.large(
                  title: Text(context.strings.settings_font_title),
                  pinned: true,
                  actions: [
                    IconButton(
                      icon: const Icon(TablerIcons.rotate_2),
                      onPressed: () {
                        setState(() {
                          _selectedHeadingFont =
                              context.strings.settings_font_system_default;
                          _selectedBodyFont =
                              context.strings.settings_font_system_default;
                        });
                      },
                      tooltip: context.strings.settings_common_reset,
                    ),
                  ],
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPadding,
                    ),
                    child: _buildPreviewSection(),
                  ),
                ),
              ],
            ),
          ),

          // Inside the build method, replace the bottom container with:

          // Bottom section with font controls
          SettingsBottomPanel(
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
                Container(
                  height: context.screenHeight * 0.15,
                  padding: EdgeInsets.only(top: 16, bottom: 24),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildFontChipSection(
                        header: context.strings.settings_font_heading_select,
                        isHeading: true,
                        selectedFont: _selectedHeadingFont,
                      ),
                      _buildFontChipSection(
                        header: context.strings.settings_font_body_select,
                        selectedFont: _selectedBodyFont,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontChipSection({
    required String header,
    required String selectedFont,
    bool isHeading = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
          child: Text(header, style: TextStyle(fontSize: 14)),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
            children:
                _availableFonts.map((font) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label:
                          font == context.strings.settings_font_system_default
                              ? Text(font)
                              : Text(
                                font,
                                style: TextStyle(
                                  fontFamily: font,
                                  fontWeight:
                                      isHeading
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),
                      selected: selectedFont == font,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            if (isHeading) {
                              _selectedHeadingFont = font;
                            } else {
                              _selectedBodyFont = font;
                            }
                          });
                        }
                      },
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  // Helper to get font family (returns empty for system default)
  String _getFontFamily(String font) {
    // This would actually set the real font family in a production app
    // For now we're just returning the font name for demonstration
    return font == context.strings.settings_font_system_default ? '' : font;
  }

  Widget _buildPreviewSection() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'The Bookworm',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: _getFontFamily(_selectedHeadingFont),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'By Arthur Reading',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedHeadingFont),
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Divider(height: 32),
          Text(
            'It was an ordinary Tuesday when Sarah discovered the book that would change her life. Bound in worn leather with faded gold lettering, it seemed to call to her from the dusty shelf in the back corner of the antique store.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedBodyFont),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'As she turned the first yellowed page, the words began to shimmer and dance before her eyes. She blinked, thinking it must be a trick of the light, but when she looked again, the text was transforming right in front of her.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: _getFontFamily(_selectedBodyFont),
            ),
          ),
        ],
      ),
    );
  }
}
