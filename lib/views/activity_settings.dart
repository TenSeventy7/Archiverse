import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/theming.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
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
import 'package:flutter/material.dart' hide ThemeMode, ColorScheme;
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class SettingsActivity extends CommonActivity {
  static const String routeName = '/settings';

  const SettingsActivity({super.key});

  @override
  State<SettingsActivity> createState() => _SettingsActivityState();
}

class _SettingsActivityState extends State<SettingsActivity> {
  late PreferencesProvider _prefs;

  // Default values
  static const ThemeMode _defaultThemeMode = ThemeMode.system;
  static const ColorScheme _defaultColorScheme = ColorScheme.red;
  static const bool _defaultShowStatusBar = true;
  static const bool _defaultShowNavigationBar = true;

  // Current values
  ThemeMode _themeMode = _defaultThemeMode;
  ColorScheme _colorScheme = _defaultColorScheme;
  bool _showStatusBar = _defaultShowStatusBar;
  bool _showNavigationBar = _defaultShowNavigationBar;

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
          _themeMode = ThemeMode.fromKey(
            _prefs.getString(Preferences.themeMode) ?? _defaultThemeMode.key,
          );
          _colorScheme = ColorScheme.fromKey(
            _prefs.getString(Preferences.colorScheme) ??
                _defaultColorScheme.key,
          );
          _showStatusBar = _prefs.getBool(
            Preferences.showStatusBar,
            defaultValue: _defaultShowStatusBar,
          );
          _showNavigationBar = _prefs.getBool(
            Preferences.showNavigationBar,
            defaultValue: _defaultShowNavigationBar,
          );
        });
      }
    });
  }

  void _updateThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
    _prefs.setString(Preferences.themeMode, mode.key);
  }

  void _updateColorScheme(ColorScheme scheme) {
    setState(() => _colorScheme = scheme);
    _prefs.setString(Preferences.colorScheme, scheme.key);
  }

  void _updateShowStatusBar(bool value) {
    setState(() => _showStatusBar = value);
    _prefs.setBool(Preferences.showStatusBar, value);
  }

  void _updateShowNavigationBar(bool value) {
    setState(() => _showNavigationBar = value);
    _prefs.setBool(Preferences.showNavigationBar, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(title: Text(context.strings.settings_title)),
        ],
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildAppearanceSection(context),
                  const SizedBox(height: 16.0),
                  _buildReadingSettings(context),
                  const SizedBox(height: 16.0),
                  _buildContentSettings(context),
                  const SizedBox(height: 16.0),
                  _buildStorageSettings(context),
                  const SizedBox(height: 32.0),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OptionGroup _buildReadingSettings(BuildContext context) {
    return OptionGroup(
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
    );
  }

  OptionGroup _buildContentSettings(BuildContext context) {
    return OptionGroup(
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
    );
  }

  OptionGroup _buildStorageSettings(BuildContext context) {
    return OptionGroup(
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
    );
  }

  Widget _buildAppearanceSection(BuildContext context) {
    return OptionGroup(
      title: context.strings.settings_ui_theme,
      children: [
        ..._buildThemeModeOptions(context),
        _buildColorSchemeSelection(context),
        ..._buildSystemUISettings(context),
      ],
    );
  }

  List<OptionTile> _buildThemeModeOptions(BuildContext context) {
    return [
      OptionTile.custom(
        title: "",
        padding: EdgeInsets.zero,
        enabled: _themeMode != ThemeMode.system,
        widget: Opacity(
          opacity: _themeMode == ThemeMode.system ? 0.5 : 1.0,
          child: IgnorePointer(
            ignoring: _themeMode == ThemeMode.system,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildThemeOption(
                      context: context,
                      mode: ThemeMode.light,
                      icon: TablerIcons.sun,
                      label: context.strings.settings_ui_theme_light,
                      isSelected:
                          _themeMode == ThemeMode.light ||
                          (_themeMode == ThemeMode.system &&
                              !context.isDarkMode),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildThemeOption(
                      context: context,
                      mode: ThemeMode.dark,
                      icon: TablerIcons.moon,
                      label: context.strings.settings_ui_theme_dark,
                      isSelected:
                          _themeMode == ThemeMode.dark ||
                          (_themeMode == ThemeMode.system &&
                              context.isDarkMode),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      OptionTile.switcher(
        title: context.strings.settings_ui_theme_system,
        subtitle: context.strings.settings_ui_theme_system_subtitle,
        icon: TablerIcons.device_desktop,
        value: _themeMode == ThemeMode.system,
        onChanged: (value) {
          _updateThemeMode(value ? ThemeMode.system : ThemeMode.light);
        },
      ),
    ];
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required ThemeMode mode,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _updateThemeMode(mode),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withOpacity(0.5),
              width: isSelected ? 2 : 1,
            ),
            color: isSelected
                ? colorScheme.primaryContainer.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceVariant,
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: isSelected
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline,
                    width: 2,
                  ),
                  color: isSelected ? colorScheme.primary : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(
                        TablerIcons.check,
                        size: 16,
                        color: colorScheme.onPrimary,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  OptionTile _buildColorSchemeSelection(BuildContext context) {
    return OptionTile.custom(
      title: context.strings.settings_ui_color_scheme,
      widget: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: Wrap(
          spacing: 8,
          children: ColorScheme.values.map((scheme) {
            return ChoiceChip(
              selected: _colorScheme == scheme,
              onSelected: (selected) {
                if (selected) _updateColorScheme(scheme);
              },
              showCheckmark: false,
              labelPadding: EdgeInsets.zero,
              label: CircleAvatar(
                backgroundColor: scheme.primaryColor(context),
                radius: 18.0,
                child: _colorScheme == scheme
                    ? Icon(
                        TablerIcons.check,
                        color: context.isDarkMode
                            ? Colors.black87
                            : Colors.white,
                        size: 24.0,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<OptionTile> _buildSystemUISettings(BuildContext context) {
    return [
      OptionTile.switcher(
        title: context.strings.settings_ui_show_status_bar,
        subtitle: context.strings.settings_ui_show_status_bar_subtitle,
        icon: TablerIcons.layout_navbar,
        value: _showStatusBar,
        onChanged: _updateShowStatusBar,
      ),
      OptionTile.switcher(
        title: context.strings.settings_ui_show_navigation_bar,
        subtitle: context.strings.settings_ui_show_navigation_bar_subtitle,
        icon: TablerIcons.layout_bottombar,
        value: _showNavigationBar,
        onChanged: _updateShowNavigationBar,
      ),
    ];
  }
}
