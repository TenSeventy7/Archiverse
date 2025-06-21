/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * TODO: Remove usage of this file and use proper placeholders in components and views.
 */

import 'package:archiverse/models/collection.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/models/user.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';

class Fillers {
  static String get loremIpsum =>
      '''<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Donec euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl.</p>
         <p>Sed euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Sed euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Sed euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Sed euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl. Sed euismod, nisl eget ultricies ultricies, nunc nisl ultricies nunc, vitae luctus nisl nisl nec nisl.</p>
      ''';
  static String get shortName => "A Kinda Short Name";
  static String get longName => "A Very Long Name That Should Be Truncated";
  static String get userName => "JuanDelaCruz1234";
  static String get pseudName => "JuanDelaCruz5678";
  static int get largeNumber => 999;
  static int get smallNumber => 9;
  static DateTime get date => DateTime.now();

  // User
  static Pseud get user =>
      Pseud(name: userName, pseud: pseudName, bio: loremIpsum);
  static List<User> get users => List<User>.generate(5, (index) => user);
  static List<Pseud> get pseuds => List<Pseud>.generate(5, (index) => user);

  // Tag
  static Tag get _tag => Tag(name: longName, count: largeNumber);
  static Tag get subTag => Tag(
    name: longName,
    count: largeNumber,
    subtags: List<Tag>.generate(10, (index) => _tag),
  );
  static Tag get tag => _tag.copyWith(
    name: longName,
    count: largeNumber,
    canonical: true,
    parents: List<Tag>.generate(10, (index) => _tag),
    children: List<Tag>.generate(10, (index) => _tag),
    synonyms: List<Tag>.generate(10, (index) => _tag),
    mergers: List<Tag>.generate(1, (index) => _tag),
    subtags: List<Tag>.generate(10, (index) => subTag),
  );
  static Tag get fandom => tag;
  static Tag get character => tag;
  static Tag get relationship => tag;
  static List<Tag> get fandoms => List<Tag>.generate(10, (index) => fandom);
  static List<Tag> get characters =>
      List<Tag>.generate(10, (index) => character);
  static List<Tag> get relationships =>
      List<Tag>.generate(10, (index) => relationship);
  static List<Tag> get freeforms => List<Tag>.generate(10, (index) => tag);

  // Bookmark
  static Bookmark get bookmark => Bookmark(
    user: user,
    date: date,
    type: BookmarkType.PUBLIC,
    tags: freeforms,
  );
  static Bookmark get recommendation =>
      bookmark.copyWith(type: BookmarkType.RECOMMENDATION);
  static List<Bookmark> get bookmarks =>
      List<Bookmark>.generate(10, (index) => bookmark);
  static List<Bookmark> get recommendations =>
      List<Bookmark>.generate(10, (index) => recommendation);
  static TagBookmark get tagBookmark =>
      TagBookmark(work: work, series: series, bookmarks: bookmarks);
  static List<TagBookmark> get tagBookmarks =>
      List<TagBookmark>.generate(5, (index) => tagBookmark);

  // Chapter
  static Chapter get chapter => Chapter(
    workId: -1,
    id: -1,
    oneshot: false,
    title: longName,
    chapter: largeNumber,
    content: loremIpsum,
    preface: loremIpsum,
    publishDate: date,
  );
  static List<Chapter> get chapters =>
      List<Chapter>.generate(10, (index) => chapter);

  // Series
  static Series get series => Series(
    id: -1,
    title: longName,
    summary: loremIpsum,
    authors: [user],
    words: largeNumber,
    works: largeNumber,
    bookmarks: largeNumber,
  );
  static List<Series> get seriesList =>
      List<Series>.generate(10, (index) => series);

  // Work
  static Work get work => Work(
    id: -1,
    title: shortName,
    summary: loremIpsum,
    authors: [user],
    words: largeNumber,
    chapters: largeNumber,
    bookmarks: largeNumber,
    fandoms: fandoms,
    characters: characters,
    relationships: relationships,
    tags: freeforms,
    updateDate: date,
    totalChapters: largeNumber,
    series: [],
    comments: largeNumber,
    kudos: largeNumber,
    hits: largeNumber,
    finished: false,
    language: 'English',
    rating: AgeRating.GENERAL,
    relationship: [RelationshipType.GEN],
    warnings: [],
    requiresAuth: false,
  );

  static List<Work> generateRandomWorks(int length) {
    // Generate works with random ratings, tags, and so
    List<Work> works = [];
    for (int i = 0; i < length; i++) {
      works.add(
        work.copyWith(
          fandoms: fandoms,
          characters: characters,
          relationships: relationships,
          tags: freeforms,
          chapters: 10,
          bookmarks: 5,
          comments: largeNumber,
          kudos: largeNumber,
          hits: largeNumber,
        ),
      );

      // Randomize the work's properties
      works[i] = works[i].copyWith(
        fandoms: fandoms.sublist(0, (i + 1) % fandoms.length),
        characters: characters.sublist(0, i % characters.length),
        relationships: relationships.sublist(0, i % relationships.length),
        tags: freeforms.sublist(0, i % freeforms.length),
        comments: largeNumber,
        kudos: largeNumber,
        hits: largeNumber,
      );

      // Also randomize dates
      works[i] = works[i].copyWith(
        finished: i % 2 == 0,
        updateDate: DateTime.now().subtract(Duration(days: i)),
        publishDate: DateTime.now().subtract(Duration(days: i)),
      );

      // Also randomize ratings
      works[i] = works[i].copyWith(
        rating: AgeRating.values[i % AgeRating.values.length],
        relationship: [
          RelationshipType.values[i % RelationshipType.values.length],
        ],
        warnings: [WarningType.values[i % WarningType.values.length]],
      );
    }

    return works;
  }

