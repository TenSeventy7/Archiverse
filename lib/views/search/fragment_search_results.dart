import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResultsFragment extends StatefulWidget {
  final String query;

  const SearchResultsFragment({Key? key, required this.query})
    : super(key: key);

  @override
  State<SearchResultsFragment> createState() => _SearchResultsFragmentState();
}

class _SearchResultsFragmentState extends State<SearchResultsFragment> {
  final PagingController<int, Work> _pagingController = PagingController(
    firstPageKey: 1,
  );
  final int _pageSize = 20; // AO3's default page size

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  @override
  void didUpdateWidget(SearchResultsFragment oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query) {
      _pagingController.refresh();
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final works = await Ao3Api().searchWorks(widget.query, page: pageKey);

      final isLastPage = works.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(works);
      } else {
        _pagingController.appendPage(works, pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        TablerIcons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Results for "${widget.query}"',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Results list
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            sliver: PagedSliverList<int, Work>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Work>(
                itemBuilder:
                    (context, work, index) => _buildWorkItem(context, work),
                firstPageErrorIndicatorBuilder:
                    (context) => _buildErrorWidget(),
                noItemsFoundIndicatorBuilder: (context) => _buildEmptyWidget(),
                newPageErrorIndicatorBuilder:
                    (context) => _buildPageErrorWidget(),
                firstPageProgressIndicatorBuilder:
                    (context) => _buildLoadingWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkItem(BuildContext context, Work work) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: WorkCard(work: work),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(TablerIcons.alert_circle, size: 48),
            const SizedBox(height: 16),
            Text(
              'Could not load search results',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pagingController.refresh(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageErrorWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Error loading more results'),
          ElevatedButton(
            onPressed: () => _pagingController.retryLastFailedRequest(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(TablerIcons.mood_empty, size: 48),
            const SizedBox(height: 16),
            Text(
              'No results found for "${widget.query}"',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search terms',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
