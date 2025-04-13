import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/settings/activity_author_filters_settings.dart';
import 'package:archiverse/views/settings/activity_backup_settings.dart';
import 'package:archiverse/views/settings/activity_blocked_content_settings.dart';
import 'package:archiverse/views/settings/activity_cache_management.dart';
import 'package:archiverse/views/settings/activity_content_warnings_settings.dart';
import 'package:archiverse/views/settings/activity_downloads.dart';
import 'package:archiverse/views/settings/activity_font_selection.dart';
import 'package:archiverse/views/settings/activity_rating_preferences.dart';
import 'package:archiverse/views/settings/activity_reading_history_settings.dart';
import 'package:archiverse/views/settings/activity_reading_layout_settings.dart';
import 'package:archiverse/views/settings/activity_scrolling_behavior_settings.dart';
import 'package:archiverse/views/settings/activity_tag_filters_settings.dart';
import 'package:archiverse/views/settings/activity_text_size_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SettingsActivity extends CommonActivity {
  static const String routeName = '/settings';
  const SettingsActivity({super.key});

  @override
  State<SettingsActivity> createState() => _SettingsActivityState();
}

class _SettingsActivityState extends State<SettingsActivity> {
  // Theme settings state
  // TODO: Save these settings in shared preferences or a similar persistent storage
  bool _darkMode = false;
  bool _useSystemTheme = true;
  bool _highContrastMode = false;
  bool _useWallpaperColors = true;
  Color _selectedColorScheme = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(title: Text(context.strings.settings_title)),
          ];
        },
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Theme & Appearance
                  OptionGroup(
                    title: context.strings.settings_category_theme,
                    children: [
                      OptionTile.switcher(
                        title: context.strings.settings_theme_system,
                        icon: TablerIcons.device_desktop,
                        value: _useSystemTheme,
                        onChanged: (value) {
                          setState(() {
                            _useSystemTheme = value;
                          });
                        },
                      ),
                      OptionTile.switcher(
                        title: context.strings.settings_theme_dark_mode,
                        icon: TablerIcons.moon,
                        value: _darkMode,
                        enabled: !_useSystemTheme,
                        onChanged: (value) {
                          setState(() {
                            _darkMode = value;
                          });
                        },
                      ),
                      OptionTile.switcher(
                        title: context.strings.settings_theme_wallpaper_colors,
                        icon: TablerIcons.palette,
                        value: _useWallpaperColors,
                        onChanged: (value) {
                          setState(() {
                            _useWallpaperColors = value;
                          });
                        },
                      ),
                      OptionTile.switcher(
                        title: context.strings.settings_theme_high_contrast,
                        icon: TablerIcons.contrast,
                        value: _highContrastMode,
                        onChanged: (value) {
                          setState(() {
                            _highContrastMode = value;
                          });
                        },
                      ),
                      OptionTile.list(
                        title: context.strings.settings_theme_color_scheme,
                        icon: TablerIcons.color_swatch,
                        entries: [
                          context.strings.settings_theme_color_blue,
                          context.strings.settings_theme_color_purple,
                          context.strings.settings_theme_color_green,
                          context.strings.settings_theme_color_orange,
                          context.strings.settings_theme_color_red,
                          context.strings.settings_theme_color_cyan,
                        ],
                        values: [
                          Colors.blue,
                          Colors.purple,
                          Colors.green,
                          Colors.orange,
                          Colors.red,
                          Colors.cyan,
                        ],
                        selectedValue: _selectedColorScheme,
                        onChanged: (value) {
                          setState(() {
                            _selectedColorScheme = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Reading Experience
                  OptionGroup(
                    title: context.strings.settings_category_reading,
                    children: [
                      OptionTile(
                        title: context.strings.settings_text_size_title,
                        icon: TablerIcons.text_size,
                        routeName: TextSizeSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_font_title,
                        icon: TablerIcons.typography,
                        routeName: FontSelectionSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_layout_title,
                        icon: TablerIcons.layout,
                        routeName: ReadingLayoutSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_scrolling_title,
                        icon: TablerIcons.swipe_down,
                        routeName: ScrollingBehaviorSettingsActivity.routeName,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Content & Filters
                  OptionGroup(
                    title: context.strings.settings_category_content,
                    children: [
                      OptionTile(
                        title: context.strings.settings_warnings_title,
                        icon: TablerIcons.alert_triangle,
                        routeName: ContentWarningsSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_tag_filters_title,
                        icon: TablerIcons.tag,
                        routeName: TagFiltersSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_blocked_content_title,
                        icon: TablerIcons.ghost_off,
                        routeName: BlockedContentActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_rating_title,
                        icon: TablerIcons.shield,
                        routeName: RatingPreferencesActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_author_filters_title,
                        icon: TablerIcons.user_off,
                        routeName: AuthorFiltersSettingsActivity.routeName,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Storage & Data section
                  OptionGroup(
                    title: context.strings.settings_category_storage,
                    children: [
                      OptionTile(
                        title: context.strings.settings_downloads_title,
                        icon: TablerIcons.download,
                        routeName: DownloadsSettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_cache_title,
                        icon: TablerIcons.refresh,
                        routeName: CacheManagementActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_history_title,
                        icon: TablerIcons.history,
                        routeName: ReadingHistorySettingsActivity.routeName,
                      ),
                      OptionTile(
                        title: context.strings.settings_backup_title,
                        icon: TablerIcons.database,
                        routeName: BackupRestoreActivity.routeName,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
