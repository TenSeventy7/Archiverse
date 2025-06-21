/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/ao3_api_impl.dart';
import 'package:archiverse/database/database.dart';
import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/work.dart';

// Re-export everything so callers can use the extension methods directly
export 'package:archiverse/api/ao3_api.dart';

// Export extensions specific for AppApi
export 'package:archiverse/extensions/api_read_history.dart';

class AppApi extends Ao3Api {
  static final AppApi _instance = AppApi._internal();
  AppDatabase database = DataRepository.database;

  late final Ao3ApiImpl _ao3Api;

  AppApi._internal() : super.generative() {
    _ao3Api = Ao3ApiImpl();
  }

  factory AppApi() => _instance;

  Future<Work> getWork(Work work) async {
    try {
      // Check database first if it's cached
      Work? cachedWork = await WorkRepository.getWork(work.id);
      if (cachedWork != null) {
        return cachedWork;
      }

      return _ao3Api.getWork(work);
    } catch (e) {
      return _ao3Api.getWork(work);
    }
  }

  Future<Chapter> getChapter(Chapter chapter) async {
    try {
      // Check database first if it's cached
      Chapter? cachedChapter = await ChapterRepository.getChapter(chapter.id);
      if (cachedChapter != null) {
        return cachedChapter;
      }

      return _ao3Api.getChapter(chapter);
    } catch (e) {
      return _ao3Api.getChapter(chapter);
    }
  }
}
