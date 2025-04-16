/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/views/search/fragment_search_kind_common.dart';
import 'package:flutter/material.dart';

class WorkSearchFragment extends StatelessWidget {
  static const String routeName = '/search/works';
  const WorkSearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonKindSearchFragment<Work>(
      fetcher: _fetchItems,
      itemBuilder: _buildItems,
    );
  }

  Future<List<Work>> _fetchItems(String query, int page) async {
    return await Ao3Api().searchWorks(query, page: page);
  }

  Widget _buildItems(BuildContext context, Work work, int index) {
    return ListTile(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   WorkActivity.routeName,
        //   arguments: work,
        // );
      },
      onLongPress: () {
        WorkOptionsDialog.showSheet(context, work: work);
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      title: WorkItem(work: work),
    );
  }
}
