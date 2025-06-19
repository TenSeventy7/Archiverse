/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api.dart';
import 'package:archiverse/api/parsers/tag.dart';
import 'package:archiverse/components/items/tag_item.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/views/activity_tag.dart';
import 'package:archiverse/views/search/fragment_search_kind_common.dart';
import 'package:flutter/material.dart';

class TagSearchFragment extends StatelessWidget {
  static const String routeName = '/search/tags';
  const TagSearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonKindSearchFragment<Tag>(
      fetcher: _fetchItems,
      itemBuilder: _buildItems,
    );
  }

  Future<List<Tag>> _fetchItems(String query, int page) async {
    return fetchItems(query, page);
  }

  Future<List<Tag>> fetchItems(String query, int page) async {
    return await AppApi().searchTags(query, page: page, type: TagType.FREEFORM);
  }

  Widget _buildItems(BuildContext context, Tag tag, int index) {
    return ListTile(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(TagActivity.routeName, arguments: tag);
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      title: TagItem(tag: tag),
    );
  }
}
