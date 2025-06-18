import 'dart:async';

import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/mixins/mixin_common_paginated_list.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class CommonListActivity<T> extends CommonActivity {
  const CommonListActivity({super.key});

  @override
  CommonListActivityState<T> createState();
}

abstract class CommonListActivityState<T> extends State<CommonListActivity<T>>
    with CommonPaginatedListMixin<T> {
  // Abstract methods for extending classes to implement
  @override
  Future<List<T>> fetchItems(int page);
  Widget buildItemWidget(BuildContext context, T item, int index);
  void onItemTap(T item) => {}; // Optional callback for item tap
  Widget buildTitle(BuildContext context);

  // Optional overridable methods
  List<Widget>? buildAppBarActions(BuildContext context) => null;
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) => null;
  Widget? buildExpandedAppBarWidget(BuildContext context) => null;
  double? getExpandedHeight(BuildContext context) => null;
  Widget? buildSeparator(BuildContext context, int index) =>
      const Divider(height: 1);
  bool get isSelectable => true;

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

  void refreshList() {
    refreshPagination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, scrolled) => [_buildAppBar(context)],
        body: _buildList(context),
      ),
    );
  }

  EdgeInsets get padding =>
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0);

  Widget _buildItemWidget(BuildContext context, T item, int index) {
    if (!isSelectable) {
      return buildItemWidget(context, item, index);
    }

    return ListTile(
      title: buildItemWidget(context, item, index),
      contentPadding: padding,
      onTap: () => onItemTap(item),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final expandedHeight = getExpandedHeight(context);
    final expandedWidget = buildExpandedAppBarWidget(context);

    if (expandedHeight != null || expandedWidget != null) {
      return SliverAppBar.large(
        title: buildTitle(context),
        centerTitle: true,
        shape: const RoundedRectangleBorder(),
        expandedHeight: expandedHeight,
        actions: buildAppBarActions(context),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Directionality.of(context) == TextDirection.rtl
                ? TablerIcons.arrow_right
                : TablerIcons.arrow_left,
            size: 22.0,
          ),
        ),
        flexibleSpace: expandedWidget != null
            ? FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.commonPaddingDouble,
                      ),
                      child: expandedWidget,
                    ),
                    SizedBox(height: 8),
                    Divider(height: 1),
                  ],
                ),
              )
            : null,
        bottom: buildAppBarBottom(context),
      );
    } else {
      return SliverAppBar.medium(
        title: buildTitle(context),
        centerTitle: true,
        actions: buildAppBarActions(context),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Directionality.of(context) == TextDirection.rtl
                ? TablerIcons.arrow_right
                : TablerIcons.arrow_left,
            size: 22.0,
          ),
        ),
        bottom: buildAppBarBottom(context),
      );
    }
  }

  Widget _buildList(BuildContext context) {
    return PagingListener<int, T>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) {
        final separator = buildSeparator(context, 0);

        if (separator != null) {
          return PagedListView<int, T>.separated(
            state: state,
            fetchNextPage: fetchNextPage,
            padding: EdgeInsets.only(bottom: context.screenPadding.bottom),
            builderDelegate: PagedChildBuilderDelegate<T>(
              itemBuilder: _buildItemWidget,
              firstPageErrorIndicatorBuilder: (context) =>
                  LoadError(onPressed: () => pagingController.refresh()),
              newPageErrorIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: LoadError.small(onPressed: () => fetchNextPage()),
                ),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: (context) => const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: ItemPlaceholder(
                  message: 'Looks empty for now',
                  icon: TablerIcons.template,
                ),
              ),
            ),
            separatorBuilder: (context, index) => separator,
          );
        } else {
          return PagedListView<int, T>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<T>(
              itemBuilder: buildItemWidget,
              firstPageErrorIndicatorBuilder: (context) =>
                  LoadError(onPressed: () => pagingController.refresh()),
              newPageErrorIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: LoadError.small(onPressed: () => fetchNextPage()),
                ),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: (context) => const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: ItemPlaceholder(
                  message: 'Looks empty for now',
                  icon: TablerIcons.template,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
