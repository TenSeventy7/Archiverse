import 'package:archiverse/api.dart';
import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LibraryHistoryTab extends StatefulWidget {
  const LibraryHistoryTab({Key? key}) : super(key: key);

  @override
  State<LibraryHistoryTab> createState() => _LibraryHistoryTabState();
}

class _LibraryHistoryTabState extends State<LibraryHistoryTab> {
  final AppApi _api = AppApi();
  late final PagingController<int, Map<String, dynamic>> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, Map<String, dynamic>>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> _fetchPage(int pageKey) async {
    final newItems = await _api.getPaginatedGroupedHistory(offset: pageKey - 1);

    if (newItems.isEmpty) {
      _pagingController.value = _pagingController.value.copyWith(
        hasNextPage: false,
      );
    }

    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: PagingListener<int, Map<String, dynamic>>(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, Map<String, dynamic>>(
              physics: const BouncingScrollPhysics(),
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<Map<String, dynamic>>(
                itemBuilder: (context, item, index) => _buildHistoryGroup(item),
                firstPageErrorIndicatorBuilder: (context) =>
                    _buildErrorIndicator(fetchNextPage),
                newPageErrorIndicatorBuilder: (context) =>
                    _buildErrorIndicator(fetchNextPage),
                firstPageProgressIndicatorBuilder: (context) =>
                    _buildLoadingIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                    _buildLoadingIndicator(),
                noItemsFoundIndicatorBuilder: (context) => _buildEmptyState(),
              ),
            ),
      ),
    );
  }

  Widget _buildHistoryGroup(Map<String, dynamic> groupData) {
    final String groupName = groupData['group'] as String;
    final List<ReadHistory> items = groupData['items'] as List<ReadHistory>;

    return Padding(
      padding: context.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.medium(title: groupName),
          const SizedBox(height: 8),
          ...items.map(
            (history) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: WorkCard(work: history.work),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorIndicator(VoidCallback onRetry) {
    return Padding(
      padding: context.horizontalPadding,
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Something went wrong',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: context.horizontalPadding,
      child: const Column(
        children: [
          Icon(Icons.history, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No reading history yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start reading some works to see your history here',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onWorkTap(ReadHistory history) {
    // Navigate to work reader with the saved position
    // You can implement this based on your navigation structure
    print(
      'Tapped work: ${history.work.title} at ${history.completion * 100}% completion',
    );
  }
}
