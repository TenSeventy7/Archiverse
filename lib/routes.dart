/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/views/activity_about.dart';
import 'package:archiverse/views/activity_search.dart';
import 'package:archiverse/views/activity_settings.dart';
import 'package:archiverse/views/settings/activity_author_filters_settings.dart';
import 'package:archiverse/views/settings/activity_backup_settings.dart';
import 'package:archiverse/views/settings/activity_blocked_content_settings.dart';
import 'package:archiverse/views/settings/activity_cache_management.dart';
import 'package:archiverse/views/settings/activity_content_warnings_settings.dart';
import 'package:archiverse/views/settings/activity_downloads.dart';
import 'package:archiverse/views/settings/activity_font_selection.dart';
import 'package:archiverse/views/settings/activity_rating_preferences.dart';
import 'package:archiverse/views/settings/activity_reading_history_settings.dart';
import 'package:archiverse/views/settings/activity_reading_layout_settings.dart';
import 'package:archiverse/views/settings/activity_scrolling_behavior_settings.dart';
import 'package:archiverse/views/settings/activity_tag_filters_settings.dart';
import 'package:archiverse/views/settings/activity_text_size_settings.dart';
import 'package:flutter/material.dart';

import 'package:archiverse/views/activity_home.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeActivity.routeName: (context) => const HomeActivity(),
    SearchActivity.routeName: (context) => const SearchActivity(),
    AboutActivity.routeName: (context) => const AboutActivity(),
    SettingsActivity.routeName: (context) => const SettingsActivity(),
    TextSizeSettingsActivity.routeName:
        (context) => const TextSizeSettingsActivity(),
    FontSelectionSettingsActivity.routeName:
        (context) => const FontSelectionSettingsActivity(),
    ReadingLayoutSettingsActivity.routeName:
        (context) => const ReadingLayoutSettingsActivity(),
    ScrollingBehaviorSettingsActivity.routeName:
        (context) => const ScrollingBehaviorSettingsActivity(),
    ContentWarningsSettingsActivity.routeName:
        (context) => const ContentWarningsSettingsActivity(),
    RatingPreferencesActivity.routeName:
        (context) => const RatingPreferencesActivity(),
    TagFiltersSettingsActivity.routeName:
        (context) => const TagFiltersSettingsActivity(),
    BlockedContentActivity.routeName:
        (context) => const BlockedContentActivity(),
    AuthorFiltersSettingsActivity.routeName:
        (context) => const AuthorFiltersSettingsActivity(),
    DownloadsSettingsActivity.routeName:
        (context) => const DownloadsSettingsActivity(),
    CacheManagementActivity.routeName:
        (context) => const CacheManagementActivity(),
    ReadingHistorySettingsActivity.routeName:
        (context) => const ReadingHistorySettingsActivity(),
    BackupRestoreActivity.routeName: (context) => const BackupRestoreActivity(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String? name = settings.name;
    if (name == null) return null;

    switch (name) {
      default:
        return null;
    }
  }
}
