import 'dart:math';

import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BackupRestoreActivity extends CommonActivity {
  static const String routeName = '/settings/backup_restore';
  const BackupRestoreActivity({super.key});

  @override
  State<BackupRestoreActivity> createState() => _BackupRestoreActivityState();
}

class _BackupRestoreActivityState extends State<BackupRestoreActivity> {
  // Backup settings
  bool _autoBackup = true;
  String _backupLocation = '';
  String _backupFrequency = '';
  bool _includeDownloads = false;

  // Sample backups
  final List<Map<String, dynamic>> _backups = [
    {
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'size': 4.7 * 1024 * 1024, // 4.7 MB
      'items': 156,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 9)),
      'size': 4.2 * 1024 * 1024, // 4.2 MB
      'items': 142,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 16)),
      'size': 3.8 * 1024 * 1024, // 3.8 MB
      'items': 128,
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize values after context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _backupLocation = context.strings.settings_backup_location_local;
        _backupFrequency = context.strings.settings_backup_frequency_weekly;
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
              title: Text(context.strings.settings_backup_title),
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
            // Quick actions
            OptionGroup(
              title: context.strings.settings_backup_quick_actions,
              children: [
                OptionTile(
                  title: context.strings.settings_backup_create_now,
                  subtitle: context.strings.settings_backup_create_now_subtitle,
                  icon: TablerIcons.device_floppy,
                  onTap: _createBackup,
                ),
                OptionTile(
                  title: context.strings.settings_backup_restore,
                  subtitle: context.strings.settings_backup_restore_subtitle,
                  icon: TablerIcons.refresh,
                  onTap: _showRestoreDialog,
                ),
                OptionTile(
                  title: context.strings.settings_backup_import_file,
                  subtitle:
                      context.strings.settings_backup_import_file_subtitle,
                  icon: TablerIcons.file_import,
                  onTap: _importFromFile,
                ),
                OptionTile(
                  title: context.strings.settings_backup_export_file,
                  subtitle:
                      context.strings.settings_backup_export_file_subtitle,
                  icon: TablerIcons.file_export,
                  onTap: _exportToFile,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Backup settings
            OptionGroup(
              title: context.strings.settings_backup_settings,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_backup_auto,
                  subtitle: context.strings.settings_backup_auto_subtitle,
                  icon: TablerIcons.clock,
                  value: _autoBackup,
                  onChanged: (value) {
                    setState(() {
                      _autoBackup = value;
                    });
                  },
                ),
                OptionTile.list(
                  title: context.strings.settings_backup_frequency,
                  icon: TablerIcons.calendar,
                  entries: [
                    context.strings.settings_backup_frequency_daily,
                    context.strings.settings_backup_frequency_weekly,
                    context.strings.settings_backup_frequency_monthly,
                  ],
                  values: [
                    context.strings.settings_backup_frequency_daily,
                    context.strings.settings_backup_frequency_weekly,
                    context.strings.settings_backup_frequency_monthly,
                  ],
                  selectedValue: _backupFrequency,
                  onChanged: (value) {
                    setState(() {
                      _backupFrequency = value;
                    });
                  },
                  enabled: _autoBackup,
                ),
                OptionTile.list(
                  title: context.strings.settings_backup_location,
                  icon: TablerIcons.folder,
                  entries: [
                    context.strings.settings_backup_location_local,
                    context.strings.settings_backup_location_gdrive,
                    context.strings.settings_backup_location_dropbox,
                  ],
                  values: [
                    context.strings.settings_backup_location_local,
                    context.strings.settings_backup_location_gdrive,
                    context.strings.settings_backup_location_dropbox,
                  ],
                  selectedValue: _backupLocation,
                  onChanged: (value) {
                    setState(() {
                      _backupLocation = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_backup_include_downloads,
                  subtitle:
                      context
                          .strings
                          .settings_backup_include_downloads_subtitle,
                  icon: TablerIcons.download,
                  value: _includeDownloads,
                  onChanged: (value) {
                    setState(() {
                      _includeDownloads = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Previous backups
            OptionGroup(
              title: context.strings.settings_backup_previous,
              children:
                  _backups.isEmpty
                      ? [
                        OptionTile.custom(
                          title: "",
                          widget: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                children: [
                                  Icon(
                                    TablerIcons.database_off,
                                    size: 48,
                                    color: context.colorScheme.onSurfaceVariant
                                        .withOpacity(0.5),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    context.strings.settings_backup_no_backups,
                                    style: TextStyle(
                                      color:
                                          context.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                      : _backups.map((backup) {
                        final date = backup['date'] as DateTime;
                        final formattedDate =
                            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                        final formattedTime =
                            "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

                        return OptionTile(
                          title: context.strings.settings_backup_format(
                            formattedDate,
                          ),
                          subtitle:
                              '$formattedTime • ${_formatBytes(backup['size'], 1)} • ${backup['items']} items',
                          icon: TablerIcons.database,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(TablerIcons.refresh),
                                onPressed: () => _confirmRestore(backup),
                                tooltip: context.strings.dialog_restore,
                              ),
                              IconButton(
                                icon: const Icon(TablerIcons.trash),
                                onPressed: () => _confirmDeleteBackup(backup),
                                tooltip: context.strings.dialog_delete,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  String _formatBytes(double bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  void _createBackup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.settings_backup_create_now),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 24),
                Text(context.strings.settings_backup_creating),
              ],
            ),
          ),
    );

    // Simulate backup creation
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);

      setState(() {
        _backups.insert(0, {
          'date': DateTime.now(),
          'size': 5.1 * 1024 * 1024, // 5.1 MB
          'items': 168,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Backup created successfully'),
        ), // Should be translated
      );
    });
  }

  void _showRestoreDialog() {
    if (_backups.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.strings.settings_backup_no_backups)),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder:
          (context) => ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(context.strings.settings_backup_restore),
                leading: const Icon(TablerIcons.refresh),
              ),
              const Divider(),
              ..._backups.map((backup) {
                final date = backup['date'] as DateTime;
                final formattedDate =
                    "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                final formattedTime =
                    "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

                return ListTile(
                  title: Text(
                    context.strings.settings_backup_format(formattedDate),
                  ),
                  subtitle: Text(
                    '$formattedTime • ${_formatBytes(backup['size'], 1)} • ${context.strings.settings_backup_items_count(backup['items'].toString())}',
                  ),
                  leading: const Icon(TablerIcons.database),
                  onTap: () {
                    Navigator.pop(context);
                    _confirmRestore(backup);
                  },
                );
              }).toList(),
            ],
          ),
    );
  }

  void _confirmRestore(Map<String, dynamic> backup) {
    final date = backup['date'] as DateTime;
    final formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.settings_backup_restore),
            content: Text(
              context.strings.settings_backup_restore_confirm(formattedDate),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.strings.dialog_cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:
                        (context) => AlertDialog(
                          title: Text(
                            context.strings.settings_backup_restoring_title,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 24),
                              Text(context.strings.settings_backup_restoring),
                            ],
                          ),
                        ),
                  );

                  // Simulate restore process
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.strings.settings_backup_restored_success,
                        ),
                      ),
                    );
                  });
                },
                child: Text(context.strings.dialog_restore),
              ),
            ],
          ),
    );
  }

  void _confirmDeleteBackup(Map<String, dynamic> backup) {
    final date = backup['date'] as DateTime;
    final formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.settings_backup_delete_title),
            content: Text(
              context.strings.settings_backup_delete_confirm(formattedDate),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.strings.dialog_cancel),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _backups.remove(backup);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.strings.settings_backup_deleted),
                    ),
                  );
                },
                child: Text(context.strings.dialog_delete),
              ),
            ],
          ),
    );
  }

  void _importFromFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.strings.settings_backup_import_processing),
      ),
    );
  }

  void _exportToFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.strings.settings_backup_export_processing),
      ),
    );
  }
}
