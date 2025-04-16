/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/author_item.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/views/search/fragment_search_kind_common.dart';
import 'package:flutter/material.dart';

class AuthorSearchFragment extends StatelessWidget {
  static const String routeName = '/search/authors';
  const AuthorSearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonKindSearchFragment<Pseud>(
      fetcher: _fetchItems,
      itemBuilder: _buildItems,
    );
  }

  Future<List<Pseud>> _fetchItems(String query, int page) async {
    return await Ao3Api().searchUsers(query, page: page);
  }

  Widget _buildItems(BuildContext context, Pseud author, int index) {
    return ListTile(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   WorkActivity.routeName,
        //   arguments: work,
        // );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      title: AuthorItem.compact(author: author),
    );
  }
}
