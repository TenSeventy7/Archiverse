import 'package:archiverse/components/continue_reading_card.dart';
import 'package:archiverse/components/discover_header.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_recommendations.dart';
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
  late final PagingController<int, RecommendationResult> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, RecommendationResult>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );

    // Initialize recommendations provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecommendationsProvider>().initialize();
    });
  }

  Future<List<RecommendationResult>> _fetchPage(int pageKey) async {
    final provider = context.read<RecommendationsProvider>();

    final result = await provider.getRecommendationsWithContext(
      pageKey: pageKey,
      pageSize: _pageSize,
    );

    return [result];
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
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

      body: (context, controller) => _buildScrollView(controller, context),
      child: SizedBox(),
    );
  }

  NestedScrollView _buildScrollView(
    ScrollController controller,
    BuildContext context,
  ) {
    return NestedScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          DiscoverHeader(
            onSearchTap: () =>
                context.navigator.pushNamed(SearchActivity.routeName),
          ),
        ];
      },
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<RecommendationsProvider>().refresh();
          _pagingController.refresh();
        },
        child: PagingListener<int, RecommendationResult>(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) =>
              PagedListView<int, RecommendationResult>(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate:
                    PagedChildBuilderDelegate<RecommendationResult>(
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
                          _buildNoItemsIndicator(),
                    ),
              ),
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    RecommendationResult result,
    int index,
  ) {
    // Handle continue reading card for pageKey 0
    if (result.isContinueReading) {
      return Padding(
        padding: context.horizontalPadding,
        child: ContinueReadingCard(),
      );
    }

    // Handle regular recommendation sections
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
      child: WorkSuggestions(
        works: result.works,
        loading: false,
        header: TextHeader.medium(
          title: result.getDisplayTitle(),
          icon: result.icon,
          hasPadding: true,
        ),
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

  Widget _buildNoItemsIndicator() {
    return Padding(
      padding: context.horizontalPadding,
      child: ItemPlaceholder.small(
        icon: Icons.search_off,
        message: 'No recommendations found',
        subtitle: 'Try reading some works to get personalized recommendations',
      ),
    );
  }
}
