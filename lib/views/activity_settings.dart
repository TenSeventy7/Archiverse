import 'package:archiverse/components/animated_checkmark.dart';
import 'package:archiverse/components/expressive/nested_scroll_view.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/theming.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_theme.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/settings/activity_author_filters_settings.dart';
import 'package:archiverse/views/settings/activity_backup_settings.dart';
import 'package:archiverse/views/settings/activity_blocked_content_settings.dart';
import 'package:archiverse/views/settings/activity_cache_management.dart';
import 'package:archiverse/views/settings/activity_content_warnings_settings.dart';
import 'package:archiverse/views/settings/activity_downloads.dart';
import 'package:archiverse/views/settings/activity_rating_preferences.dart';
import 'package:archiverse/views/settings/activity_reading_experience_settings.dart';
import 'package:archiverse/views/settings/activity_reading_history_settings.dart';
import 'package:archiverse/views/settings/activity_tag_filters_settings.dart';
import 'package:archiverse/views/settings/activity_typography_settings.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
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

  // Current values
  AppThemeMode _themeMode =
      Preferences.defaults[Preferences.themeMode] as AppThemeMode;
  AppColorScheme _colorScheme =
      Preferences.defaults[Preferences.colorScheme] as AppColorScheme;

  @override
  void initState() {
    super.initState();
    _prefs = context.read<PreferencesProvider>();
    _loadSettings();
  }

  void _loadSettings() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        AppThemeMode defaultThemeMode =
            Preferences.defaults[Preferences.themeMode] as AppThemeMode;
        AppColorScheme defaultColorScheme =
            Preferences.defaults[Preferences.colorScheme] as AppColorScheme;

        setState(() {
          _themeMode = AppThemeMode.fromKey(
            _prefs.getString(Preferences.themeMode) ?? defaultThemeMode.key,
          );
          _colorScheme = AppColorScheme.fromKey(
            _prefs.getString(Preferences.colorScheme) ?? defaultColorScheme.key,
          );
        });
      }
    });
  }

  void _updateThemeMode(AppThemeMode mode) {
    setState(() => _themeMode = mode);
    Provider.of<ThemeProvider>(context, listen: false).setThemeMode(mode);
  }

  void _updateColorScheme(AppColorScheme scheme) {
    setState(() => _colorScheme = scheme);
    Provider.of<ThemeProvider>(context, listen: false).setColorScheme(scheme);
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      body: (controller) => ExpressiveNestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled, controller) => [
          ExpressiveSliverAppBar.medium(
            controller: controller,
            title: Text(context.strings.settings_title),
          ),
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
          title: "Text and Fonts",
          icon: TablerIcons.typography,
          routeName: TextFontsSettingsActivity.routeName,
        ),
        OptionTile(
          title: "Reading Experience",
          icon: TablerIcons.book_2,
          routeName: ReadingExperienceSettingsActivity.routeName,
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
      ],
    );
  }

  List<OptionTile> _buildThemeModeOptions(BuildContext context) {
    return [
      OptionTile.custom(
        title: "",
        padding: EdgeInsets.zero,
        enabled: _themeMode != AppThemeMode.system,
        widget: Opacity(
          opacity: _themeMode == AppThemeMode.system ? 0.5 : 1.0,
          child: IgnorePointer(
            ignoring: _themeMode == AppThemeMode.system,
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
                      mode: AppThemeMode.light,
                      icon: TablerIcons.sun,
                      label: context.strings.settings_ui_theme_light,
                      isSelected:
                          _themeMode == AppThemeMode.light ||
                          (_themeMode == AppThemeMode.system &&
                              !context.isDarkMode),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildThemeOption(
                      context: context,
                      mode: AppThemeMode.dark,
                      icon: TablerIcons.moon,
                      label: context.strings.settings_ui_theme_dark,
                      isSelected:
                          _themeMode == AppThemeMode.dark ||
                          (_themeMode == AppThemeMode.system &&
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
        value: _themeMode == AppThemeMode.system,
        onChanged: (value) {
          _updateThemeMode(
            value
                ? AppThemeMode.system
                : (context.isDarkMode ? AppThemeMode.dark : AppThemeMode.light),
          );
        },
      ),
    ];
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required AppThemeMode mode,
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
      widget: DynamicColorBuilder(
        builder: (lightScheme, darkScheme) {
          final dynamicColorScheme = context.isDarkMode
              ? darkScheme
              : lightScheme;
          final isSupportDynamicColor = context
              .read<ThemeProvider>()
              .supportsDynamicColor;

          return Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: AppColorScheme.values.map((scheme) {
                final isDynamic = scheme == AppColorScheme.dynamic;
                final colorScheme = context.isDarkMode
                    ? scheme.darkColorScheme
                    : scheme.lightColorScheme;

                if (isDynamic && !isSupportDynamicColor) {
                  return const SizedBox.shrink();
                }

                return ChoiceChip(
                  selected: _colorScheme == scheme,
                  onSelected: (selected) {
                    if (selected) _updateColorScheme(scheme);
                  },
                  showCheckmark: false,
                  labelPadding: EdgeInsets.zero,
                  label: CircleAvatar(
                    backgroundColor: isDynamic
                        ? dynamicColorScheme?.primary
                        : colorScheme.primary,
                    radius: 18.0,
                    child: AnimatedCheckmark(
                      color: isDynamic && dynamicColorScheme != null
                          ? dynamicColorScheme.primaryContainer
                          : colorScheme.primaryContainer,
                      size: 24.0,
                      selected: _colorScheme == scheme,
                      unselectedWidget: isDynamic
                          ? Icon(
                              TablerIcons.palette,
                              color: dynamicColorScheme?.primaryContainer,
                              size: 24.0,
                            )
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
