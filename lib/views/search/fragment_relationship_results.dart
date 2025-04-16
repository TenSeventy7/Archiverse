/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/parsers/tag.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/views/search/fragment_tag_results.dart';

class RelationshipSearchFragment extends TagSearchFragment {
  static const String routeName = '/search/relationships';
  const RelationshipSearchFragment({super.key});

  @override
  Future<List<Tag>> fetchItems(String query, int page) async {
    return await Ao3Api().searchTags(
      query,
      page: page,
      type: TagType.RELATIONSHIP,
    );
  }
}
