import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
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
          return <Widget>[SliverAppBar.large(title: const Text('Settings'))];
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
                    title: 'Theme & Appearance',
                    children: [
                      OptionTile.switcher(
                        title: 'Use System Theme',
                        icon: TablerIcons.device_desktop,
                        value: _useSystemTheme,
                        onChanged: (value) {
                          setState(() {
                            _useSystemTheme = value;
                          });
                        },
                      ),
                      OptionTile.switcher(
                        title: 'Dark Mode',
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
                        title: 'Use Wallpaper Colors',
                        icon: TablerIcons.palette,
                        value: _useWallpaperColors,
                        onChanged: (value) {
                          setState(() {
                            _useWallpaperColors = value;
                          });
                        },
                      ),
                      OptionTile.switcher(
                        title: 'High Contrast',
                        icon: TablerIcons.contrast,
                        value: _highContrastMode,
                        onChanged: (value) {
                          setState(() {
                            _highContrastMode = value;
                          });
                        },
                      ),
                      OptionTile.list(
                        title: 'Color Scheme',
                        icon: TablerIcons.color_swatch,
                        entries: [
                          'Default Blue',
                          'Vibrant Purple',
                          'Forest Green',
                          'Warm Orange',
                          'Classic Red',
                          'Cool Cyan',
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
                    title: 'Reading Experience',
                    children: [
                      OptionTile(
                        title: 'Text Size',
                        icon: TablerIcons.text_size,
                      ),
                      OptionTile(
                        title: 'Font Selection',
                        icon: TablerIcons.typography,
                      ),
                      OptionTile(
                        title: 'Reading Layout',
                        icon: TablerIcons.layout,
                      ),
                      OptionTile(
                        title: 'Scrolling Behavior',
                        icon: TablerIcons.swipe_down,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Content & Filters
                  OptionGroup(
                    title: 'Content & Filters',
                    children: [
                      OptionTile(
                        title: 'Content Warnings',
                        icon: TablerIcons.alert_triangle,
                      ),
                      OptionTile(title: 'Tag Filters', icon: TablerIcons.tag),
                      OptionTile(
                        title: 'Blocked Content',
                        icon: TablerIcons.ghost_off,
                      ),
                      OptionTile(
                        title: 'Rating Preferences',
                        icon: TablerIcons.shield,
                      ),
                      OptionTile(
                        title: 'Author Filters',
                        icon: TablerIcons.user_off,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Additional sections...
                  OptionGroup(
                    title: 'Storage & Data',
                    children: [
                      OptionTile(
                        title: 'Downloads',
                        icon: TablerIcons.download,
                      ),
                      OptionTile(
                        title: 'Cache Management',
                        icon: TablerIcons.refresh,
                      ),
                      OptionTile(
                        title: 'Reading History',
                        icon: TablerIcons.history,
                      ),
                      OptionTile(
                        title: 'Backup & Restore',
                        icon: TablerIcons.database,
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
