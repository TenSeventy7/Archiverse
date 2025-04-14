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

import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommonSearchFragment<T> extends StatefulWidget {
  final Future<List<T>> Function(int) fetcher;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const CommonSearchFragment({
    super.key,
    required this.fetcher,
    required this.itemBuilder,
  });

  @override
  CommonSearchFragmentState<T> createState() => CommonSearchFragmentState<T>();
}

class CommonSearchFragmentState<T> extends State<CommonSearchFragment<T>> {
  final PagingController<int, T> _controller = PagingController(
    firstPageKey: 1,
  );
  final int _pageSize = 20; // Results on Ao3 are paginated by 20
  Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, T>.separated(
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
    _controller.addPageRequestListener((page) {
      _fetchItems(page);
    });
    super.initState();
  }

  Future<void> _fetchItems(int key) async {
    try {
      final items = await widget.fetcher(key);

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
