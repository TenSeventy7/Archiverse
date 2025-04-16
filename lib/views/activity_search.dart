import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/search/bottom_sheet_filter.dart';
import 'package:archiverse/views/search/fragment_initial_search.dart';
import 'package:archiverse/views/search/fragment_search_suggestions.dart';

/// Search activity that displays the search interface with various fragments.
/// This is the main entry point for search functionality in the app.
class SearchActivity extends CommonActivity {
  static const String routeName = '/search';

  const SearchActivity({super.key});

  @override
  State<SearchActivity> createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  /// Provider that manages search state and navigation
  late final SearchProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = SearchProvider();

    // Focus the search field when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<SearchProvider>(
        builder: (context, provider, _) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (didPop) return;
              _handleBackNavigation();
            },
            child: _buildScaffold(provider),
          );
        },
      ),
    );
  }

  /// Builds the main scaffold with app bar and body
  Widget _buildScaffold(SearchProvider provider) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(provider),
      body: _buildBody(provider),
    );
  }

  /// Builds the app bar with search field and actions
  AppBar _buildAppBar(SearchProvider provider) {
    return AppBar(
      title: TextField(
        controller: provider.controller,
        focusNode: provider.focusNode,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: 'Search for works and more',
          border: InputBorder.none,
        ),
        onSubmitted: provider.performSearch,
      ),
      actions: [
        if (provider.showClearButton)
          IconButton(
            icon: const Icon(TablerIcons.x),
            onPressed: provider.clear,
            tooltip: 'Clear search',
          ),
        IconButton(
          icon: const Icon(TablerIcons.filter),
          onPressed: _showFilterSheet,
          tooltip: 'Filter results',
        ),
      ],
    );
  }

  /// Builds the body containing the navigator and suggestions overlay
  Widget _buildBody(SearchProvider provider) {
    return Stack(
      children: [
        // Main navigator containing search results and detail screens
        Navigator(
          key: provider.navigator,
          initialRoute: InitialSearchFragment.routeName,
          onGenerateRoute: provider.onGenerateRoute,
        ),

        // Suggestions overlay - only visible when typing
        if (provider.isShowingSuggestions) const SearchSuggestionsFragment(),
      ],
    );
  }

  /// Handles back button navigation based on current state
  void _handleBackNavigation() {
    if (_provider.navigator.currentState?.canPop() ?? false) {
      _provider.pop();
    } else {
      Navigator.of(context).pop();
    }
  }

  /// Shows the filter bottom sheet
  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FilterBottomSheet(),
    );
  }
}
