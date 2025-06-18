import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/settings/font_selection.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/reader_color.dart';
import 'package:archiverse/models/reader_font.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class _ReaderSettingsDialog extends StatefulWidget {
  const _ReaderSettingsDialog();

  @override
  State<_ReaderSettingsDialog> createState() => _ReaderSettingsDialogState();
}

class _ReaderSettingsDialogState extends State<_ReaderSettingsDialog> {
  late PreferencesProvider _prefs;
  late ReaderProvider _readerProvider;

  @override
  void initState() {
    super.initState();
    _prefs = context.read<PreferencesProvider>();
    _readerProvider = context.read<ReaderProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.6),
      child: Consumer<ReaderProvider>(
        builder: (context, settings, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 9.0),
              child: Container(
                color: context.colorScheme.surfaceContainer,
                child: Column(
                  children: [
                    TextHeader.large(
                      title: "Reader Settings",
                      icon: TablerIcons.settings,
                    ),
                    Divider(
                      height: 1,
                      color: context.colorScheme.surfaceContainerHigh,
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView(
                children: [
                  const SizedBox(height: 4.0),
                  _buildReaderColorSection(settings),
                  const SizedBox(height: 24.0),
                  _buildTextSizeSection(settings),
                  const SizedBox(height: 16),
                  _buildReadingLayoutSection(settings),
                  const SizedBox(height: 16),
                  _buildDisplaySection(settings),
                  SizedBox(height: 16 + context.screenPadding.bottom),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReaderColorSection(ReaderProvider settings) {
    return Column(
      children: [
        TextHeader.small(title: "Background Color"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: ReaderColor.values.map((color) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  selected: settings.readerColor == color,
                  onSelected: (selected) {
                    if (selected) {
                      _prefs.setString(
                        Preferences.readerBackgroundColor,
                        color.toString(),
                      );
                      _readerProvider.refresh();
                    }
                  },
                  backgroundColor: color.toBackgroundColor(context),
                  showCheckmark: false,
                  labelPadding: EdgeInsets.zero,
                  label: CircleAvatar(
                    backgroundColor: color.toBackgroundColor(context),
                    radius: 18.0,
                    child: (settings.readerColor == color)
                        ? Icon(
                            TablerIcons.check,
                            color: color.toForegroundColor(context),
                            size: 24.0,
                          )
                        : Icon(
                            color == ReaderColor.system
                                ? TablerIcons.sun_moon
                                : TablerIcons.letter_a,
                            color: color.toForegroundColor(context),
                            size: 24.0,
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

  Widget _buildTextSizeSection(ReaderProvider settings) {
    return OptionGroup(
      title: "Text and Fonts",
      children: [
        OptionTile.slider(
          title: context.strings.settings_text_size_adjust_label,
          icon: TablerIcons.typography,
          value: settings.textScaleFactor,
          onChanged: (value) {
            _prefs.setDouble(Preferences.textScaleFactor, value);
            _readerProvider.refresh();
          },
          min: 0.5,
          max: 2.5,
          divisions: 20,
        ),
        OptionTile.custom(
          title: "Header Font",
          widget: FontSelectionWidget(
            fonts: ReaderFont.values,
            selectedFont: settings.headingFont,
            onFontSelected: (font) {
              _prefs.setString(Preferences.readerHeadingFont, font.key);
              _readerProvider.refresh();
            },
            isHeading: true,
          ),
        ),
        OptionTile.custom(
          title: "Body Font",
          widget: FontSelectionWidget(
            fonts: ReaderFont.values,
            selectedFont: settings.bodyFont,
            onFontSelected: (font) {
              _prefs.setString(Preferences.readerBodyFont, font.key);
              _readerProvider.refresh();
            },
            isHeading: false,
          ),
        ),
      ],
    );
  }

  Widget _buildReadingLayoutSection(ReaderProvider settings) {
    return OptionGroup(
      title: "Reading Layout",
      children: [
        OptionTile.slider(
          title: context.strings.settings_layout_line_spacing,
          icon: TablerIcons.line_height,
          value: settings.lineHeight,
          onChanged: (value) {
            _prefs.setDouble(Preferences.lineHeight, value);
            _readerProvider.refresh();
          },
          min: 0.8,
          max: 2.0,
          divisions: 12,
        ),
        OptionTile.slider(
          title: context.strings.settings_layout_paragraph_spacing,
          icon: TablerIcons.spacing_vertical,
          value: settings.paragraphSpacing,
          onChanged: (value) {
            _prefs.setDouble(Preferences.paragraphSpacing, value);
            _readerProvider.refresh();
          },
          min: 0.8,
          max: 2.0,
          divisions: 12,
        ),
        OptionTile.switcher(
          title: context.strings.settings_layout_justify_text,
          icon: TablerIcons.align_justified,
          value: settings.justifyText,
          onChanged: (value) {
            _prefs.setBool(Preferences.readerJustifiedText, value);
            _readerProvider.refresh();
          },
        ),
      ],
    );
  }

  Widget _buildDisplaySection(ReaderProvider settings) {
    return OptionGroup(
      title: "Display",
      children: [
        OptionTile.switcher(
          title: context.strings.settings_scrolling_keep_screen_on,
          subtitle: context.strings.settings_scrolling_keep_screen_on_subtitle,
          icon: TablerIcons.screen_share,
          value: settings.keepScreenOn,
          onChanged: (value) {
            _prefs.setBool(Preferences.keepScreenOn, value);
            _readerProvider.refresh();
          },
        ),
      ],
    );
  }
}

class ReaderSettingsDialog {
  static void showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.surfaceContainer,
      builder: (BuildContext context) => const _ReaderSettingsDialog(),
    );
  }
}
