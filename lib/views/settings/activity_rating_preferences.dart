import 'package:archiverse/components/expressive/nested_scroll_view.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RatingPreferencesActivity extends CommonActivity {
  static const String routeName = '/settings/rating_preferences';
  const RatingPreferencesActivity({super.key});

  @override
  State<RatingPreferencesActivity> createState() =>
      _RatingPreferencesActivityState();
}

class _RatingPreferencesActivityState extends State<RatingPreferencesActivity> {
  // Default visibility settings
  bool _showGeneralAudiences = true;
  bool _showTeenAndUp = true;
  bool _showMature = true;
  bool _showExplicit = true;
  bool _showNotRated = true;

  // Default rating filter
  String _defaultRatingFilter = 'No Filter';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _defaultRatingFilter = context.strings.settings_rating_no_filter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      body: (controller) => ExpressiveNestedScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled, controller) {
          return <Widget>[
            ExpressiveSliverAppBar.medium(
              controller: controller,
              title: Text(context.strings.settings_rating_title),
            ),
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            context.commonPadding,
            0,
            context.commonPadding,
            16,
          ),
          children: [
            OptionGroup(
              title: context.strings.settings_rating_default_filter,
              children: [
                OptionTile.list(
                  title: context.strings.settings_rating_default_filter_label,
                  icon: TablerIcons.filter,
                  entries: [
                    context.strings.settings_rating_no_filter,
                    context.strings.settings_rating_general,
                    context.strings.settings_rating_teen,
                    context.strings.settings_rating_mature,
                    context.strings.settings_rating_explicit,
                    context.strings.settings_rating_general_teen,
                    context.strings.settings_rating_no_explicit,
                  ],
                  values: [
                    context.strings.settings_rating_no_filter,
                    context.strings.settings_rating_general,
                    context.strings.settings_rating_teen,
                    context.strings.settings_rating_mature,
                    context.strings.settings_rating_explicit,
                    context.strings.settings_rating_general_teen,
                    context.strings.settings_rating_no_explicit,
                  ],
                  selectedValue: _defaultRatingFilter,
                  onChanged: (value) {
                    setState(() {
                      _defaultRatingFilter = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            OptionGroup(
              title: context.strings.settings_rating_visibility,
              children: [
                OptionTile.custom(
                  title: "",
                  widget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      context.strings.settings_rating_visibility_subtitle,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_general,
                  icon: TablerIcons.users,
                  value: _showGeneralAudiences,
                  onChanged: (value) {
                    setState(() {
                      _showGeneralAudiences = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_teen,
                  icon: TablerIcons.school,
                  value: _showTeenAndUp,
                  onChanged: (value) {
                    setState(() {
                      _showTeenAndUp = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_mature,
                  icon: TablerIcons.plus,
                  value: _showMature,
                  onChanged: (value) {
                    setState(() {
                      _showMature = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_explicit,
                  icon: TablerIcons.explicit,
                  value: _showExplicit,
                  onChanged: (value) {
                    setState(() {
                      _showExplicit = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: "Not Rated",
                  icon: TablerIcons.question_mark,
                  value: _showNotRated,
                  onChanged: (value) {
                    setState(() {
                      _showNotRated = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            OptionGroup(
              title: context.strings.settings_rating_display,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_rating_age_confirmation,
                  subtitle:
                      context.strings.settings_rating_age_confirmation_subtitle,
                  icon: TablerIcons.id,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_blur_explicit,
                  icon: TablerIcons.photo_off,
                  value: true,
                  onChanged: (value) {},
                ),
                OptionTile.switcher(
                  title: context.strings.settings_rating_show_icons,
                  subtitle: context.strings.settings_rating_show_icons_subtitle,
                  icon: TablerIcons.badge,
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
