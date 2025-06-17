import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/preferences.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:provider/provider.dart';

enum ScrollingType {
  continuous,
  paged;

  String get key {
    switch (this) {
      case ScrollingType.continuous:
        return 'continuous';
      case ScrollingType.paged:
        return 'paged';
    }
  }

  static ScrollingType fromKey(String key) {
    return ScrollingType.values.firstWhere(
      (type) => type.key == key,
      orElse: () => ScrollingType.continuous,
    );
  }
}

class ScrollingBehaviorSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/scrolling_behavior';
  const ScrollingBehaviorSettingsActivity({super.key});

  @override
  State<ScrollingBehaviorSettingsActivity> createState() =>
      _ScrollingBehaviorSettingsActivityState();
}

class _ScrollingBehaviorSettingsActivityState
    extends State<ScrollingBehaviorSettingsActivity> {
  late PreferencesProvider _prefs;

  // Default values
  static const ScrollingType _defaultScrollType = ScrollingType.continuous;
  static const bool _defaultUsePhysics = true;
  static const double _defaultScrollSensitivity = 1.0;
  static const bool _defaultKeepScreenOn = true;
  static const bool _defaultShowIndicator = true;
  static const bool _defaultUseAnimation = true;
  static const bool _defaultTapEdges = true;

  // Current values
  ScrollingType _scrollType = _defaultScrollType;
  bool _usePhysics = _defaultUsePhysics;
  double _scrollSensitivity = _defaultScrollSensitivity;
  bool _keepScreenOn = _defaultKeepScreenOn;
  bool _showIndicator = _defaultShowIndicator;
  bool _useAnimation = _defaultUseAnimation;
  bool _tapEdges = _defaultTapEdges;

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
          _scrollType = ScrollingType.fromKey(
            _prefs.getString(Preferences.scrollingType) ??
                _defaultScrollType.key,
          );
          _usePhysics = _prefs.getBool(
            Preferences.scrollingPhysics,
            defaultValue: _defaultUsePhysics,
          );
          _scrollSensitivity = _prefs.getDouble(
            Preferences.scrollingSensitivity,
            defaultValue: _defaultScrollSensitivity,
          );
          _keepScreenOn = _prefs.getBool(
            Preferences.keepScreenOn,
            defaultValue: _defaultKeepScreenOn,
          );
          _showIndicator = _prefs.getBool(
            Preferences.scrollingShowIndicator,
            defaultValue: _defaultShowIndicator,
          );
          _useAnimation = _prefs.getBool(
            Preferences.scrollingAnimation,
            defaultValue: _defaultUseAnimation,
          );
          _tapEdges = _prefs.getBool(
            Preferences.scrollingTapEdges,
            defaultValue: _defaultTapEdges,
          );
        });
      }
    });
  }

  void _resetToDefaults() {
    setState(() {
      _scrollType = _defaultScrollType;
      _usePhysics = _defaultUsePhysics;
      _scrollSensitivity = _defaultScrollSensitivity;
      _keepScreenOn = _defaultKeepScreenOn;
      _showIndicator = _defaultShowIndicator;
      _useAnimation = _defaultUseAnimation;
      _tapEdges = _defaultTapEdges;
    });
    _saveAllSettings();
  }

  void _saveAllSettings() {
    _prefs.setString(Preferences.scrollingType, _scrollType.key);
    _prefs.setBool(Preferences.scrollingPhysics, _usePhysics);
    _prefs.setDouble(Preferences.scrollingSensitivity, _scrollSensitivity);
    _prefs.setBool(Preferences.keepScreenOn, _keepScreenOn);
    _prefs.setBool(Preferences.scrollingShowIndicator, _showIndicator);
    _prefs.setBool(Preferences.scrollingAnimation, _useAnimation);
    _prefs.setBool(Preferences.scrollingTapEdges, _tapEdges);
  }

  void _updateScrollType(ScrollingType type) {
    setState(() => _scrollType = type);
    _prefs.setString(Preferences.scrollingType, type.key);
  }

  void _updateUsePhysics(bool value) {
    setState(() => _usePhysics = value);
    _prefs.setBool(Preferences.scrollingPhysics, value);
  }

  void _updateScrollSensitivity(double value) {
    setState(() => _scrollSensitivity = value);
    _prefs.setDouble(Preferences.scrollingSensitivity, value);
  }

  void _updateKeepScreenOn(bool value) {
    setState(() => _keepScreenOn = value);
    _prefs.setBool(Preferences.keepScreenOn, value);
  }

  void _updateShowIndicator(bool value) {
    setState(() => _showIndicator = value);
    _prefs.setBool(Preferences.scrollingShowIndicator, value);
  }

  void _updateUseAnimation(bool value) {
    setState(() => _useAnimation = value);
    _prefs.setBool(Preferences.scrollingAnimation, value);
  }

  void _updateTapEdges(bool value) {
    setState(() => _tapEdges = value);
    _prefs.setBool(Preferences.scrollingTapEdges, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [_buildAppBar(context)];
              },
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: context.commonPadding,
                  vertical: 16,
                ),
                children: [
                  _buildScrollTypeSection(context),
                  if (_scrollType == ScrollingType.paged) ...[
                    const SizedBox(height: 16),
                    _buildPagedOptionsSection(context),
                  ],
                  const SizedBox(height: 16),
                  _buildScrollPhysicsSection(context),
                  const SizedBox(height: 16),
                  _buildScreenOptionsSection(context),
                  const SizedBox(height: 80), // Space for bottom controls
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: Text(context.strings.settings_scrolling_title),
      actions: [
        IconButton(
          icon: const Icon(TablerIcons.rotate_2),
          onPressed: _resetToDefaults,
          tooltip: context.strings.settings_common_reset,
        ),
      ],
      pinned: true,
    );
  }

  Widget _buildScrollTypeSection(BuildContext context) {
    return OptionGroup(
      title: context.strings.settings_scrolling_type,
      children: [
        OptionTile.custom(
          title: "",
          widget: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              context.strings.settings_scrolling_type_subtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        OptionTile.radio(
          title: context.strings.settings_scrolling_continuous,
          subtitle: context.strings.settings_scrolling_continuous_subtitle,
          icon: TablerIcons.arrow_autofit_height,
          value: ScrollingType.continuous,
          groupValue: _scrollType,
          onChanged: (value) {
            if (value != null) {
              _updateScrollType(value as ScrollingType);
            }
          },
        ),
        OptionTile.radio(
          title: context.strings.settings_scrolling_paged,
          subtitle: context.strings.settings_scrolling_paged_subtitle,
          icon: TablerIcons.book,
          value: ScrollingType.paged,
          groupValue: _scrollType,
          onChanged: (value) {
            if (value != null) {
              _updateScrollType(value as ScrollingType);
            }
          },
        ),
      ],
    );
  }

  Widget _buildPagedOptionsSection(BuildContext context) {
    return OptionGroup(
      title: context.strings.settings_scrolling_paged_options,
      children: [
        OptionTile.switcher(
          title: context.strings.settings_scrolling_show_indicator,
          subtitle: context.strings.settings_scrolling_show_indicator_subtitle,
          icon: TablerIcons.circle_1,
          value: _showIndicator,
          onChanged: _updateShowIndicator,
        ),
        OptionTile.switcher(
          title: context.strings.settings_scrolling_animation,
          subtitle: context.strings.settings_scrolling_animation_subtitle,
          icon: TablerIcons.keyframes,
          value: _useAnimation,
          onChanged: _updateUseAnimation,
        ),
        OptionTile.switcher(
          title: context.strings.settings_scrolling_tap_edges,
          subtitle: context.strings.settings_scrolling_tap_edges_subtitle,
          icon: TablerIcons.hand_click,
          value: _tapEdges,
          onChanged: _updateTapEdges,
        ),
      ],
    );
  }

  Widget _buildScrollPhysicsSection(BuildContext context) {
    return OptionGroup(
      title: context.strings.settings_scrolling_physics_title,
      children: [
        OptionTile.switcher(
          title: context.strings.settings_scrolling_physics,
          subtitle: context.strings.settings_scrolling_physics_subtitle,
          icon: TablerIcons.wave_sine,
          value: _usePhysics,
          onChanged: _updateUsePhysics,
        ),
        OptionTile.slider(
          title: context.strings.settings_scrolling_sensitivity,
          icon: TablerIcons.adjustments,
          value: _scrollSensitivity,
          onChanged: _updateScrollSensitivity,
          min: 0.5,
          max: 2.0,
          divisions: 15,
        ),
      ],
    );
  }

  Widget _buildScreenOptionsSection(BuildContext context) {
    return OptionGroup(
      title: context.strings.settings_scrolling_screen_options,
      children: [
        OptionTile.switcher(
          title: context.strings.settings_scrolling_keep_screen_on,
          subtitle: context.strings.settings_scrolling_keep_screen_on_subtitle,
          icon: TablerIcons.screen_share,
          value: _keepScreenOn,
          onChanged: _updateKeepScreenOn,
        ),
      ],
    );
  }
}
