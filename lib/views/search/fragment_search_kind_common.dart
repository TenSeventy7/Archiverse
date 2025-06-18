/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * A common fragment for search fragments of different types.
 * This is extended by i.e. SearchWorksFragment, SearchUsersFragment, etc.
 * so that they can share common code.
 */

import 'dart:async';

import 'package:archiverse/mixins/mixin_common_paginated_list.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CommonKindSearchFragment<T> extends CommonSearchFragment {
  final Future<List<T>> Function(String, int) fetcher;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const CommonKindSearchFragment({
    super.key,
    required this.fetcher,
    required this.itemBuilder,
  });

  @override
  CommonKindSearchFragmentState<T> createState() =>
      CommonKindSearchFragmentState<T>();
}

class CommonKindSearchFragmentState<T>
    extends State<CommonKindSearchFragment<T>>
    with CommonPaginatedListMixin<T> {
  late SearchProvider _provider;

  @override
  Future<List<T>> fetchItems(int page) async {
    return await widget.fetcher(_provider.query, page);
  }

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, T>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedListView<int, T>.separated(
            padding: EdgeInsets.zero,
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<T>(
              itemBuilder: widget.itemBuilder,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1),
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializePagination();
  }

  @override
  void dispose() {
    disposePagination();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = Provider.of<SearchProvider>(context);
  }
}
