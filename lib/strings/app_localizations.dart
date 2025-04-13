import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'strings/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tl')
  ];

  /// No description provided for @about_app_name.
  ///
  /// In en, this message translates to:
  /// **'About Archiverse'**
  String get about_app_name;

  /// No description provided for @about_contributors_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all contributors'**
  String get about_contributors_see_all;

  /// No description provided for @about_discord_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Discuss on Discord'**
  String get about_discord_subtitle;

  /// No description provided for @about_discord_title.
  ///
  /// In en, this message translates to:
  /// **'Join the Community'**
  String get about_discord_title;

  /// No description provided for @about_footer_flutter.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ using Flutter'**
  String get about_footer_flutter;

  /// No description provided for @about_github_subtitle.
  ///
  /// In en, this message translates to:
  /// **'See the source code on GitHub'**
  String get about_github_subtitle;

  /// No description provided for @about_github_title.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get about_github_title;

  /// No description provided for @about_header_contributors.
  ///
  /// In en, this message translates to:
  /// **'Contributors'**
  String get about_header_contributors;

  /// No description provided for @about_header_contributors_localization.
  ///
  /// In en, this message translates to:
  /// **'Localization Contributors'**
  String get about_header_contributors_localization;

  /// No description provided for @about_header_core_team.
  ///
  /// In en, this message translates to:
  /// **'Core Team'**
  String get about_header_core_team;

  /// No description provided for @about_header_special_thanks.
  ///
  /// In en, this message translates to:
  /// **'Special Thanks'**
  String get about_header_special_thanks;

  /// No description provided for @about_report_bug_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Report a bug or issue on GitHub'**
  String get about_report_bug_subtitle;

  /// No description provided for @about_report_bug_title.
  ///
  /// In en, this message translates to:
  /// **'Report a Bug'**
  String get about_report_bug_title;

  /// No description provided for @about_update_card_btn_update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get about_update_card_btn_update;

  /// No description provided for @about_update_card_title.
  ///
  /// In en, this message translates to:
  /// **'An update is available!'**
  String get about_update_card_title;

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Archiverse'**
  String get app_name;

  /// No description provided for @dialog_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get dialog_add;

  /// No description provided for @dialog_block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get dialog_block;

  /// No description provided for @dialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get dialog_cancel;

  /// No description provided for @dialog_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get dialog_clear;

  /// No description provided for @dialog_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get dialog_delete;

  /// No description provided for @dialog_download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get dialog_download;

  /// No description provided for @dialog_follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get dialog_follow;

  /// No description provided for @dialog_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get dialog_restore;

  /// No description provided for @fandom_anime_manga.
  ///
  /// In en, this message translates to:
  /// **'Anime & Manga'**
  String get fandom_anime_manga;

  /// No description provided for @fandom_books_literature.
  ///
  /// In en, this message translates to:
  /// **'Books & Literature'**
  String get fandom_books_literature;

  /// No description provided for @fandom_cartoons_comics_graphic_novels.
  ///
  /// In en, this message translates to:
  /// **'Cartoons & Comics & Graphic Novels'**
  String get fandom_cartoons_comics_graphic_novels;

  /// No description provided for @fandom_celebrities_real_people.
  ///
  /// In en, this message translates to:
  /// **'Celebrities & Real People'**
  String get fandom_celebrities_real_people;

  /// No description provided for @fandom_movies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get fandom_movies;

  /// No description provided for @fandom_music_bands.
  ///
  /// In en, this message translates to:
  /// **'Music & Bands'**
  String get fandom_music_bands;

  /// No description provided for @fandom_other_media.
  ///
  /// In en, this message translates to:
  /// **'Other Media'**
  String get fandom_other_media;

  /// No description provided for @fandom_theater.
  ///
  /// In en, this message translates to:
  /// **'Theater'**
  String get fandom_theater;

  /// No description provided for @fandom_tv_shows.
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get fandom_tv_shows;

  /// No description provided for @fandom_uncategorized.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized Fandoms'**
  String get fandom_uncategorized;

  /// No description provided for @fandom_video_games.
  ///
  /// In en, this message translates to:
  /// **'Video Games'**
  String get fandom_video_games;

  /// No description provided for @onboarding_1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Millions of stories await. From scorching romances to epic space battles, find your next obsession with our powerful search. Customize your feed, unlock hidden gems, and prepare to be amazed!'**
  String get onboarding_1_subtitle;

  /// No description provided for @onboarding_1_title.
  ///
  /// In en, this message translates to:
  /// **'Discover Amazing Works'**
  String get onboarding_1_title;

  /// No description provided for @onboarding_2_subtitle.
  ///
  /// In en, this message translates to:
  /// **'No Wi-Fi? No worries! Download your favorites and conquer boredom on the go. Train, plane, or cozy reading nook - your library is always a tap away.'**
  String get onboarding_2_subtitle;

  /// No description provided for @onboarding_2_title.
  ///
  /// In en, this message translates to:
  /// **'Read Anytime, Anywhere'**
  String get onboarding_2_title;

  /// No description provided for @onboarding_3_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Share your love, leave comments, and join the lively discussions. Make friends, find kindred spirits, and let your voice be heard. Remember, you\'re not just reading, you\'re part of something bigger!'**
  String get onboarding_3_subtitle;

  /// No description provided for @onboarding_3_title.
  ///
  /// In en, this message translates to:
  /// **'Connect with the Community'**
  String get onboarding_3_title;

  /// No description provided for @onboarding_4_cta.
  ///
  /// In en, this message translates to:
  /// **'Dive into the Archiverse'**
  String get onboarding_4_cta;

  /// No description provided for @onboarding_4_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re holding the key to endless worlds. Open Archiverse, unlock your next adventure, and let the stories begin!'**
  String get onboarding_4_subtitle;

  /// No description provided for @onboarding_4_title.
  ///
  /// In en, this message translates to:
  /// **'Start Your Journey'**
  String get onboarding_4_title;

  /// No description provided for @onboarding_intro.
  ///
  /// In en, this message translates to:
  /// **'Explore a galaxy of stories. Dive deep into endless imagination and join the passionate fandom. Archiverse: Your ultimate AO3 reader.'**
  String get onboarding_intro;

  /// No description provided for @onboarding_intro_cta.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get onboarding_intro_cta;

  /// No description provided for @onboarding_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next;

  /// No description provided for @onboarding_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip;

  /// No description provided for @placeholder.
  ///
  /// In en, this message translates to:
  /// **'Placeholder'**
  String get placeholder;

  /// No description provided for @series_info_complete.
  ///
  /// In en, this message translates to:
  /// **'This series has been completed'**
  String get series_info_complete;

  /// No description provided for @settings_author_filters_add_author.
  ///
  /// In en, this message translates to:
  /// **'Add Author'**
  String get settings_author_filters_add_author;

  /// No description provided for @settings_author_filters_block_reason.
  ///
  /// In en, this message translates to:
  /// **'Block reason (optional)'**
  String get settings_author_filters_block_reason;

  /// No description provided for @settings_author_filters_blocked_authors.
  ///
  /// In en, this message translates to:
  /// **'Blocked Authors'**
  String get settings_author_filters_blocked_authors;

  /// No description provided for @settings_author_filters_blocking.
  ///
  /// In en, this message translates to:
  /// **'Blocking Settings'**
  String get settings_author_filters_blocking;

  /// No description provided for @settings_author_filters_followed_authors.
  ///
  /// In en, this message translates to:
  /// **'Followed Authors'**
  String get settings_author_filters_followed_authors;

  /// No description provided for @settings_author_filters_following.
  ///
  /// In en, this message translates to:
  /// **'Following Settings'**
  String get settings_author_filters_following;

  /// No description provided for @settings_author_filters_hide_search.
  ///
  /// In en, this message translates to:
  /// **'Hide from Search Results'**
  String get settings_author_filters_hide_search;

  /// No description provided for @settings_author_filters_hide_works.
  ///
  /// In en, this message translates to:
  /// **'Hide Works by Blocked Authors'**
  String get settings_author_filters_hide_works;

  /// No description provided for @settings_author_filters_no_blocked.
  ///
  /// In en, this message translates to:
  /// **'No blocked authors yet'**
  String get settings_author_filters_no_blocked;

  /// No description provided for @settings_author_filters_no_followed.
  ///
  /// In en, this message translates to:
  /// **'No followed authors yet'**
  String get settings_author_filters_no_followed;

  /// No description provided for @settings_author_filters_notify_updates.
  ///
  /// In en, this message translates to:
  /// **'Notify about updates'**
  String get settings_author_filters_notify_updates;

  /// No description provided for @settings_author_filters_notify_works.
  ///
  /// In en, this message translates to:
  /// **'Notify for New Works'**
  String get settings_author_filters_notify_works;

  /// No description provided for @settings_author_filters_notify_works_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notifications when followed authors post new works'**
  String get settings_author_filters_notify_works_subtitle;

  /// No description provided for @settings_author_filters_show_indicator.
  ///
  /// In en, this message translates to:
  /// **'Show Blocked Author Indicator'**
  String get settings_author_filters_show_indicator;

  /// No description provided for @settings_author_filters_show_indicator_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows when content is hidden due to author blocks'**
  String get settings_author_filters_show_indicator_subtitle;

  /// No description provided for @settings_author_filters_sync_ao3.
  ///
  /// In en, this message translates to:
  /// **'Sync with AO3 Subscriptions'**
  String get settings_author_filters_sync_ao3;

  /// No description provided for @settings_author_filters_sync_ao3_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Import authors you subscribe to on AO3'**
  String get settings_author_filters_sync_ao3_subtitle;

  /// No description provided for @settings_author_filters_title.
  ///
  /// In en, this message translates to:
  /// **'Author Filters'**
  String get settings_author_filters_title;

  /// No description provided for @settings_author_filters_unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock author'**
  String get settings_author_filters_unblock;

  /// No description provided for @settings_author_filters_unfollow.
  ///
  /// In en, this message translates to:
  /// **'Unfollow author'**
  String get settings_author_filters_unfollow;

  /// No description provided for @settings_author_filters_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get settings_author_filters_username;

  /// No description provided for @settings_backup_auto.
  ///
  /// In en, this message translates to:
  /// **'Auto Backup'**
  String get settings_backup_auto;

  /// No description provided for @settings_backup_auto_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create backups automatically'**
  String get settings_backup_auto_subtitle;

  /// No description provided for @settings_backup_create_now.
  ///
  /// In en, this message translates to:
  /// **'Create Backup Now'**
  String get settings_backup_create_now;

  /// No description provided for @settings_backup_create_now_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Back up your data immediately'**
  String get settings_backup_create_now_subtitle;

  /// No description provided for @settings_backup_created_at.
  ///
  /// In en, this message translates to:
  /// **'Created {date}'**
  String settings_backup_created_at(Object date);

  /// No description provided for @settings_backup_created_success.
  ///
  /// In en, this message translates to:
  /// **'Backup created successfully'**
  String get settings_backup_created_success;

  /// No description provided for @settings_backup_creating.
  ///
  /// In en, this message translates to:
  /// **'Creating backup...'**
  String get settings_backup_creating;

  /// No description provided for @settings_backup_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the backup from {date}?'**
  String settings_backup_delete_confirm(Object date);

  /// No description provided for @settings_backup_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Backup'**
  String get settings_backup_delete_title;

  /// No description provided for @settings_backup_deleted.
  ///
  /// In en, this message translates to:
  /// **'Backup deleted'**
  String get settings_backup_deleted;

  /// No description provided for @settings_backup_export_file.
  ///
  /// In en, this message translates to:
  /// **'Export to File'**
  String get settings_backup_export_file;

  /// No description provided for @settings_backup_export_file_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Export settings to an external file'**
  String get settings_backup_export_file_subtitle;

  /// No description provided for @settings_backup_export_processing.
  ///
  /// In en, this message translates to:
  /// **'Export functionality would be implemented here'**
  String get settings_backup_export_processing;

  /// No description provided for @settings_backup_format.
  ///
  /// In en, this message translates to:
  /// **'Backup {date}'**
  String settings_backup_format(Object date);

  /// No description provided for @settings_backup_frequency.
  ///
  /// In en, this message translates to:
  /// **'Backup Frequency'**
  String get settings_backup_frequency;

  /// No description provided for @settings_backup_frequency_daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get settings_backup_frequency_daily;

  /// No description provided for @settings_backup_frequency_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get settings_backup_frequency_monthly;

  /// No description provided for @settings_backup_frequency_weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get settings_backup_frequency_weekly;

  /// No description provided for @settings_backup_import_file.
  ///
  /// In en, this message translates to:
  /// **'Import from File'**
  String get settings_backup_import_file;

  /// No description provided for @settings_backup_import_file_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Import settings from an external file'**
  String get settings_backup_import_file_subtitle;

  /// No description provided for @settings_backup_import_processing.
  ///
  /// In en, this message translates to:
  /// **'Import functionality would be implemented here'**
  String get settings_backup_import_processing;

  /// No description provided for @settings_backup_include_downloads.
  ///
  /// In en, this message translates to:
  /// **'Include Downloads'**
  String get settings_backup_include_downloads;

  /// No description provided for @settings_backup_include_downloads_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Include downloaded works in backups'**
  String get settings_backup_include_downloads_subtitle;

  /// No description provided for @settings_backup_items_count.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String settings_backup_items_count(Object count);

  /// No description provided for @settings_backup_location.
  ///
  /// In en, this message translates to:
  /// **'Backup Location'**
  String get settings_backup_location;

  /// No description provided for @settings_backup_location_dropbox.
  ///
  /// In en, this message translates to:
  /// **'Dropbox'**
  String get settings_backup_location_dropbox;

  /// No description provided for @settings_backup_location_gdrive.
  ///
  /// In en, this message translates to:
  /// **'Google Drive'**
  String get settings_backup_location_gdrive;

  /// No description provided for @settings_backup_location_local.
  ///
  /// In en, this message translates to:
  /// **'Local Storage'**
  String get settings_backup_location_local;

  /// No description provided for @settings_backup_no_backups.
  ///
  /// In en, this message translates to:
  /// **'No backups available'**
  String get settings_backup_no_backups;

  /// No description provided for @settings_backup_previous.
  ///
  /// In en, this message translates to:
  /// **'Previous Backups'**
  String get settings_backup_previous;

  /// No description provided for @settings_backup_quick_actions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get settings_backup_quick_actions;

  /// No description provided for @settings_backup_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get settings_backup_restore;

  /// No description provided for @settings_backup_restore_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to restore the backup from {date}? This will overwrite your current settings.'**
  String settings_backup_restore_confirm(Object date);

  /// No description provided for @settings_backup_restore_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a backup to restore from'**
  String get settings_backup_restore_subtitle;

  /// No description provided for @settings_backup_restored_success.
  ///
  /// In en, this message translates to:
  /// **'Backup restored successfully'**
  String get settings_backup_restored_success;

  /// No description provided for @settings_backup_restoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring from backup...'**
  String get settings_backup_restoring;

  /// No description provided for @settings_backup_restoring_title.
  ///
  /// In en, this message translates to:
  /// **'Restoring Backup'**
  String get settings_backup_restoring_title;

  /// No description provided for @settings_backup_settings.
  ///
  /// In en, this message translates to:
  /// **'Backup Settings'**
  String get settings_backup_settings;

  /// No description provided for @settings_backup_size.
  ///
  /// In en, this message translates to:
  /// **'Size: {size}'**
  String settings_backup_size(Object size);

  /// No description provided for @settings_backup_title.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get settings_backup_title;

  /// No description provided for @settings_blocked_content_add.
  ///
  /// In en, this message translates to:
  /// **'Block Content by ID'**
  String get settings_blocked_content_add;

  /// No description provided for @settings_blocked_content_add_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter a work or collection ID'**
  String get settings_blocked_content_add_subtitle;

  /// No description provided for @settings_blocked_content_blocked_collections.
  ///
  /// In en, this message translates to:
  /// **'Blocked Collections'**
  String get settings_blocked_content_blocked_collections;

  /// No description provided for @settings_blocked_content_blocked_works.
  ///
  /// In en, this message translates to:
  /// **'Blocked Works'**
  String get settings_blocked_content_blocked_works;

  /// No description provided for @settings_blocked_content_collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get settings_blocked_content_collection;

  /// No description provided for @settings_blocked_content_collection_format.
  ///
  /// In en, this message translates to:
  /// **'Collection #{id}'**
  String settings_blocked_content_collection_format(Object id);

  /// No description provided for @settings_blocked_content_collection_id.
  ///
  /// In en, this message translates to:
  /// **'Collection ID: {id}'**
  String settings_blocked_content_collection_id(Object id);

  /// No description provided for @settings_blocked_content_collection_id_label.
  ///
  /// In en, this message translates to:
  /// **'Collection ID'**
  String get settings_blocked_content_collection_id_label;

  /// No description provided for @settings_blocked_content_empty.
  ///
  /// In en, this message translates to:
  /// **'No blocked content yet'**
  String get settings_blocked_content_empty;

  /// No description provided for @settings_blocked_content_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Content you block will appear here'**
  String get settings_blocked_content_empty_subtitle;

  /// No description provided for @settings_blocked_content_enter_collection_id.
  ///
  /// In en, this message translates to:
  /// **'Enter collection ID'**
  String get settings_blocked_content_enter_collection_id;

  /// No description provided for @settings_blocked_content_enter_type.
  ///
  /// In en, this message translates to:
  /// **'Enter content type to block'**
  String get settings_blocked_content_enter_type;

  /// No description provided for @settings_blocked_content_enter_work_id.
  ///
  /// In en, this message translates to:
  /// **'Enter work ID'**
  String get settings_blocked_content_enter_work_id;

  /// No description provided for @settings_blocked_content_hide_feeds.
  ///
  /// In en, this message translates to:
  /// **'Hide Blocked Content in Feeds'**
  String get settings_blocked_content_hide_feeds;

  /// No description provided for @settings_blocked_content_hide_search.
  ///
  /// In en, this message translates to:
  /// **'Hide Blocked Content in Search'**
  String get settings_blocked_content_hide_search;

  /// No description provided for @settings_blocked_content_show_indicator.
  ///
  /// In en, this message translates to:
  /// **'Show Blocked Content Indicator'**
  String get settings_blocked_content_show_indicator;

  /// No description provided for @settings_blocked_content_show_indicator_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows when content has been hidden'**
  String get settings_blocked_content_show_indicator_subtitle;

  /// No description provided for @settings_blocked_content_title.
  ///
  /// In en, this message translates to:
  /// **'Blocked Content'**
  String get settings_blocked_content_title;

  /// No description provided for @settings_blocked_content_unblock_collection.
  ///
  /// In en, this message translates to:
  /// **'Unblock collection'**
  String get settings_blocked_content_unblock_collection;

  /// No description provided for @settings_blocked_content_unblock_work.
  ///
  /// In en, this message translates to:
  /// **'Unblock work'**
  String get settings_blocked_content_unblock_work;

  /// No description provided for @settings_blocked_content_work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get settings_blocked_content_work;

  /// No description provided for @settings_blocked_content_work_format.
  ///
  /// In en, this message translates to:
  /// **'Work #{id}'**
  String settings_blocked_content_work_format(Object id);

  /// No description provided for @settings_blocked_content_work_id.
  ///
  /// In en, this message translates to:
  /// **'Work ID: {id}'**
  String settings_blocked_content_work_id(Object id);

  /// No description provided for @settings_blocked_content_work_id_label.
  ///
  /// In en, this message translates to:
  /// **'Work ID'**
  String get settings_blocked_content_work_id_label;

  /// No description provided for @settings_cache_clear_all.
  ///
  /// In en, this message translates to:
  /// **'Clear All Cache'**
  String get settings_cache_clear_all;

  /// No description provided for @settings_cache_clear_all_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all cached data? This won\'t affect your downloads.'**
  String get settings_cache_clear_all_message;

  /// No description provided for @settings_cache_cleared.
  ///
  /// In en, this message translates to:
  /// **'All cache cleared'**
  String get settings_cache_cleared;

  /// No description provided for @settings_cache_cleared_specific.
  ///
  /// In en, this message translates to:
  /// **'{cacheType} cache cleared'**
  String settings_cache_cleared_specific(Object cacheType);

  /// No description provided for @settings_cache_image.
  ///
  /// In en, this message translates to:
  /// **'Image Cache'**
  String get settings_cache_image;

  /// No description provided for @settings_cache_interval.
  ///
  /// In en, this message translates to:
  /// **'Auto-Clear Interval'**
  String get settings_cache_interval;

  /// No description provided for @settings_cache_interval_daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get settings_cache_interval_daily;

  /// No description provided for @settings_cache_interval_manual.
  ///
  /// In en, this message translates to:
  /// **'Manual Only'**
  String get settings_cache_interval_manual;

  /// No description provided for @settings_cache_interval_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get settings_cache_interval_monthly;

  /// No description provided for @settings_cache_interval_weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get settings_cache_interval_weekly;

  /// No description provided for @settings_cache_max_size.
  ///
  /// In en, this message translates to:
  /// **'Maximum Cache Size'**
  String get settings_cache_max_size;

  /// No description provided for @settings_cache_metadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata Cache'**
  String get settings_cache_metadata;

  /// No description provided for @settings_cache_page.
  ///
  /// In en, this message translates to:
  /// **'Page Cache'**
  String get settings_cache_page;

  /// No description provided for @settings_cache_preserve_read.
  ///
  /// In en, this message translates to:
  /// **'Preserve Recently Read Cache'**
  String get settings_cache_preserve_read;

  /// No description provided for @settings_cache_preserve_read_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep cache for works you\'ve recently viewed'**
  String get settings_cache_preserve_read_subtitle;

  /// No description provided for @settings_cache_search.
  ///
  /// In en, this message translates to:
  /// **'Search Cache'**
  String get settings_cache_search;

  /// No description provided for @settings_cache_settings.
  ///
  /// In en, this message translates to:
  /// **'Cache Settings'**
  String get settings_cache_settings;

  /// No description provided for @settings_cache_size_1gb.
  ///
  /// In en, this message translates to:
  /// **'1 GB'**
  String get settings_cache_size_1gb;

  /// No description provided for @settings_cache_size_2gb.
  ///
  /// In en, this message translates to:
  /// **'2 GB'**
  String get settings_cache_size_2gb;

  /// No description provided for @settings_cache_size_500mb.
  ///
  /// In en, this message translates to:
  /// **'500 MB'**
  String get settings_cache_size_500mb;

  /// No description provided for @settings_cache_size_5gb.
  ///
  /// In en, this message translates to:
  /// **'5 GB'**
  String get settings_cache_size_5gb;

  /// No description provided for @settings_cache_size_unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get settings_cache_size_unlimited;

  /// No description provided for @settings_cache_title.
  ///
  /// In en, this message translates to:
  /// **'Cache Management'**
  String get settings_cache_title;

  /// No description provided for @settings_category_content.
  ///
  /// In en, this message translates to:
  /// **'Content & Filters'**
  String get settings_category_content;

  /// No description provided for @settings_category_reading.
  ///
  /// In en, this message translates to:
  /// **'Reading Experience'**
  String get settings_category_reading;

  /// No description provided for @settings_category_storage.
  ///
  /// In en, this message translates to:
  /// **'Storage & Data'**
  String get settings_category_storage;

  /// No description provided for @settings_category_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme & Appearance'**
  String get settings_category_theme;

  /// No description provided for @settings_common_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get settings_common_reset;

  /// No description provided for @settings_downloads_auto_delete.
  ///
  /// In en, this message translates to:
  /// **'Auto-Delete Old Downloads'**
  String get settings_downloads_auto_delete;

  /// No description provided for @settings_downloads_auto_delete_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove downloads older than 30 days'**
  String get settings_downloads_auto_delete_subtitle;

  /// No description provided for @settings_downloads_delete_all.
  ///
  /// In en, this message translates to:
  /// **'Delete all downloads'**
  String get settings_downloads_delete_all;

  /// No description provided for @settings_downloads_delete_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete All Downloads?'**
  String get settings_downloads_delete_confirmation;

  /// No description provided for @settings_downloads_delete_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'This will permanently remove all downloaded works. This action cannot be undone.'**
  String get settings_downloads_delete_confirmation_message;

  /// No description provided for @settings_downloads_deleted.
  ///
  /// In en, this message translates to:
  /// **'All downloads deleted'**
  String get settings_downloads_deleted;

  /// No description provided for @settings_downloads_settings.
  ///
  /// In en, this message translates to:
  /// **'Download Settings'**
  String get settings_downloads_settings;

  /// No description provided for @settings_downloads_title.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get settings_downloads_title;

  /// No description provided for @settings_downloads_wifi_only.
  ///
  /// In en, this message translates to:
  /// **'Download Over Wi-Fi Only'**
  String get settings_downloads_wifi_only;

  /// No description provided for @settings_font_body_select.
  ///
  /// In en, this message translates to:
  /// **'Select a font for body text'**
  String get settings_font_body_select;

  /// No description provided for @settings_font_heading_select.
  ///
  /// In en, this message translates to:
  /// **'Select a font for headings'**
  String get settings_font_heading_select;

  /// No description provided for @settings_font_system_default.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get settings_font_system_default;

  /// No description provided for @settings_font_tab_body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get settings_font_tab_body;

  /// No description provided for @settings_font_tab_headings.
  ///
  /// In en, this message translates to:
  /// **'Headings'**
  String get settings_font_tab_headings;

  /// No description provided for @settings_font_title.
  ///
  /// In en, this message translates to:
  /// **'Font Selection'**
  String get settings_font_title;

  /// No description provided for @settings_history_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear Reading History'**
  String get settings_history_clear;

  /// No description provided for @settings_history_clear_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove all reading history data'**
  String get settings_history_clear_subtitle;

  /// No description provided for @settings_history_retention.
  ///
  /// In en, this message translates to:
  /// **'History Retention'**
  String get settings_history_retention;

  /// No description provided for @settings_history_retention_1month.
  ///
  /// In en, this message translates to:
  /// **'1 Month'**
  String get settings_history_retention_1month;

  /// No description provided for @settings_history_retention_1year.
  ///
  /// In en, this message translates to:
  /// **'1 Year'**
  String get settings_history_retention_1year;

  /// No description provided for @settings_history_retention_3months.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get settings_history_retention_3months;

  /// No description provided for @settings_history_retention_6months.
  ///
  /// In en, this message translates to:
  /// **'6 Months'**
  String get settings_history_retention_6months;

  /// No description provided for @settings_history_retention_forever.
  ///
  /// In en, this message translates to:
  /// **'Forever'**
  String get settings_history_retention_forever;

  /// No description provided for @settings_history_settings.
  ///
  /// In en, this message translates to:
  /// **'History Settings'**
  String get settings_history_settings;

  /// No description provided for @settings_history_sync_ao3.
  ///
  /// In en, this message translates to:
  /// **'Sync with AO3'**
  String get settings_history_sync_ao3;

  /// No description provided for @settings_history_sync_ao3_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sync history with your AO3 account'**
  String get settings_history_sync_ao3_subtitle;

  /// No description provided for @settings_history_sync_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Sync Bookmarks'**
  String get settings_history_sync_bookmarks;

  /// No description provided for @settings_history_sync_bookmarks_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Add works to bookmarks when marked as favorite'**
  String get settings_history_sync_bookmarks_subtitle;

  /// No description provided for @settings_history_title.
  ///
  /// In en, this message translates to:
  /// **'Reading History'**
  String get settings_history_title;

  /// No description provided for @settings_history_track.
  ///
  /// In en, this message translates to:
  /// **'Track Reading History'**
  String get settings_history_track;

  /// No description provided for @settings_history_track_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep record of works you\'ve read'**
  String get settings_history_track_subtitle;

  /// No description provided for @settings_layout_dual_column.
  ///
  /// In en, this message translates to:
  /// **'Dual Column'**
  String get settings_layout_dual_column;

  /// No description provided for @settings_layout_justify_text.
  ///
  /// In en, this message translates to:
  /// **'Justify Text'**
  String get settings_layout_justify_text;

  /// No description provided for @settings_layout_line_spacing.
  ///
  /// In en, this message translates to:
  /// **'Line spacing'**
  String get settings_layout_line_spacing;

  /// No description provided for @settings_layout_paginated.
  ///
  /// In en, this message translates to:
  /// **'Paginated'**
  String get settings_layout_paginated;

  /// No description provided for @settings_layout_paragraph_spacing.
  ///
  /// In en, this message translates to:
  /// **'Paragraph spacing'**
  String get settings_layout_paragraph_spacing;

  /// No description provided for @settings_layout_preview_format.
  ///
  /// In en, this message translates to:
  /// **'{layout} Layout'**
  String settings_layout_preview_format(Object layout);

  /// No description provided for @settings_layout_single_column.
  ///
  /// In en, this message translates to:
  /// **'Single Column'**
  String get settings_layout_single_column;

  /// No description provided for @settings_layout_title.
  ///
  /// In en, this message translates to:
  /// **'Reading Layout'**
  String get settings_layout_title;

  /// No description provided for @settings_layout_type.
  ///
  /// In en, this message translates to:
  /// **'Layout type'**
  String get settings_layout_type;

  /// No description provided for @settings_rating_age_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Require Age Confirmation for Explicit'**
  String get settings_rating_age_confirmation;

  /// No description provided for @settings_rating_age_confirmation_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Only applies if you\'re showing explicit content'**
  String get settings_rating_age_confirmation_subtitle;

  /// No description provided for @settings_rating_blur_explicit.
  ///
  /// In en, this message translates to:
  /// **'Blur Explicit Thumbnails'**
  String get settings_rating_blur_explicit;

  /// No description provided for @settings_rating_default_filter.
  ///
  /// In en, this message translates to:
  /// **'Default Search Filter'**
  String get settings_rating_default_filter;

  /// No description provided for @settings_rating_default_filter_label.
  ///
  /// In en, this message translates to:
  /// **'Default Rating Filter'**
  String get settings_rating_default_filter_label;

  /// No description provided for @settings_rating_display.
  ///
  /// In en, this message translates to:
  /// **'Display Options'**
  String get settings_rating_display;

  /// No description provided for @settings_rating_explicit.
  ///
  /// In en, this message translates to:
  /// **'Explicit'**
  String get settings_rating_explicit;

  /// No description provided for @settings_rating_general.
  ///
  /// In en, this message translates to:
  /// **'General Audiences'**
  String get settings_rating_general;

  /// No description provided for @settings_rating_general_teen.
  ///
  /// In en, this message translates to:
  /// **'General & Teen Only'**
  String get settings_rating_general_teen;

  /// No description provided for @settings_rating_mature.
  ///
  /// In en, this message translates to:
  /// **'Mature'**
  String get settings_rating_mature;

  /// No description provided for @settings_rating_no_explicit.
  ///
  /// In en, this message translates to:
  /// **'No Explicit'**
  String get settings_rating_no_explicit;

  /// No description provided for @settings_rating_no_filter.
  ///
  /// In en, this message translates to:
  /// **'No Filter'**
  String get settings_rating_no_filter;

  /// No description provided for @settings_rating_show_icons.
  ///
  /// In en, this message translates to:
  /// **'Show Rating Icons'**
  String get settings_rating_show_icons;

  /// No description provided for @settings_rating_show_icons_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Display visual indicators of work ratings'**
  String get settings_rating_show_icons_subtitle;

  /// No description provided for @settings_rating_teen.
  ///
  /// In en, this message translates to:
  /// **'Teen And Up'**
  String get settings_rating_teen;

  /// No description provided for @settings_rating_title.
  ///
  /// In en, this message translates to:
  /// **'Rating Preferences'**
  String get settings_rating_title;

  /// No description provided for @settings_rating_visibility.
  ///
  /// In en, this message translates to:
  /// **'Rating Visibility'**
  String get settings_rating_visibility;

  /// No description provided for @settings_rating_visibility_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Show or hide works with the following ratings'**
  String get settings_rating_visibility_subtitle;

  /// No description provided for @settings_scrolling_animation.
  ///
  /// In en, this message translates to:
  /// **'Allow Page Turning Animation'**
  String get settings_scrolling_animation;

  /// No description provided for @settings_scrolling_animation_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Adds a page turning animation'**
  String get settings_scrolling_animation_subtitle;

  /// No description provided for @settings_scrolling_continuous.
  ///
  /// In en, this message translates to:
  /// **'Continuous'**
  String get settings_scrolling_continuous;

  /// No description provided for @settings_scrolling_continuous_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Standard smooth scrolling'**
  String get settings_scrolling_continuous_subtitle;

  /// No description provided for @settings_scrolling_keep_screen_on.
  ///
  /// In en, this message translates to:
  /// **'Keep Screen On'**
  String get settings_scrolling_keep_screen_on;

  /// No description provided for @settings_scrolling_keep_screen_on_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Prevents the screen from turning off'**
  String get settings_scrolling_keep_screen_on_subtitle;

  /// No description provided for @settings_scrolling_paged.
  ///
  /// In en, this message translates to:
  /// **'Paged'**
  String get settings_scrolling_paged;

  /// No description provided for @settings_scrolling_paged_options.
  ///
  /// In en, this message translates to:
  /// **'Paged Scrolling Options'**
  String get settings_scrolling_paged_options;

  /// No description provided for @settings_scrolling_paged_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Swipe to move between pages'**
  String get settings_scrolling_paged_subtitle;

  /// No description provided for @settings_scrolling_physics.
  ///
  /// In en, this message translates to:
  /// **'Physics-based Scrolling'**
  String get settings_scrolling_physics;

  /// No description provided for @settings_scrolling_physics_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Makes scrolling feel more natural with momentum'**
  String get settings_scrolling_physics_subtitle;

  /// No description provided for @settings_scrolling_sensitivity.
  ///
  /// In en, this message translates to:
  /// **'Scroll Sensitivity'**
  String get settings_scrolling_sensitivity;

  /// No description provided for @settings_scrolling_show_indicator.
  ///
  /// In en, this message translates to:
  /// **'Show Page Indicator'**
  String get settings_scrolling_show_indicator;

  /// No description provided for @settings_scrolling_show_indicator_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Displays a page indicator at the bottom'**
  String get settings_scrolling_show_indicator_subtitle;

  /// No description provided for @settings_scrolling_tap_edges.
  ///
  /// In en, this message translates to:
  /// **'Tap Edges to Turn Page'**
  String get settings_scrolling_tap_edges;

  /// No description provided for @settings_scrolling_tap_edges_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the edges of the screen to turn pages'**
  String get settings_scrolling_tap_edges_subtitle;

  /// No description provided for @settings_scrolling_title.
  ///
  /// In en, this message translates to:
  /// **'Scrolling Behavior'**
  String get settings_scrolling_title;

  /// No description provided for @settings_scrolling_type.
  ///
  /// In en, this message translates to:
  /// **'Scroll Type'**
  String get settings_scrolling_type;

  /// No description provided for @settings_scrolling_type_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your scroll type'**
  String get settings_scrolling_type_subtitle;

  /// No description provided for @settings_tag_filters_add_tag.
  ///
  /// In en, this message translates to:
  /// **'Add {mode}ed Tag'**
  String settings_tag_filters_add_tag(Object mode);

  /// No description provided for @settings_tag_filters_blacklist.
  ///
  /// In en, this message translates to:
  /// **'Blacklist Mode'**
  String get settings_tag_filters_blacklist;

  /// No description provided for @settings_tag_filters_blacklist_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Hide works with specified tags'**
  String get settings_tag_filters_blacklist_subtitle;

  /// No description provided for @settings_tag_filters_enter_tag.
  ///
  /// In en, this message translates to:
  /// **'Enter tag name'**
  String get settings_tag_filters_enter_tag;

  /// No description provided for @settings_tag_filters_hide_works.
  ///
  /// In en, this message translates to:
  /// **'Hide Filtered Works'**
  String get settings_tag_filters_hide_works;

  /// No description provided for @settings_tag_filters_hide_works_blacklist.
  ///
  /// In en, this message translates to:
  /// **'Hide works with blacklisted tags'**
  String get settings_tag_filters_hide_works_blacklist;

  /// No description provided for @settings_tag_filters_hide_works_whitelist.
  ///
  /// In en, this message translates to:
  /// **'Hide works without whitelisted tags'**
  String get settings_tag_filters_hide_works_whitelist;

  /// No description provided for @settings_tag_filters_no_tags.
  ///
  /// In en, this message translates to:
  /// **'No {mode}ed tags yet'**
  String settings_tag_filters_no_tags(Object mode);

  /// No description provided for @settings_tag_filters_remove_tag.
  ///
  /// In en, this message translates to:
  /// **'Remove tag'**
  String get settings_tag_filters_remove_tag;

  /// No description provided for @settings_tag_filters_settings.
  ///
  /// In en, this message translates to:
  /// **'Filter Settings'**
  String get settings_tag_filters_settings;

  /// No description provided for @settings_tag_filters_sync.
  ///
  /// In en, this message translates to:
  /// **'Sync with AO3 Account'**
  String get settings_tag_filters_sync;

  /// No description provided for @settings_tag_filters_sync_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sync filters with your AO3 account'**
  String get settings_tag_filters_sync_subtitle;

  /// No description provided for @settings_tag_filters_title.
  ///
  /// In en, this message translates to:
  /// **'Tag Filters'**
  String get settings_tag_filters_title;

  /// No description provided for @settings_tag_filters_whitelist.
  ///
  /// In en, this message translates to:
  /// **'Whitelist Mode'**
  String get settings_tag_filters_whitelist;

  /// No description provided for @settings_tag_filters_whitelist_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Only show works with specified tags'**
  String get settings_tag_filters_whitelist_subtitle;

  /// No description provided for @settings_text_size_adjust_label.
  ///
  /// In en, this message translates to:
  /// **'Adjust the slider to change the text size throughout the app.'**
  String get settings_text_size_adjust_label;

  /// No description provided for @settings_text_size_body.
  ///
  /// In en, this message translates to:
  /// **'This is the body text that you\'ll see throughout the app. It should be comfortable to read for extended periods of time.'**
  String get settings_text_size_body;

  /// No description provided for @settings_text_size_heading.
  ///
  /// In en, this message translates to:
  /// **'This is a heading'**
  String get settings_text_size_heading;

  /// No description provided for @settings_text_size_preview_title.
  ///
  /// In en, this message translates to:
  /// **'Text Size Preview'**
  String get settings_text_size_preview_title;

  /// No description provided for @settings_text_size_subheading.
  ///
  /// In en, this message translates to:
  /// **'This is a subheading that provides more context'**
  String get settings_text_size_subheading;

  /// No description provided for @settings_text_size_title.
  ///
  /// In en, this message translates to:
  /// **'Text Size'**
  String get settings_text_size_title;

  /// No description provided for @settings_theme_color_blue.
  ///
  /// In en, this message translates to:
  /// **'Default Blue'**
  String get settings_theme_color_blue;

  /// No description provided for @settings_theme_color_cyan.
  ///
  /// In en, this message translates to:
  /// **'Cool Cyan'**
  String get settings_theme_color_cyan;

  /// No description provided for @settings_theme_color_green.
  ///
  /// In en, this message translates to:
  /// **'Forest Green'**
  String get settings_theme_color_green;

  /// No description provided for @settings_theme_color_orange.
  ///
  /// In en, this message translates to:
  /// **'Warm Orange'**
  String get settings_theme_color_orange;

  /// No description provided for @settings_theme_color_purple.
  ///
  /// In en, this message translates to:
  /// **'Vibrant Purple'**
  String get settings_theme_color_purple;

  /// No description provided for @settings_theme_color_red.
  ///
  /// In en, this message translates to:
  /// **'Classic Red'**
  String get settings_theme_color_red;

  /// No description provided for @settings_theme_color_scheme.
  ///
  /// In en, this message translates to:
  /// **'Color Scheme'**
  String get settings_theme_color_scheme;

  /// No description provided for @settings_theme_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settings_theme_dark_mode;

  /// No description provided for @settings_theme_high_contrast.
  ///
  /// In en, this message translates to:
  /// **'High Contrast'**
  String get settings_theme_high_contrast;

  /// No description provided for @settings_theme_system.
  ///
  /// In en, this message translates to:
  /// **'Use System Theme'**
  String get settings_theme_system;

  /// No description provided for @settings_theme_wallpaper_colors.
  ///
  /// In en, this message translates to:
  /// **'Use Wallpaper Colors'**
  String get settings_theme_wallpaper_colors;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_warnings_apply.
  ///
  /// In en, this message translates to:
  /// **'Archive Warnings Apply'**
  String get settings_warnings_apply;

  /// No description provided for @settings_warnings_apply_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Works with creator-selected warnings'**
  String get settings_warnings_apply_subtitle;

  /// No description provided for @settings_warnings_autohide.
  ///
  /// In en, this message translates to:
  /// **'Auto-hide Explicit Content'**
  String get settings_warnings_autohide;

  /// No description provided for @settings_warnings_autohide_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Always hide explicit content by default'**
  String get settings_warnings_autohide_subtitle;

  /// No description provided for @settings_warnings_blur.
  ///
  /// In en, this message translates to:
  /// **'Blur Sensitive Content'**
  String get settings_warnings_blur;

  /// No description provided for @settings_warnings_blur_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Blur images and summaries until confirmed'**
  String get settings_warnings_blur_subtitle;

  /// No description provided for @settings_warnings_choose_not_to.
  ///
  /// In en, this message translates to:
  /// **'Creator Chose Not To Warn'**
  String get settings_warnings_choose_not_to;

  /// No description provided for @settings_warnings_choose_not_to_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Works where creator opted out of warnings'**
  String get settings_warnings_choose_not_to_subtitle;

  /// No description provided for @settings_warnings_death.
  ///
  /// In en, this message translates to:
  /// **'Major Character Death'**
  String get settings_warnings_death;

  /// No description provided for @settings_warnings_dialog.
  ///
  /// In en, this message translates to:
  /// **'Show Warning Dialog'**
  String get settings_warnings_dialog;

  /// No description provided for @settings_warnings_dialog_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Display confirmation dialog for sensitive content'**
  String get settings_warnings_dialog_subtitle;

  /// No description provided for @settings_warnings_display.
  ///
  /// In en, this message translates to:
  /// **'Warning Display'**
  String get settings_warnings_display;

  /// No description provided for @settings_warnings_no_warnings.
  ///
  /// In en, this message translates to:
  /// **'No Archive Warnings'**
  String get settings_warnings_no_warnings;

  /// No description provided for @settings_warnings_no_warnings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Works with no specific warnings'**
  String get settings_warnings_no_warnings_subtitle;

  /// No description provided for @settings_warnings_noncon.
  ///
  /// In en, this message translates to:
  /// **'Rape/Non-Con'**
  String get settings_warnings_noncon;

  /// No description provided for @settings_warnings_specific.
  ///
  /// In en, this message translates to:
  /// **'Specific Warnings'**
  String get settings_warnings_specific;

  /// No description provided for @settings_warnings_title.
  ///
  /// In en, this message translates to:
  /// **'Content Warnings'**
  String get settings_warnings_title;

  /// No description provided for @settings_warnings_types.
  ///
  /// In en, this message translates to:
  /// **'Archive Warning Types'**
  String get settings_warnings_types;

  /// No description provided for @settings_warnings_types_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose which types of Archive Warnings should trigger confirmation dialogs'**
  String get settings_warnings_types_subtitle;

  /// No description provided for @settings_warnings_underage.
  ///
  /// In en, this message translates to:
  /// **'Underage'**
  String get settings_warnings_underage;

  /// No description provided for @settings_warnings_violence.
  ///
  /// In en, this message translates to:
  /// **'Graphic Violence'**
  String get settings_warnings_violence;

  /// No description provided for @work_bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get work_bookmarks;

  /// No description provided for @work_comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get work_comment;

  /// No description provided for @work_complete.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get work_complete;

  /// No description provided for @work_detail_btn_read.
  ///
  /// In en, this message translates to:
  /// **'Start reading'**
  String get work_detail_btn_read;

  /// No description provided for @work_detail_chapters.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get work_detail_chapters;

  /// No description provided for @work_detail_words.
  ///
  /// In en, this message translates to:
  /// **'Words'**
  String get work_detail_words;

  /// No description provided for @work_download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get work_download;

  /// No description provided for @work_kudos.
  ///
  /// In en, this message translates to:
  /// **'Kudos'**
  String get work_kudos;

  /// No description provided for @work_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get work_share;

  /// No description provided for @work_subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get work_subscribe;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tl': return AppLocalizationsTl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
