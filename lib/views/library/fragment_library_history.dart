import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:archiverse/providers/provider_read_history.dart';
import 'package:archiverse/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class LibraryHistoryFragment extends StatefulWidget {
  const LibraryHistoryFragment({super.key, this.controller});
  final ScrollController? controller;

  @override
  State<LibraryHistoryFragment> createState() => _LibraryHistoryFragmentState();
}

class _LibraryHistoryFragmentState extends State<LibraryHistoryFragment> {
  late final PagingController<int, Map<int, List<ReadHistory>>> _controller;

  @override
  void initState() {
    super.initState();
    _controller = PagingController<int, Map<int, List<ReadHistory>>>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<List<Map<int, List<ReadHistory>>>> _fetchPage(int pageKey) async {
    final provider = context.read<ReadHistoryProvider>();
    final newItems = await provider.loadPaginatedGroupedHistory(
      offset: pageKey - 1,
    );

    // Check if we have more history beyond this point
    final hasMore = await provider.hasMoreHistory(pageKey - 1);

    if (!hasMore) {
      _controller.value = _controller.value.copyWith(hasNextPage: false);

      if (newItems.values.first.isEmpty) {
        // If no items were returned, we can return an empty list
        return [];
      }
    }

    return [newItems];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadHistoryProvider>(
      builder: (context, provider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await provider.refresh();
            _controller.refresh();
          },
          child: PagingListener<int, Map<int, List<ReadHistory>>>(
            controller: _controller,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Map<int, List<ReadHistory>>>(
                  scrollController: widget.controller,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate:
                      PagedChildBuilderDelegate<Map<int, List<ReadHistory>>>(
                        itemBuilder: (context, item, index) =>
                            _buildHistoryItem(index, item.values.first),
                        firstPageErrorIndicatorBuilder: (context) =>
                            _buildErrorIndicator(fetchNextPage),
                        newPageErrorIndicatorBuilder: (context) =>
                            _buildErrorIndicator(fetchNextPage),
                        firstPageProgressIndicatorBuilder: (context) =>
                            _buildLoadingIndicator(),
                        newPageProgressIndicatorBuilder: (context) =>
                            _buildLoadingIndicator(),
                        noItemsFoundIndicatorBuilder: (context) =>
                            _buildEmptyState(),
                      ),
                ),
          ),
        );
      },
    );
  }

  Widget _buildHistoryItem(int offset, List<ReadHistory> history) {
    if (history.isEmpty) {
      return const SizedBox.shrink();
    }

    // Get date from today to offset
    DateTime date = DateTime.now().toUtc();
    date = DateTime.utc(date.year, date.month, date.day);
    date = date.subtract(Duration(days: offset));

    return Column(
      children: [
        TextHeader.medium(title: AppUtils.formatDateTight(context, date)),

        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
          clipBehavior: Clip.hardEdge,
          margin: context.horizontalPadding,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: history.length,
            itemBuilder: (context, index) {
              ReadHistory readHistory = history[index];
              return WorkCard(work: readHistory.work);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 4.0),
          ),
        ),

        SizedBox(height: context.commonPadding),
      ],
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
      child: LoadError.small(onPressed: onRetry),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsetsGeometry.all(24.0),
      child: ItemPlaceholder.small(
        icon: TablerIcons.history,
        message: "No reading history yet",
        subtitle: "Start reading some works to see your history here",
      ),
    );
  }
}
