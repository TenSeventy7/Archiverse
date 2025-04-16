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
    extends State<CommonKindSearchFragment<T>> {
  late SearchProvider _provider;
  final PagingController<int, T> _controller = PagingController(
    firstPageKey: 1,
  );
  final int _pageSize = 20; // Results on Ao3 are paginated by 20
  Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>.separated(
      pagingController: _controller,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: widget.itemBuilder,
      ),
      separatorBuilder:
          (BuildContext context, int index) => const Divider(height: 1),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addPageRequestListener((page) {
      _fetchItems(page);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = Provider.of<SearchProvider>(context);
  }

  Future<void> _fetchItems(int key) async {
    try {
      final items = await widget.fetcher(_provider.query, key);

      final isLastPage = items.length < _pageSize;
      if (isLastPage) {
        _controller.appendLastPage(items);
      } else {
        _controller.appendPage(items, key + 1);
      }

      // Complete the refresh operation if it's the first page
      if (key == 1) {
        _completer.complete();
        _completer = Completer<void>();
      }
    } catch (error) {
      _controller.error = error;
    }
  }
}
