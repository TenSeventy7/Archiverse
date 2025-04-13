import 'dart:math';

import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/storage_usage_indicator.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CacheManagementActivity extends CommonActivity {
  static const String routeName = '/settings/cache_management';
  const CacheManagementActivity({super.key});

  @override
  State<CacheManagementActivity> createState() =>
      _CacheManagementActivityState();
}

class _CacheManagementActivityState extends State<CacheManagementActivity> {
  // Sample storage data
  final double _deviceTotalStorage = 128 * 1024 * 1024 * 1024; // 128 GB
  final double _deviceUsedStorage = 75 * 1024 * 1024 * 1024; // 75 GB

  // Cache sizes
  double _imageCache = 250 * 1024 * 1024; // 250 MB
  double _pageCache = 420 * 1024 * 1024; // 420 MB
  double _metadataCache = 85 * 1024 * 1024; // 85 MB
  double _searchCache = 35 * 1024 * 1024; // 35 MB

  // Cache settings
  double _maxCacheSize = 1 * 1024 * 1024 * 1024; // 1 GB
  String _cacheClearInterval = 'Manual';
  bool _preserveReadCache = true;

  double get _totalCacheSize =>
      _imageCache + _pageCache + _metadataCache + _searchCache;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(context.strings.settings_cache_title),
              actions: [
                IconButton(
                  icon: const Icon(TablerIcons.trash),
                  onPressed: _showClearAllDialog,
                  tooltip: context.strings.settings_cache_clear_all,
                ),
              ],
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
            // Device storage usage indicator
            StorageUsageIndicator(
              usedSpace: _deviceUsedStorage,
              totalSpace: _deviceTotalStorage,
              label: 'Device Storage',
              icon: TablerIcons.device_mobile,
            ),

            // Cache storage usage indicator
            StorageUsageIndicator(
              usedSpace: _totalCacheSize,
              totalSpace: _maxCacheSize,
              label: 'Cache Usage',
              icon: TablerIcons.refresh,
            ),

            const SizedBox(height: 16),

            // Cache types
            OptionGroup(
              title: 'Cache Breakdown',
              children: [
                OptionTile.custom(
                  title: context.strings.settings_cache_image,
                  icon: TablerIcons.photo,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatBytes(_imageCache, 1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => _clearSpecificCache('image'),
                              icon: const Icon(TablerIcons.trash, size: 18),
                              label: Text(context.strings.dialog_clear),
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: _imageCache / _totalCacheSize,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.surface,
                        ),
                      ],
                    ),
                  ),
                ),
                OptionTile.custom(
                  title: context.strings.settings_cache_page,
                  icon: TablerIcons.book,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatBytes(_pageCache, 1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => _clearSpecificCache('page'),
                              icon: const Icon(TablerIcons.trash, size: 18),
                              label: Text(context.strings.dialog_clear),
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: _pageCache / _totalCacheSize,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.surface,
                        ),
                      ],
                    ),
                  ),
                ),
                OptionTile.custom(
                  title: context.strings.settings_cache_metadata,
                  icon: TablerIcons.file_description,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatBytes(_metadataCache, 1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => _clearSpecificCache('metadata'),
                              icon: const Icon(TablerIcons.trash, size: 18),
                              label: Text(context.strings.dialog_clear),
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: _metadataCache / _totalCacheSize,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.surface,
                        ),
                      ],
                    ),
                  ),
                ),
                OptionTile.custom(
                  title: context.strings.settings_cache_search,
                  icon: TablerIcons.search,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatBytes(_searchCache, 1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => _clearSpecificCache('search'),
                              icon: const Icon(TablerIcons.trash, size: 18),
                              label: Text(context.strings.dialog_clear),
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: _searchCache / _totalCacheSize,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.surface,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Cache settings
            OptionGroup(
              title: context.strings.settings_cache_settings,
              children: [
                OptionTile.list(
                  title: context.strings.settings_cache_max_size,
                  icon: TablerIcons.database,
                  entries: [
                    context.strings.settings_cache_size_500mb,
                    context.strings.settings_cache_size_1gb,
                    context.strings.settings_cache_size_2gb,
                    context.strings.settings_cache_size_5gb,
                    context.strings.settings_cache_size_unlimited,
                  ],
                  values: [
                    500 * 1024 * 1024,
                    1 * 1024 * 1024 * 1024,
                    2 * 1024 * 1024 * 1024,
                    5 * 1024 * 1024 * 1024,
                    -1.0, // Unlimited
                  ],
                  selectedValue: _maxCacheSize,
                  onChanged: (value) {
                    setState(() {
                      _maxCacheSize = value;
                    });
                  },
                ),
                OptionTile.list(
                  title: context.strings.settings_cache_interval,
                  icon: TablerIcons.clock,
                  entries: [
                    context.strings.settings_cache_interval_manual,
                    context.strings.settings_cache_interval_daily,
                    context.strings.settings_cache_interval_weekly,
                    context.strings.settings_cache_interval_monthly,
                  ],
                  values: ['Manual', 'Daily', 'Weekly', 'Monthly'],
                  selectedValue: _cacheClearInterval,
                  onChanged: (value) {
                    setState(() {
                      _cacheClearInterval = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_cache_preserve_read,
                  subtitle:
                      context.strings.settings_cache_preserve_read_subtitle,
                  icon: TablerIcons.bookmark_filled,
                  value: _preserveReadCache,
                  onChanged: (value) {
                    setState(() {
                      _preserveReadCache = value;
                    });
                  },
                ),
              ],
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

  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.settings_cache_clear_all),
            content: Text(context.strings.settings_cache_clear_all_message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.strings.dialog_cancel),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _imageCache = 0;
                    _pageCache = 0;
                    _metadataCache = 0;
                    _searchCache = 0;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.strings.settings_cache_cleared),
                    ),
                  );
                },
                child: Text(context.strings.dialog_clear),
              ),
            ],
          ),
    );
  }

  void _clearSpecificCache(String cacheType) {
    setState(() {
      switch (cacheType) {
        case 'image':
          _imageCache = 0;
          break;
        case 'page':
          _pageCache = 0;
          break;
        case 'metadata':
          _metadataCache = 0;
          break;
        case 'search':
          _searchCache = 0;
          break;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.strings.settings_cache_cleared_specific(
            cacheType.capitalize(),
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