  static List<Work> get works => List<Work>.generate(10, (index) => work);

  // Read History
  static ReadHistory get history => ReadHistory(
    work: work,
    chapter: chapter,
    timestamp: DateTime.now(),
    position: 2,
    status: ReadStatus.IN_PROGRESS,
    completion: 0.5,
  );

  // Collection
  static List<String> images = [
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/All_Might_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Backdraft_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Best_Jeanist_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Black_Seijin_Student_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Blue_Seijin_Student_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Buster_Hero_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Camie_Utsushimi_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Cementoss_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Chiyo_Shuzenji_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Commissioner_General_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Cow_Lady_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Crimson_Riot_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Dabi_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/David_Shield_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Death_Arms_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Denki_Kaminari_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Ectoplasm_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Edge_Shot_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Eijirou_Kirishima_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Endeavor_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Fat_Gum_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Fourth_Kind_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Fumikage_Tokoyami_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Gang_Orca_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Giran_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Godzillo_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Gran_Torino_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Green_Seijin_Student_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Gunhead_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Habuko_Mongoose_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Hanta_Sero_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Himiko_Toga_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Hound_Dog_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Inasa_Yoarashi_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Ingenium_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Innsmouth_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Itejiro_Toteki_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Izuku_Midoriya_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kamui_Woods_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kashiko_Sekigai_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Katsuki_Bakugo_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kenji_Hikishi_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kouji_Kouda_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kouta_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kuin_Hachisuka_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kurogiri_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Kyouka_Jirou_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Lunch-Rush_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Maguma_Iwata_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mandalay_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Manual_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mashirao_Ojiro_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mei_Hatsume_Mugshot.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Melissa_Sheild_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mezo_Shoji_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Midnight_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mina_Ashido_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Minoru_Mineta_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mirio_Togata_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Momo_Yaoyorozu_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Moonfish_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mr_Compress_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mr._Principal_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Ms_Joke_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mt._Lady_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Muscular_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Mustard_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nagamasa_Moura_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nejire_Hado_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nighteye_Portrait_Color_Scheme2.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/No._13_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nomu_%28Flying%29_anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nomu_%28No_eyes%29_anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nomu_%284_Eyed%29_anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Nomu_Tool_Arms_headshot.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Noumu_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Ochaco_Uraraka_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Overhaul_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Pixie_Bob_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Present_Mic_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Ragdoll_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Red_Seijin_Student_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Rikido_Sato_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Romero_Fujimi_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Seiji_Shishikura_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Selkie_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Shikkui_Makabe_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Shota_Aizawa_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Shoto_Todoroki_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Sirius_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Snipe_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Spinner_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tamaki_Amajiki_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tatami_Nakagame_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tenya_Iida_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tiger_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tooru_Hagakure_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Tsuyu_Asui_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Twice_Portal_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Uwabami_anime_portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Vlad_King_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Wolfram_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Yellow_Seijin_Student_Left_Eye_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Yellow_Seijin_Student_Right_Eye_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Yo_Shindo_Anime_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Yokumiru_Mera_Portrait.png?raw=true",
    "https://github.com/EvanBacon/anime-lorem/blob/master/assets/my-hero-academia/Yuuga_Aoyama_Portrait.png?raw=true",
  ];

  static Collection get collection => Collection(
    title: longName,
    name: longName,
    owner: user,
    maintainers: users,
    subcollections: 0,
    bookmarks: smallNumber,
    fandoms: smallNumber,
    works: smallNumber,
    creationDate: date,
    email: longName,
    imageUrl: images[0],
    description: loremIpsum,
    moderated: true,
    open: true,
    unrevealed: true,
    anonymous: true,
    type: CollectionType.GIFT_EXCHANGE,
    introduction: loremIpsum,
    faq: loremIpsum,
    rules: loremIpsum,
  );
  static List<Collection> get collections => List<Collection>.generate(
    20,
    (index) => collection.copyWith(
      // randomize image
      subcollections: index,
      imageUrl: images[index % images.length],
      bookmarks: index % 2 == 0 ? smallNumber : largeNumber,
      fandoms: index % 3 == 0 ? smallNumber : largeNumber,
      works: index % 4 == 0 ? smallNumber : largeNumber,
      moderated: index % 5 == 0,
      open: index % 6 == 0,
      unrevealed: index % 7 == 0,
      anonymous: index % 8 == 0,
      type: CollectionType.values[index % 3],
    ),
  );
}
