import 'dart:async';

import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/inverse_rounded_rectangle_border.dart';
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
  void onItemLongPress(T item) => {}; // Optional callback for item long press
  Widget buildTitle(BuildContext context);

  // Optional overridable methods
  List<Widget>? buildAppBarActions(BuildContext context) => null;
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) => null;
  Widget? buildExpandedAppBarWidget(BuildContext context) => null;
  double? getExpandedHeight(BuildContext context) => null;
  Widget? buildSeparator(BuildContext context, int index) =>
      const SizedBox(height: 4.0);
  bool get isSelectable => true;

  final ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateAppBarOpacity);
    initializePagination();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateAppBarOpacity);
    disposePagination();
    _scrollController.dispose();
    super.dispose();
  }

  void refreshList() {
    refreshPagination();
  }

  void _updateAppBarOpacity() {
    // Adjust these values as needed for your design
    final double fadeStart = 0.0;
    final double fadeEnd = (getExpandedHeight(context) ?? 200) - kToolbarHeight;
    final double offset = _scrollController.hasClients
        ? _scrollController.offset
        : 0.0;
    double opacity = ((offset - fadeStart) / (fadeEnd - fadeStart)).clamp(
      0.0,
      1.0,
    );
    if (opacity != _appBarOpacity) {
      setState(() {
        _appBarOpacity = opacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(
        context.theme.colorScheme.surfaceContainer,
        context.theme.colorScheme.surfaceContainerHigh,
        _appBarOpacity,
      ),
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, scrolled) => [_buildAppBar(context)],
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: _buildList(context),
          ),
        ),
      ),
    );
  }

  EdgeInsets get padding =>
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);

  Widget _buildItemWidgetTitle(BuildContext context, T item, int index) {
    if (!isSelectable) {
      return buildItemWidget(context, item, index);
    }

    return ListTile(
      title: buildItemWidget(context, item, index),
      contentPadding: padding,
      onTap: () => onItemTap(item),
      onLongPress: () => onItemLongPress(item),
    );
  }

  Widget _buildItemWidget(BuildContext context, T item, int index) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: context.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(8.0),
      child: _buildItemWidgetTitle(context, item, index),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final expandedHeight = getExpandedHeight(context);
    final expandedWidget = buildExpandedAppBarWidget(context);

    if (expandedHeight != null || expandedWidget != null) {
      return SliverAppBar.large(
        title: buildTitle(context),
        titleTextStyle: context.theme.textTheme.titleMedium?.apply(
          fontSizeDelta: 5.0,
        ),
        titleSpacing: 8.0,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Color.lerp(
          context.theme.colorScheme.surfaceContainer,
          context.theme.colorScheme.surfaceContainerHigh,
          _appBarOpacity,
        ),
        shape: const InverseRoundedRectangleBorder(radius: 24.0),
        collapsedHeight: ExpressiveSliverAppBar.kToolbarHeight + 24.0,
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
                background: Container(
                  color: Color.lerp(
                    context.theme.colorScheme.surfaceContainer,
                    context.theme.colorScheme.surfaceContainerHigh,
                    _appBarOpacity,
                  ),
                  child: Column(
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
                    ],
                  ),
                ),
              )
            : null,
        bottom: buildAppBarBottom(context),
      );
    } else {
      return ExpressiveSliverAppBar.medium(
        title: buildTitle(context),
        centerTitle: true,
        actions: buildAppBarActions(context),
        unelevatedColor: context.theme.colorScheme.surfaceContainer,
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
