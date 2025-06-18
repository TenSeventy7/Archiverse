/*
 * (C) 2025, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * A common mixin used for paginated lists in this application.
 */

import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin CommonPaginatedListMixin<T> {
  late final PagingController<int, T> _pagingController;
  List<T> _lastItems = [];
  bool _hasNextPage = true;
  Completer<void> _completer = Completer<void>();

  int get pageSize => 20;
  bool get hasNextPageInternal => _hasNextPage;
  bool get hasNextPage => _hasNextPage;
  int get itemsCount => _pagingController.items?.length ?? 0;

  // Abstract method to be implemented by classes using this mixin
  Future<List<T>> fetchItems(int page);

  void initializePagination() {
    _pagingController = PagingController<int, T>(
      getNextPageKey: (state) {
        if (!hasNextPage) return null;
        return (state.keys?.last ?? 0) + 1;
      },
      fetchPage: (pageKey) => _fetchPaginatedItems(pageKey),
    );
  }

  Future<List<T>> _fetchPaginatedItems(int page) async {
    // Return empty list if it's the last page
    if (!hasNextPage) return [];

    try {
      final items = await fetchItems(page);

      // Complete the refresh operation if it's the first page
      if (page == 1) {
        _completer.complete();
        _completer = Completer<void>();
      }

      // There'd be instances where the last page would have the same count as that
      // of a full page, which makes the pagination logic tricky as it would assume
      // that there are more pages to fetch, especially since the API will return
      // the same last list of items fetched for pages queried after what is supposed
      // to be the last page.
      //
      // To handle this, we can infer if the items fetched are the same as the last
      // items fetched. If they are, we can assume that there are no more items to fetch.
      final isSameItems =
          _lastItems.isNotEmpty &&
          items.length == _lastItems.length &&
          items.every((item) => _lastItems.contains(item));

      // For other instances, we can assume that the last page is reached
      // if the number of items fetched is less than the page size or if the items.length is zero.
      final isLastPage =
          items.length < pageSize || items.isEmpty || isSameItems;

      // Update the paging controller with the new items
      _hasNextPage = !isLastPage;

      if (isSameItems) {
        // If the items are the same, we don't need to update the controller
        _lastItems.clear(); // Clear last items to clean up memory
        return [];
      }

      if (!isLastPage) {
        _lastItems = items;
      }

      return items;
    } catch (error) {
      // Complete the refresh operation even on error if it's the first page
      if (page == 1) {
        _completer.completeError(error);
        _completer = Completer<void>();
      }
      rethrow;
    }
  }

  PagingController<int, T> get pagingController => _pagingController;

  void refreshPagination() {
    _hasNextPage = true;
    _lastItems.clear();
    _pagingController.refresh();
  }

  void disposePagination() {
    _pagingController.dispose();
  }
}
