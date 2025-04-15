/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/tag_item.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/views/search/fragment_search_kind_common.dart';
import 'package:flutter/material.dart';

class TagSearchFragment extends StatelessWidget {
  final String query;
  const TagSearchFragment({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return CommonSearchFragment<Tag>(
      fetcher: _fetchItems,
      itemBuilder: _buildItems,
    );
  }

  Future<List<Tag>> _fetchItems(int page) async {
    return await Ao3Api().searchTags(query, page: page);
  }

  Widget _buildItems(BuildContext context, Tag tag, int index) {
    return ListTile(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   WorkActivity.routeName,
        //   arguments: work,
        // );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      title: TagItem(tag: tag),
    );
  }
}
