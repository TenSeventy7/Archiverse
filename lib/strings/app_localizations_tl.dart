// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class AppLocalizationsTl extends AppLocalizations {
  AppLocalizationsTl([String locale = 'tl']) : super(locale);

  @override
  String get app_name => 'Archiverse';

  @override
  String get dialog_add => 'Add';

  @override
  String get dialog_block => 'Block';

  @override
  String get dialog_cancel => 'Cancel';

  @override
  String get dialog_clear => 'Clear';

  @override
  String get dialog_delete => 'Delete';

  @override
  String get dialog_download => 'Download';

  @override
  String get dialog_follow => 'Follow';

  @override
  String get dialog_restore => 'Restore';

  @override
  String get settings_author_filters_add_author => 'Add Author';

  @override
  String get settings_author_filters_block_reason => 'Block reason (optional)';

  @override
  String get settings_author_filters_blocked_authors => 'Blocked Authors';

  @override
  String get settings_author_filters_blocking => 'Blocking Settings';

  @override
  String get settings_author_filters_followed_authors => 'Followed Authors';

  @override
  String get settings_author_filters_following => 'Following Settings';

  @override
  String get settings_author_filters_hide_search => 'Hide from Search Results';

  @override
  String get settings_author_filters_hide_works => 'Hide Works by Blocked Authors';

  @override
  String get settings_author_filters_no_blocked => 'No blocked authors yet';

  @override
  String get settings_author_filters_no_followed => 'No followed authors yet';

  @override
  String get settings_author_filters_notify_updates => 'Notify about updates';

  @override
  String get settings_author_filters_notify_works => 'Notify for New Works';

  @override
  String get settings_author_filters_notify_works_subtitle => 'Get notifications when followed authors post new works';

  @override
  String get settings_author_filters_show_indicator => 'Show Blocked Author Indicator';

  @override
  String get settings_author_filters_show_indicator_subtitle => 'Shows when content is hidden due to author blocks';

  @override
  String get settings_author_filters_sync_ao3 => 'Sync with AO3 Subscriptions';

  @override
  String get settings_author_filters_sync_ao3_subtitle => 'Import authors you subscribe to on AO3';

  @override
  String get settings_author_filters_title => 'Author Filters';

  @override
  String get settings_author_filters_unblock => 'Unblock author';

  @override
  String get settings_author_filters_unfollow => 'Unfollow author';

  @override
  String get settings_author_filters_username => 'Username';

  @override
  String get settings_backup_auto => 'Auto Backup';

  @override
  String get settings_backup_auto_subtitle => 'Create backups automatically';

  @override
  String get settings_backup_create_now => 'Create Backup Now';

  @override
  String get settings_backup_create_now_subtitle => 'Back up your data immediately';

  @override
  String settings_backup_created_at(Object date) {
    return 'Created $date';
  }

  @override
  String get settings_backup_created_success => 'Backup created successfully';

  @override
  String get settings_backup_creating => 'Creating backup...';

  @override
  String settings_backup_delete_confirm(Object date) {
    return 'Are you sure you want to delete the backup from $date?';
  }

  @override
  String get settings_backup_delete_title => 'Delete Backup';

  @override
  String get settings_backup_deleted => 'Backup deleted';

  @override
  String get settings_backup_export_file => 'Export to File';

  @override
  String get settings_backup_export_file_subtitle => 'Export settings to an external file';

  @override
  String get settings_backup_export_processing => 'Export functionality would be implemented here';

  @override
  String settings_backup_format(Object date) {
    return 'Backup $date';
  }

  @override
  String get settings_backup_frequency => 'Backup Frequency';

  @override
  String get settings_backup_frequency_daily => 'Daily';

  @override
  String get settings_backup_frequency_monthly => 'Monthly';

  @override
  String get settings_backup_frequency_weekly => 'Weekly';

  @override
  String get settings_backup_import_file => 'Import from File';

  @override
  String get settings_backup_import_file_subtitle => 'Import settings from an external file';

  @override
  String get settings_backup_import_processing => 'Import functionality would be implemented here';

  @override
  String get settings_backup_include_downloads => 'Include Downloads';

  @override
  String get settings_backup_include_downloads_subtitle => 'Include downloaded works in backups';

  @override
  String settings_backup_items_count(Object count) {
    return '$count items';
  }

  @override
  String get settings_backup_location => 'Backup Location';

  @override
  String get settings_backup_location_dropbox => 'Dropbox';

  @override
  String get settings_backup_location_gdrive => 'Google Drive';

  @override
  String get settings_backup_location_local => 'Local Storage';

  @override
  String get settings_backup_no_backups => 'No backups available';

  @override
  String get settings_backup_previous => 'Previous Backups';

  @override
  String get settings_backup_quick_actions => 'Quick Actions';

  @override
  String get settings_backup_restore => 'Restore from Backup';

  @override
  String settings_backup_restore_confirm(Object date) {
    return 'Are you sure you want to restore the backup from $date? This will overwrite your current settings.';
  }

  @override
  String get settings_backup_restore_subtitle => 'Choose a backup to restore from';

  @override
  String get settings_backup_restored_success => 'Backup restored successfully';

  @override
  String get settings_backup_restoring => 'Restoring from backup...';

  @override
  String get settings_backup_restoring_title => 'Restoring Backup';

  @override
  String get settings_backup_settings => 'Backup Settings';

  @override
  String settings_backup_size(Object size) {
    return 'Size: $size';
  }

  @override
  String get settings_backup_title => 'Backup & Restore';

  @override
  String get settings_blocked_content_add => 'Block Content by ID';

  @override
  String get settings_blocked_content_add_subtitle => 'Enter a work or collection ID';

  @override
  String get settings_blocked_content_blocked_collections => 'Blocked Collections';

  @override
  String get settings_blocked_content_blocked_works => 'Blocked Works';

  @override
  String get settings_blocked_content_collection => 'Collection';

  @override
  String settings_blocked_content_collection_format(Object id) {
    return 'Collection #$id';
  }

  @override
  String settings_blocked_content_collection_id(Object id) {
    return 'Collection ID: $id';
  }

  @override
  String get settings_blocked_content_collection_id_label => 'Collection ID';

  @override
  String get settings_blocked_content_empty => 'No blocked content yet';

  @override
  String get settings_blocked_content_empty_subtitle => 'Content you block will appear here';

  @override
  String get settings_blocked_content_enter_collection_id => 'Enter collection ID';

  @override
  String get settings_blocked_content_enter_type => 'Enter content type to block';

  @override
  String get settings_blocked_content_enter_work_id => 'Enter work ID';

  @override
  String get settings_blocked_content_hide_feeds => 'Hide Blocked Content in Feeds';

  @override
  String get settings_blocked_content_hide_search => 'Hide Blocked Content in Search';

  @override
  String get settings_blocked_content_show_indicator => 'Show Blocked Content Indicator';

  @override
  String get settings_blocked_content_show_indicator_subtitle => 'Shows when content has been hidden';

  @override
  String get settings_blocked_content_title => 'Blocked Content';

  @override
  String get settings_blocked_content_unblock_collection => 'Unblock collection';

  @override
  String get settings_blocked_content_unblock_work => 'Unblock work';

  @override
  String get settings_blocked_content_work => 'Work';

  @override
  String settings_blocked_content_work_format(Object id) {
    return 'Work #$id';
  }

  @override
  String settings_blocked_content_work_id(Object id) {
    return 'Work ID: $id';
  }

  @override
  String get settings_blocked_content_work_id_label => 'Work ID';

  @override
  String get settings_cache_clear_all => 'Clear All Cache';

  @override
  String get settings_cache_clear_all_message => 'Are you sure you want to clear all cached data? This won\'t affect your downloads.';

  @override
  String get settings_cache_cleared => 'All cache cleared';

  @override
  String settings_cache_cleared_specific(Object cacheType) {
    return '$cacheType cache cleared';
  }

  @override
  String get settings_cache_image => 'Image Cache';

  @override
  String get settings_cache_interval => 'Auto-Clear Interval';

  @override
  String get settings_cache_interval_daily => 'Daily';

  @override
  String get settings_cache_interval_manual => 'Manual Only';

  @override
  String get settings_cache_interval_monthly => 'Monthly';

  @override
  String get settings_cache_interval_weekly => 'Weekly';

  @override
  String get settings_cache_max_size => 'Maximum Cache Size';

  @override
  String get settings_cache_metadata => 'Metadata Cache';

  @override
  String get settings_cache_page => 'Page Cache';

  @override
  String get settings_cache_preserve_read => 'Preserve Recently Read Cache';

  @override
  String get settings_cache_preserve_read_subtitle => 'Keep cache for works you\'ve recently viewed';

  @override
  String get settings_cache_search => 'Search Cache';

  @override
  String get settings_cache_settings => 'Cache Settings';

  @override
  String get settings_cache_size_1gb => '1 GB';

  @override
  String get settings_cache_size_2gb => '2 GB';

  @override
  String get settings_cache_size_500mb => '500 MB';

  @override
  String get settings_cache_size_5gb => '5 GB';

  @override
  String get settings_cache_size_unlimited => 'Unlimited';

  @override
  String get settings_cache_title => 'Cache Management';

  @override
  String get settings_category_content => 'Content & Filters';

  @override
  String get settings_category_reading => 'Reading Experience';

  @override
  String get settings_category_storage => 'Storage & Data';

  @override
  String get settings_category_theme => 'Theme & Appearance';

  @override
  String get settings_common_reset => 'Reset to default';

  @override
  String get settings_downloads_auto_delete => 'Auto-Delete Old Downloads';

  @override
  String get settings_downloads_auto_delete_subtitle => 'Remove downloads older than 30 days';

  @override
  String get settings_downloads_delete_all => 'Delete all downloads';

  @override
  String get settings_downloads_delete_confirmation => 'Delete All Downloads?';

  @override
  String get settings_downloads_delete_confirmation_message => 'This will permanently remove all downloaded works. This action cannot be undone.';

  @override
  String get settings_downloads_deleted => 'All downloads deleted';

  @override
  String get settings_downloads_settings => 'Download Settings';

  @override
  String get settings_downloads_title => 'Downloads';

  @override
  String get settings_downloads_wifi_only => 'Download Over Wi-Fi Only';

  @override
  String get settings_font_body_select => 'Select a font for body text';

  @override
  String get settings_font_heading_select => 'Select a font for headings';

  @override
  String get settings_font_system_default => 'System Default';

  @override
  String get settings_font_tab_body => 'Body';

  @override
  String get settings_font_tab_headings => 'Headings';

  @override
  String get settings_font_title => 'Font Selection';

  @override
  String get settings_history_clear => 'Clear Reading History';

  @override
  String get settings_history_clear_subtitle => 'Remove all reading history data';

  @override
  String get settings_history_retention => 'History Retention';

  @override
  String get settings_history_retention_1month => '1 Month';

  @override
  String get settings_history_retention_1year => '1 Year';

  @override
  String get settings_history_retention_3months => '3 Months';

  @override
  String get settings_history_retention_6months => '6 Months';

  @override
  String get settings_history_retention_forever => 'Forever';

  @override
  String get settings_history_settings => 'History Settings';

  @override
  String get settings_history_sync_ao3 => 'Sync with AO3';

  @override
  String get settings_history_sync_ao3_subtitle => 'Sync history with your AO3 account';

  @override
  String get settings_history_sync_bookmarks => 'Sync Bookmarks';

  @override
  String get settings_history_sync_bookmarks_subtitle => 'Add works to bookmarks when marked as favorite';

  @override
  String get settings_history_title => 'Reading History';

  @override
  String get settings_history_track => 'Track Reading History';

  @override
  String get settings_history_track_subtitle => 'Keep record of works you\'ve read';

  @override
  String get settings_layout_dual_column => 'Dual Column';

  @override
  String get settings_layout_justify_text => 'Justify Text';

  @override
  String get settings_layout_line_spacing => 'Line spacing';

  @override
  String get settings_layout_paginated => 'Paginated';

  @override
  String get settings_layout_paragraph_spacing => 'Paragraph spacing';

  @override
  String settings_layout_preview_format(Object layout) {
    return '$layout Layout';
  }

  @override
  String get settings_layout_single_column => 'Single Column';

  @override
  String get settings_layout_title => 'Reading Layout';

  @override
  String get settings_layout_type => 'Layout type';

  @override
  String get settings_rating_age_confirmation => 'Require Age Confirmation for Explicit';

  @override
  String get settings_rating_age_confirmation_subtitle => 'Only applies if you\'re showing explicit content';

  @override
  String get settings_rating_blur_explicit => 'Blur Explicit Thumbnails';

  @override
  String get settings_rating_default_filter => 'Default Search Filter';

  @override
  String get settings_rating_default_filter_label => 'Default Rating Filter';

  @override
  String get settings_rating_display => 'Display Options';

  @override
  String get settings_rating_explicit => 'Explicit';

  @override
  String get settings_rating_general => 'General Audiences';

  @override
  String get settings_rating_general_teen => 'General & Teen Only';

  @override
  String get settings_rating_mature => 'Mature';

  @override
  String get settings_rating_no_explicit => 'No Explicit';

  @override
  String get settings_rating_no_filter => 'No Filter';

  @override
  String get settings_rating_show_icons => 'Show Rating Icons';

  @override
  String get settings_rating_show_icons_subtitle => 'Display visual indicators of work ratings';

  @override
  String get settings_rating_teen => 'Teen And Up';

  @override
  String get settings_rating_title => 'Rating Preferences';

  @override
  String get settings_rating_visibility => 'Rating Visibility';

  @override
  String get settings_rating_visibility_subtitle => 'Show or hide works with the following ratings';

  @override
  String get settings_scrolling_animation => 'Allow Page Turning Animation';

  @override
  String get settings_scrolling_animation_subtitle => 'Adds a page turning animation';

  @override
  String get settings_scrolling_continuous => 'Continuous';

  @override
  String get settings_scrolling_continuous_subtitle => 'Standard smooth scrolling';

  @override
  String get settings_scrolling_keep_screen_on => 'Keep Screen On';

  @override
  String get settings_scrolling_keep_screen_on_subtitle => 'Prevents the screen from turning off';

  @override
  String get settings_scrolling_paged => 'Paged';

  @override
  String get settings_scrolling_paged_options => 'Paged Scrolling Options';

  @override
  String get settings_scrolling_paged_subtitle => 'Swipe to move between pages';

  @override
  String get settings_scrolling_physics => 'Physics-based Scrolling';

  @override
  String get settings_scrolling_physics_subtitle => 'Makes scrolling feel more natural with momentum';

  @override
  String get settings_scrolling_sensitivity => 'Scroll Sensitivity';

  @override
  String get settings_scrolling_show_indicator => 'Show Page Indicator';

  @override
  String get settings_scrolling_show_indicator_subtitle => 'Displays a page indicator at the bottom';

  @override
  String get settings_scrolling_tap_edges => 'Tap Edges to Turn Page';

  @override
  String get settings_scrolling_tap_edges_subtitle => 'Tap the edges of the screen to turn pages';

  @override
  String get settings_scrolling_title => 'Scrolling Behavior';

  @override
  String get settings_scrolling_type => 'Scroll Type';

  @override
  String get settings_scrolling_type_subtitle => 'Choose your scroll type';

  @override
  String settings_tag_filters_add_tag(Object mode) {
    return 'Add ${mode}ed Tag';
  }

  @override
  String get settings_tag_filters_blacklist => 'Blacklist Mode';

  @override
  String get settings_tag_filters_blacklist_subtitle => 'Hide works with specified tags';

  @override
  String get settings_tag_filters_enter_tag => 'Enter tag name';

  @override
  String get settings_tag_filters_hide_works => 'Hide Filtered Works';

  @override
  String get settings_tag_filters_hide_works_blacklist => 'Hide works with blacklisted tags';

  @override
  String get settings_tag_filters_hide_works_whitelist => 'Hide works without whitelisted tags';

  @override
  String settings_tag_filters_no_tags(Object mode) {
    return 'No ${mode}ed tags yet';
  }

  @override
  String get settings_tag_filters_remove_tag => 'Remove tag';

  @override
  String get settings_tag_filters_settings => 'Filter Settings';

  @override
  String get settings_tag_filters_sync => 'Sync with AO3 Account';

  @override
  String get settings_tag_filters_sync_subtitle => 'Sync filters with your AO3 account';

  @override
  String get settings_tag_filters_title => 'Tag Filters';

  @override
  String get settings_tag_filters_whitelist => 'Whitelist Mode';

  @override
  String get settings_tag_filters_whitelist_subtitle => 'Only show works with specified tags';

  @override
  String get settings_text_size_adjust_label => 'Adjust the slider to change the text size throughout the app.';

  @override
  String get settings_text_size_body => 'This is the body text that you\'ll see throughout the app. It should be comfortable to read for extended periods of time.';

  @override
  String get settings_text_size_heading => 'This is a heading';

  @override
  String get settings_text_size_preview_title => 'Text Size Preview';

  @override
  String get settings_text_size_subheading => 'This is a subheading that provides more context';

  @override
  String get settings_text_size_title => 'Text Size';

  @override
  String get settings_theme_color_blue => 'Default Blue';

  @override
  String get settings_theme_color_cyan => 'Cool Cyan';

  @override
  String get settings_theme_color_green => 'Forest Green';

  @override
  String get settings_theme_color_orange => 'Warm Orange';

  @override
  String get settings_theme_color_purple => 'Vibrant Purple';

  @override
  String get settings_theme_color_red => 'Classic Red';

  @override
  String get settings_theme_color_scheme => 'Color Scheme';

  @override
  String get settings_theme_dark_mode => 'Dark Mode';

  @override
  String get settings_theme_high_contrast => 'High Contrast';

  @override
  String get settings_theme_system => 'Use System Theme';

  @override
  String get settings_theme_wallpaper_colors => 'Use Wallpaper Colors';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_warnings_apply => 'Archive Warnings Apply';

  @override
  String get settings_warnings_apply_subtitle => 'Works with creator-selected warnings';

  @override
  String get settings_warnings_autohide => 'Auto-hide Explicit Content';

  @override
  String get settings_warnings_autohide_subtitle => 'Always hide explicit content by default';

  @override
  String get settings_warnings_blur => 'Blur Sensitive Content';

  @override
  String get settings_warnings_blur_subtitle => 'Blur images and summaries until confirmed';

  @override
  String get settings_warnings_choose_not_to => 'Creator Chose Not To Warn';

  @override
  String get settings_warnings_choose_not_to_subtitle => 'Works where creator opted out of warnings';

  @override
  String get settings_warnings_death => 'Major Character Death';

  @override
  String get settings_warnings_dialog => 'Show Warning Dialog';

  @override
  String get settings_warnings_dialog_subtitle => 'Display confirmation dialog for sensitive content';

  @override
  String get settings_warnings_display => 'Warning Display';

  @override
  String get settings_warnings_no_warnings => 'No Archive Warnings';

  @override
  String get settings_warnings_no_warnings_subtitle => 'Works with no specific warnings';

  @override
  String get settings_warnings_noncon => 'Rape/Non-Con';

  @override
  String get settings_warnings_specific => 'Specific Warnings';

  @override
  String get settings_warnings_title => 'Content Warnings';

  @override
  String get settings_warnings_types => 'Archive Warning Types';

  @override
  String get settings_warnings_types_subtitle => 'Choose which types of Archive Warnings should trigger confirmation dialogs';

  @override
  String get settings_warnings_underage => 'Underage';

  @override
  String get settings_warnings_violence => 'Graphic Violence';
}
