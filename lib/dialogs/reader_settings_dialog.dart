import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/reading_layout.dart';
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
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.5),
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
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: [
                  const SizedBox(height: 16.0),
                  _buildTextSizeSection(settings),
                  const SizedBox(height: 16),
                  _buildReadingLayoutSection(settings),
                  const SizedBox(height: 16),
                  _buildScrollingSection(settings),
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

  Widget _buildTextSizeSection(ReaderProvider settings) {
    return OptionGroup(
      title: "Text Size",
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
      ],
    );
  }

  Widget _buildReadingLayoutSection(ReaderProvider settings) {
    return OptionGroup(
      title: "Reading Layout",
      children: [
        OptionTile.list(
          title: context.strings.settings_layout_type,
          icon: TablerIcons.layout,
          entries: [
            context.strings.settings_layout_single_column,
            context.strings.settings_layout_dual_column,
            context.strings.settings_layout_paginated,
          ],
          values: ReadingLayout.values,
          selectedValue: settings.readingLayout,
          onChanged: (value) {
            _prefs.setString(Preferences.readingLayout, value.key);
            _readerProvider.refresh();
          },
        ),
        OptionTile.slider(
          title: context.strings.settings_layout_line_spacing,
          icon: TablerIcons.line_height,
          value: settings.lineHeight,
          onChanged: (value) {
            _prefs.setDouble(Preferences.lineHeight, value);
            _readerProvider.refresh();
          },
          min: 1.0,
          max: 2.0,
          divisions: 10,
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

  Widget _buildScrollingSection(ReaderProvider settings) {
    return OptionGroup(
      title: "Scrolling",
      children: [
        OptionTile.list(
          title: context.strings.settings_scrolling_type,
          icon: TablerIcons.arrows_vertical,
          entries: [
            context.strings.settings_scrolling_continuous,
            context.strings.settings_scrolling_paged,
          ],
          values: ScrollingType.values,
          selectedValue: settings.scrollingType,
          onChanged: (value) {
            _prefs.setString(Preferences.scrollingType, value.key);
            _readerProvider.refresh();
          },
        ),
        if (settings.scrollingType == ScrollingType.paged) ...[
          OptionTile.switcher(
            title: context.strings.settings_scrolling_tap_edges,
            subtitle: context.strings.settings_scrolling_tap_edges_subtitle,
            icon: TablerIcons.hand_click,
            value: settings.tapEdges,
            onChanged: (value) {
              _prefs.setBool(Preferences.scrollingTapEdges, value);
              _readerProvider.refresh();
            },
          ),
          OptionTile.switcher(
            title: context.strings.settings_scrolling_animation,
            icon: TablerIcons.keyframes,
            value: settings.useScrollAnimation,
            onChanged: (value) {
              _prefs.setBool(Preferences.scrollingAnimation, value);
              _readerProvider.refresh();
            },
          ),
        ],
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
