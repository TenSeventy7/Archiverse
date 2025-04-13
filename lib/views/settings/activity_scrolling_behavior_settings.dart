import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/settings/slider_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';

class ScrollingBehaviorSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/scrolling_behavior';
  const ScrollingBehaviorSettingsActivity({super.key});

  @override
  State<ScrollingBehaviorSettingsActivity> createState() =>
      _ScrollingBehaviorSettingsActivityState();
}

class _ScrollingBehaviorSettingsActivityState
    extends State<ScrollingBehaviorSettingsActivity> {
  String _scrollType = 'Continuous';
  bool _usePhysics = true;
  double _scrollSensitivity = 1.0;
  bool _keepScreenOn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scrollType = context.strings.settings_scrolling_continuous;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(context.strings.settings_scrolling_title),
            ),
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPadding,
            vertical: 16,
          ),
          children: [
            // Scroll type
            OptionGroup(
              title: context.strings.settings_scrolling_type,
              children: [
                OptionTile.custom(
                  title: "",
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      context.strings.settings_scrolling_type_subtitle,
                    ),
                  ),
                ),
                OptionTile.radio(
                  title: context.strings.settings_scrolling_continuous,
                  subtitle:
                      context.strings.settings_scrolling_continuous_subtitle,
                  icon: TablerIcons.arrow_autofit_height,
                  value: context.strings.settings_scrolling_continuous,
                  groupValue: _scrollType,
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _scrollType = value.toString();
                      });
                    }
                  },
                ),
                OptionTile.radio(
                  title: context.strings.settings_scrolling_paged,
                  subtitle: context.strings.settings_scrolling_paged_subtitle,
                  icon: TablerIcons.book,
                  value: context.strings.settings_scrolling_paged,
                  groupValue: _scrollType,
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _scrollType = value.toString();
                      });
                    }
                  },
                ),
              ],
            ),

            // Additional scroll options based on selected type
            if (_scrollType == context.strings.settings_scrolling_paged)
              const SizedBox(height: 16),
            if (_scrollType == context.strings.settings_scrolling_paged)
              OptionGroup(
                title: context.strings.settings_scrolling_paged_options,
                children: [
                  OptionTile.switcher(
                    title: context.strings.settings_scrolling_show_indicator,
                    subtitle:
                        context
                            .strings
                            .settings_scrolling_show_indicator_subtitle,
                    icon: TablerIcons.circle_1,
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  OptionTile.switcher(
                    title: context.strings.settings_scrolling_animation,
                    subtitle:
                        context.strings.settings_scrolling_animation_subtitle,
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  OptionTile.switcher(
                    title: context.strings.settings_scrolling_tap_edges,
                    subtitle:
                        context.strings.settings_scrolling_tap_edges_subtitle,
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ],
              ),
            const SizedBox(height: 16),

            // Scroll physics
            OptionGroup(
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_scrolling_physics,
                  subtitle: context.strings.settings_scrolling_physics_subtitle,
                  icon: TablerIcons.wave_sine,
                  value: _usePhysics,
                  onChanged: (bool value) {
                    setState(() {
                      _usePhysics = value;
                    });
                  },
                ),
                OptionTile.slider(
                  title: context.strings.settings_scrolling_sensitivity,
                  icon: TablerIcons.adjustments,
                  value: _scrollSensitivity,
                  onChanged: (double value) {
                    setState(() {
                      _scrollSensitivity = value;
                    });
                  },
                  min: 0.5,
                  max: 2.0,
                  divisions: 15,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Keep screen on
            OptionGroup(
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_scrolling_keep_screen_on,
                  subtitle:
                      context
                          .strings
                          .settings_scrolling_keep_screen_on_subtitle,
                  icon: TablerIcons.screen_share,
                  value: _keepScreenOn,
                  onChanged: (bool value) {
                    setState(() {
                      _keepScreenOn = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
