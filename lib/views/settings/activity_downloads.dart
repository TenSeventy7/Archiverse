import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/storage_usage_indicator.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class DownloadsSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/downloads';
  const DownloadsSettingsActivity({super.key});

  @override
  State<DownloadsSettingsActivity> createState() =>
      _DownloadsSettingsActivityState();
}

class _DownloadsSettingsActivityState extends State<DownloadsSettingsActivity> {
  // Sample data for demonstration
  final double _deviceTotalStorage = 128 * 1024 * 1024 * 1024; // 128 GB
  final double _deviceUsedStorage = 95 * 1024 * 1024 * 1024; // 95 GB
  final double _archiverseStorage = 2.5 * 1024 * 1024 * 1024; // 2.5 GB

  // Settings
  bool _downloadOverWifiOnly = true;
  bool _autoDeleteOldDownloads = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(context.strings.settings_downloads_title),
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
            // Storage indicators
            StorageUsageIndicator(
              usedSpace: _deviceUsedStorage,
              totalSpace: _deviceTotalStorage,
              label: 'Device Storage',
              icon: TablerIcons.device_mobile,
            ),

            StorageUsageIndicator(
              usedSpace: _archiverseStorage,
              totalSpace: _deviceTotalStorage,
              label: 'Archiverse Storage',
              icon: TablerIcons.book,
            ),

            const SizedBox(height: 16),

            // Download settings
            OptionGroup(
              title: context.strings.settings_downloads_settings,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_downloads_wifi_only,
                  icon: TablerIcons.wifi,
                  value: _downloadOverWifiOnly,
                  onChanged: (value) {
                    setState(() {
                      _downloadOverWifiOnly = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_downloads_auto_delete,
                  subtitle:
                      context.strings.settings_downloads_auto_delete_subtitle,
                  icon: TablerIcons.clock,
                  value: _autoDeleteOldDownloads,
                  onChanged: (value) {
                    setState(() {
                      _autoDeleteOldDownloads = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            OptionGroup(
              children: [
                OptionTile(
                  title: context.strings.settings_downloads_delete_all,
                  icon: TablerIcons.trash,
                  onTap: _showDeleteAllDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAllDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.strings.settings_downloads_delete_confirmation),
          content: Text(
            context.strings.settings_downloads_delete_confirmation_message,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.strings.dialog_cancel),
            ),
            TextButton(
              onPressed: () {
                // Actually delete all downloads
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.strings.settings_downloads_deleted),
                  ),
                );
              },
              child: Text(context.strings.dialog_delete),
            ),
          ],
        );
      },
    );
  }
}
