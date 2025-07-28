import 'package:archiverse/components/discover_header.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_recommendations.dart';
import 'package:archiverse/recommendations/recommendation_base.dart';
import 'package:archiverse/views/activity_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class DiscoverFragment extends StatefulWidget {
  const DiscoverFragment({super.key});

  @override
  _DiscoverFragmentState createState() => _DiscoverFragmentState();
}

class _DiscoverFragmentState extends State<DiscoverFragment> {
  static const _pageSize = 5;
  late final PagingController<int, BaseRecommendation> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, BaseRecommendation>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );

    // Initialize recommendations provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecommendationsProvider>().initialize();
    });
  }

  Future<List<BaseRecommendation>> _fetchPage(int pageKey) async {
    final provider = context.read<RecommendationsProvider>();

    final result = await provider.getRecommendationsWithContext(pageKey);

    return [result];
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      appBar: (controller) => DiscoverHeader(
        controller: controller,
        onSearchTap: () =>
            context.navigator.pushNamed(SearchActivity.routeName),
      ),
      body: (controller) => BottomBar(
        scrollController: controller,
        curve: Curves.easeInOutCubicEmphasized,
        duration: Durations.medium1,
        offset: 16.0,
        iconWidth: 42.0,
        iconHeight: 42.0,
        iconDecoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.shadow.withAlpha(64),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        icon: (width, height) => Icon(
          TablerIcons.arrow_up,
          size: 22.0,
          color: context.theme.colorScheme.onPrimaryContainer,
        ),
        body: (context, controller) => RefreshIndicator(
          onRefresh: () async {
            await context.read<RecommendationsProvider>().refresh();
            _pagingController.refresh();
          },
          child: !context.watch<RecommendationsProvider>().isInitialized
              ? Center(child: CircularProgressIndicator())
              : context.watch<RecommendationsProvider>().hasHistory
              ? _buildRecommendations(controller)
              : _buildNoItemsIndicator(controller),
        ),
        child: SizedBox(),
      ),
    );
  }

  PagingListener<int, BaseRecommendation<dynamic>> _buildRecommendations(
    ScrollController controller,
  ) {
    return PagingListener<int, BaseRecommendation>(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedListView<int, BaseRecommendation>(
            scrollController: controller,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<BaseRecommendation>(
              itemBuilder: _buildItem,
              firstPageErrorIndicatorBuilder: (context) =>
                  _buildErrorIndicator(fetchNextPage),
              newPageErrorIndicatorBuilder: (context) =>
                  _buildErrorIndicator(fetchNextPage),
              firstPageProgressIndicatorBuilder: (context) =>
                  _buildLoadingIndicator(),
              newPageProgressIndicatorBuilder: (context) =>
                  _buildLoadingIndicator(),
              noItemsFoundIndicatorBuilder: (context) =>
                  _buildNoItemsIndicator(controller),
            ),
          ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    BaseRecommendation engine,
    int index,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: context.commonPadding,
        right: context.commonPadding,
        bottom: context.commonPadding,
      ),
      child: Column(
        children: [
          if (engine.hasHeader) ...[
            TextHeader.medium(
              title: engine.getWidgetTitle(context),
              icon: engine.widgetIcon,
              hasPadding: true,
            ),
          ],
          engine.build(context: context, items: engine.items),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(context.commonPaddingDouble),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorIndicator(VoidCallback onRetry) {
    return Padding(
      padding: context.horizontalPadding,
      child: LoadError.small(onPressed: onRetry),
    );
  }

  Widget _buildNoItemsIndicator(ScrollController controller) {
    return ListView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: context.horizontalPadding,
            child: ItemPlaceholder.medium(
              icon: TablerIcons.telescope,
              message: 'Welcome to Archiverse!',
              subtitle:
                  'Discover new works and authors by exploring recommendations tailored just for you. Start reading to see personalized suggestions here.',
            ),
          ),
        ),
      ],
    );
  }
}
