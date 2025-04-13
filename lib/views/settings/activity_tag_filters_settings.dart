import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TagFiltersSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/tag_filters';
  const TagFiltersSettingsActivity({super.key});

  @override
  State<TagFiltersSettingsActivity> createState() =>
      _TagFiltersSettingsActivityState();
}

class _TagFiltersSettingsActivityState
    extends State<TagFiltersSettingsActivity> {
  String _filterMode = 'Blacklist';
  bool _hideFilteredWorks = true;
  bool _syncWithAccount = false;

  // Sample tags for demonstration
  final List<String> _filteredTags = [
    'Coffee Shop AU',
    'High School AU',
    'A/B/O Dynamics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(context.strings.settings_tag_filters_title),
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
              title: context.strings.settings_tag_filters_settings,
              children: [
                OptionTile.radio(
                  title: context.strings.settings_tag_filters_blacklist,
                  subtitle:
                      context.strings.settings_tag_filters_blacklist_subtitle,
                  icon: TablerIcons.ban,
                  value: 'Blacklist',
                  groupValue: _filterMode,
                  onChanged: (value) {
                    setState(() {
                      _filterMode = value.toString();
                    });
                  },
                ),
                OptionTile.radio(
                  title: context.strings.settings_tag_filters_whitelist,
                  subtitle:
                      context.strings.settings_tag_filters_whitelist_subtitle,
                  icon: TablerIcons.check,
                  value: 'Whitelist',
                  groupValue: _filterMode,
                  onChanged: (value) {
                    setState(() {
                      _filterMode = value.toString();
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_tag_filters_hide_works,
                  subtitle:
                      _filterMode == 'Blacklist'
                          ? context
                              .strings
                              .settings_tag_filters_hide_works_blacklist
                          : context
                              .strings
                              .settings_tag_filters_hide_works_whitelist,
                  icon: TablerIcons.eye_off,
                  value: _hideFilteredWorks,
                  onChanged: (value) {
                    setState(() {
                      _hideFilteredWorks = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_tag_filters_sync,
                  subtitle: context.strings.settings_tag_filters_sync_subtitle,
                  icon: TablerIcons.cloud_download,
                  value: _syncWithAccount,
                  onChanged: (value) {
                    setState(() {
                      _syncWithAccount = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            OptionGroup(
              title:
                  _filterMode == 'Blacklist'
                      ? context.strings.settings_tag_filters_blacklist
                      : context.strings.settings_tag_filters_whitelist,
              children:
                  _filteredTags.isEmpty
                      ? [
                        OptionTile.custom(
                          title: "",
                          widget: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                context.strings.settings_tag_filters_no_tags(
                                  _filterMode.toLowerCase(),
                                ),
                                style: TextStyle(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                      : _filteredTags
                          .map(
                            (tag) => OptionTile(
                              title: tag,
                              icon: TablerIcons.tag,
                              trailing: IconButton(
                                icon: const Icon(TablerIcons.trash),
                                onPressed: () {
                                  setState(() {
                                    _filteredTags.remove(tag);
                                  });
                                },
                                tooltip:
                                    context
                                        .strings
                                        .settings_tag_filters_remove_tag,
                              ),
                            ),
                          )
                          .toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTagDialog(context),
        child: const Icon(TablerIcons.plus),
      ),
    );
  }

  void _showAddTagDialog(BuildContext context) {
    final TextEditingController tagController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            context.strings.settings_tag_filters_add_tag(
              _filterMode.toLowerCase(),
            ),
          ),
          content: TextField(
            controller: tagController,
            decoration: InputDecoration(
              hintText: context.strings.settings_tag_filters_enter_tag,
              prefixIcon: const Icon(TablerIcons.tag),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.strings.dialog_cancel),
            ),
            TextButton(
              onPressed: () {
                if (tagController.text.isNotEmpty) {
                  setState(() {
                    _filteredTags.add(tagController.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: Text(context.strings.dialog_add),
            ),
          ],
        );
      },
    );
  }
}
