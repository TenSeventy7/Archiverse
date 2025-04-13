import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ContentWarningsSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/content_warnings';
  const ContentWarningsSettingsActivity({super.key});

  @override
  State<ContentWarningsSettingsActivity> createState() =>
      _ContentWarningsSettingsActivityState();
}

class _ContentWarningsSettingsActivityState
    extends State<ContentWarningsSettingsActivity> {
  bool _showWarningDialog = true;
  bool _blurSensitiveContent = true;
  bool _autoHideExplicitContent = false;
  bool _warnArchiveWarnings = true;
  bool _warnNoWarnings = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(context.strings.settings_warnings_title),
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
            OptionGroup(
              title: context.strings.settings_warnings_display,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_warnings_dialog,
                  subtitle: context.strings.settings_warnings_dialog_subtitle,
                  icon: TablerIcons.alert_triangle,
                  value: _showWarningDialog,
                  onChanged: (value) {
                    setState(() {
                      _showWarningDialog = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_blur,
                  subtitle: context.strings.settings_warnings_blur_subtitle,
                  icon: TablerIcons.blur,
                  value: _blurSensitiveContent,
                  onChanged: (value) {
                    setState(() {
                      _blurSensitiveContent = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_autohide,
                  subtitle: context.strings.settings_warnings_autohide_subtitle,
                  icon: TablerIcons.eye_off,
                  value: _autoHideExplicitContent,
                  onChanged: (value) {
                    setState(() {
                      _autoHideExplicitContent = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            OptionGroup(
              title: context.strings.settings_warnings_types,
              children: [
                OptionTile.custom(
                  title: "",
                  widget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      context.strings.settings_warnings_types_subtitle,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_apply,
                  subtitle: context.strings.settings_warnings_apply_subtitle,
                  icon: TablerIcons.alert_circle,
                  value: _warnArchiveWarnings,
                  onChanged: (value) {
                    setState(() {
                      _warnArchiveWarnings = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_choose_not_to,
                  subtitle:
                      context.strings.settings_warnings_choose_not_to_subtitle,
                  icon: TablerIcons.question_mark,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_no_warnings,
                  subtitle:
                      context.strings.settings_warnings_no_warnings_subtitle,
                  icon: TablerIcons.square_check,
                  value: _warnNoWarnings,
                  onChanged: (value) {
                    setState(() {
                      _warnNoWarnings = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            OptionGroup(
              title: context.strings.settings_warnings_specific,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_warnings_death,
                  icon: TablerIcons.skull,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_violence,
                  icon: TablerIcons.swords,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_noncon,
                  icon: TablerIcons.emergency_bed,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_warnings_underage,
                  icon: TablerIcons.id,
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
