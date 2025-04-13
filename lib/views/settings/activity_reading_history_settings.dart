import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ReadingHistorySettingsActivity extends CommonActivity {
  static const String routeName = '/settings/reading_history';
  const ReadingHistorySettingsActivity({super.key});

  @override
  State<ReadingHistorySettingsActivity> createState() =>
      _ReadingHistorySettingsActivityState();
}

class _ReadingHistorySettingsActivityState
    extends State<ReadingHistorySettingsActivity> {
  // Settings
  bool _trackReadingHistory = true;
  String _historyRetention = '3 Months';
  bool _syncWithAO3 = false;
  bool _syncBookmarks = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _historyRetention = context.strings.settings_history_retention_3months;
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
              title: Text(context.strings.settings_history_title),
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
            // History settings
            OptionGroup(
              title: context.strings.settings_history_settings,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_history_track,
                  subtitle: context.strings.settings_history_track_subtitle,
                  icon: TablerIcons.history,
                  value: _trackReadingHistory,
                  onChanged: (value) {
                    setState(() {
                      _trackReadingHistory = value;
                    });
                  },
                ),
                OptionTile.list(
                  title: context.strings.settings_history_retention,
                  icon: TablerIcons.clock,
                  entries: [
                    context.strings.settings_history_retention_1month,
                    context.strings.settings_history_retention_3months,
                    context.strings.settings_history_retention_6months,
                    context.strings.settings_history_retention_1year,
                    context.strings.settings_history_retention_forever,
                  ],
                  values: [
                    context.strings.settings_history_retention_1month,
                    context.strings.settings_history_retention_3months,
                    context.strings.settings_history_retention_6months,
                    context.strings.settings_history_retention_1year,
                    context.strings.settings_history_retention_forever,
                  ],
                  selectedValue: _historyRetention,
                  onChanged: (value) {
                    setState(() {
                      _historyRetention = value;
                    });
                  },
                  enabled: _trackReadingHistory,
                ),
              ],
            ),

            const SizedBox(height: 16),

            OptionGroup(
              title: context.strings.settings_history_sync_ao3,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_history_sync_ao3,
                  subtitle: context.strings.settings_history_sync_ao3_subtitle,
                  icon: TablerIcons.cloud_upload,
                  value: _syncWithAO3,
                  onChanged: (value) {
                    setState(() {
                      _syncWithAO3 = value;
                    });
                  },
                  enabled: _trackReadingHistory,
                ),
                OptionTile.switcher(
                  title: context.strings.settings_history_sync_bookmarks,
                  subtitle:
                      context.strings.settings_history_sync_bookmarks_subtitle,
                  icon: TablerIcons.bookmark,
                  value: _syncBookmarks,
                  onChanged: (value) {
                    setState(() {
                      _syncBookmarks = value;
                    });
                  },
                  enabled: _trackReadingHistory && _syncWithAO3,
                ),
              ],
            ),

            const SizedBox(height: 16),

            OptionGroup(
              children: [
                OptionTile(
                  title: context.strings.settings_history_clear,
                  subtitle: context.strings.settings_history_clear_subtitle,
                  icon: TablerIcons.trash,
                  onTap:
                      _trackReadingHistory
                          ? () => _showClearHistoryDialog()
                          : null,
                  enabled: _trackReadingHistory,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showClearHistoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.strings.settings_history_clear),
          content: Text(context.strings.settings_history_clear_subtitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.strings.dialog_cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Reading history cleared")),
                );
              },
              child: Text(context.strings.dialog_clear),
            ),
          ],
        );
      },
    );
  }
}
