// ignore_for_file: constant_identifier_names

import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum Media {
  ANIME_MANGA,
  BOOKS_LITERATURE,
  CARTOONS_COMICS_GRAPHIC_NOVELS,
  CELEBRITIES_REAL_PEOPLE,
  MOVIES,
  MUSIC_BANDS,
  OTHER_MEDIA,
  THEATER,
  TV_SHOWS,
  VIDEO_GAMES,
  UNCATEGORIZED;

  String get path {
    switch (this) {
      case Media.ANIME_MANGA:
        return 'Anime *a* Manga';
      case Media.BOOKS_LITERATURE:
        return 'Books *a* Literature';
      case Media.CARTOONS_COMICS_GRAPHIC_NOVELS:
        return 'Cartoons *a* Comics *a* Graphic Novels';
      case Media.CELEBRITIES_REAL_PEOPLE:
        return 'Celebrities *a* Real People';
      case Media.MOVIES:
        return 'Movies';
      case Media.MUSIC_BANDS:
        return 'Music *a* Bands';
      case Media.OTHER_MEDIA:
        return 'Other Media';
      case Media.THEATER:
        return 'Theater';
      case Media.TV_SHOWS:
        return 'TV Shows';
      case Media.VIDEO_GAMES:
        return 'Video Games';
      case Media.UNCATEGORIZED:
      default:
        return 'Uncategorized Fandoms';
    }
  }

  String get id {
    switch (this) {
      case Media.ANIME_MANGA:
        return '#medium_5';
      case Media.BOOKS_LITERATURE:
        return '#medium_3';
      case Media.CARTOONS_COMICS_GRAPHIC_NOVELS:
        return '#medium_4';
      case Media.CELEBRITIES_REAL_PEOPLE:
        return '#medium_7';
      case Media.MOVIES:
        return '#medium_2';
      case Media.MUSIC_BANDS:
        return '#medium_6';
      case Media.OTHER_MEDIA:
        return '#medium_8';
      case Media.THEATER:
        return '#medium_30198';
      case Media.TV_SHOWS:
        return '#medium_1';
      case Media.VIDEO_GAMES:
        return '#medium_476';
      case Media.UNCATEGORIZED:
      default:
        return '#medium_9971';
    }
  }

  IconData get icon {
    switch (this) {
      case Media.ANIME_MANGA:
        return TablerIcons.torii;
      case Media.BOOKS_LITERATURE:
        return TablerIcons.book;
      case Media.CARTOONS_COMICS_GRAPHIC_NOVELS:
        return TablerIcons.mickey;
      case Media.CELEBRITIES_REAL_PEOPLE:
        return TablerIcons.user;
      case Media.MOVIES:
        return TablerIcons.movie;
      case Media.MUSIC_BANDS:
        return TablerIcons.piano;
      case Media.OTHER_MEDIA:
        return TablerIcons.folders;
      case Media.THEATER:
        return TablerIcons.masks_theater;
      case Media.TV_SHOWS:
        return TablerIcons.device_tv;
      case Media.VIDEO_GAMES:
        return TablerIcons.device_gamepad;
      case Media.UNCATEGORIZED:
        return TablerIcons.category;
    }
  }

  String toLocalName(BuildContext context) {
    var localizations = context.strings;
    switch (this) {
      case Media.ANIME_MANGA:
        return localizations.fandom_anime_manga;
      case Media.BOOKS_LITERATURE:
        return localizations.fandom_books_literature;
      case Media.CARTOONS_COMICS_GRAPHIC_NOVELS:
        return localizations.fandom_cartoons_comics_graphic_novels;
      case Media.CELEBRITIES_REAL_PEOPLE:
        return localizations.fandom_celebrities_real_people;
      case Media.MOVIES:
        return localizations.fandom_movies;
      case Media.MUSIC_BANDS:
        return localizations.fandom_music_bands;
      case Media.OTHER_MEDIA:
        return localizations.fandom_other_media;
      case Media.THEATER:
        return localizations.fandom_theater;
      case Media.TV_SHOWS:
        return localizations.fandom_tv_shows;
      case Media.VIDEO_GAMES:
        return localizations.fandom_video_games;
      case Media.UNCATEGORIZED:
      default:
        return localizations.fandom_uncategorized;
    }
  }
}
