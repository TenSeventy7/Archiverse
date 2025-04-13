import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/search/bottom_sheet_filter.dart';
import 'package:archiverse/views/search/fragment_initial_search.dart';
import 'package:archiverse/views/search/fragment_search_results.dart';
import 'package:archiverse/views/search/fragment_search_suggestions.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class SearchActivity extends CommonActivity {
  static const String routeName = '/search';
  const SearchActivity({super.key});

  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  late SearchProvider _searchProvider;

  @override
  void initState() {
    super.initState();
    _searchProvider = SearchProvider();

    // Focus the search field when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchProvider.searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _searchProvider,
      child: Consumer<SearchProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: TextField(
                controller: provider.searchController,
                focusNode: provider.searchFocusNode,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search for works and more',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  provider.performSearch(provider.searchController.text);
                },
              ),
              actions: [
                if (provider.showClearButton)
                  IconButton(
                    icon: const Icon(TablerIcons.x),
                    onPressed: provider.clearSearch,
                    tooltip: 'Clear search',
                  ),
                IconButton(
                  icon: const Icon(TablerIcons.filter),
                  onPressed: () => _showFilterSheet(),
                  tooltip: 'Filter results',
                ),
              ],
            ),
            body: SafeArea(child: _buildContent(provider)),
          );
        },
      ),
    );
  }

  Widget _buildContent(SearchProvider provider) {
    if (provider.searchController.text.isEmpty) {
      // Keep ScrollView for the initial/empty state
      return SingleChildScrollView(child: const InitialSearchFragment());
    } else if (!provider.isShowingResults) {
      // Keep ScrollView for suggestions
      return SingleChildScrollView(child: const SearchSuggestionsFragment());
    } else {
      return SearchResultsFragment(query: provider.lastSubmittedQuery);
    }
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FilterBottomSheet(),
    );
  }
}
