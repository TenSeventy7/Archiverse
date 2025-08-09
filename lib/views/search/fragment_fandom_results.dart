/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/views/search/fragment_tag_results.dart';

class FandomSearchFragment extends TagSearchFragment {
  static const String routeName = '/search/fandoms';
  const FandomSearchFragment({super.key});

  @override
  Future<List<Tag>> fetchItems(String query, int page) async {
    return await AppApi().searchTags(query, page: page, type: TagType.FANDOM);
  }
}
