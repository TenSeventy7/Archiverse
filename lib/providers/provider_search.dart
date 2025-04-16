import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/views/search/fragment_author_results.dart';
import 'package:archiverse/views/search/fragment_character_results.dart';
import 'package:archiverse/views/search/fragment_fandom_results.dart';
import 'package:archiverse/views/search/fragment_initial_search.dart';
import 'package:archiverse/views/search/fragment_relationship_results.dart';
import 'package:archiverse/views/search/fragment_search_results.dart';
import 'package:archiverse/views/search/fragment_search_suggestions.dart';
import 'package:archiverse/views/search/fragment_tag_results.dart';
import 'package:archiverse/views/search/fragment_work_results.dart';
import 'package:flutter/material.dart';

/// Routes configuration for search navigation
class _SearchRoutes {
  static final Map<String, Widget> routes = {
    InitialSearchFragment.routeName: const InitialSearchFragment(),
    SearchResultsFragment.routeName: const SearchResultsFragment(),
    WorkSearchFragment.routeName: const WorkSearchFragment(),
    AuthorSearchFragment.routeName: const AuthorSearchFragment(),
    TagSearchFragment.routeName: const TagSearchFragment(),
    FandomSearchFragment.routeName: const FandomSearchFragment(),
    CharacterSearchFragment.routeName: const CharacterSearchFragment(),
    RelationshipSearchFragment.routeName: const RelationshipSearchFragment(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Widget? route = routes[settings.name];
    if (route == null) return null;

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => route,
      maintainState: true,
    );
  }
}

/// Provider that manages search state and navigation
class SearchProvider extends ChangeNotifier {
  // Navigation constants
  static const int _initialLevel = 0;
  static const int _resultsLevel = 1;

  // Navigation
  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
  int _currentRouteLevel = 0;

  // Text input
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool _isProgrammaticTextChange = false;

  // Search state
  String _query = "";
  bool _isShowingSuggestions = false;
  bool _suggestionsLoading = false;
  List<String> _suggestions = [];

  // History and trending data
  final List<String> _recentSearches = [
    'Harry Potter fanfiction',
    'Enemies to lovers',
    'Star Wars AU',
  ];

  final List<String> _trendingTags = [
    'Fluff',
    'Angst',
    'Slow Burn',
    'Enemies to Lovers',
    'Hurt/Comfort',
    'Alternate Universe',
  ];

  // Getters
  bool get showClearButton => controller.text.isNotEmpty;
  bool get isShowingSuggestions => _isShowingSuggestions;
  bool get isShowingResults => _currentRouteLevel > _initialLevel;
  bool get isShowingDetailedResults =>
      _currentRouteLevel > _resultsLevel &&
      navigator.currentState?.canPop() == true;

  bool get suggestionsLoading => _suggestionsLoading;
  String get query => _query;
  List<String> get suggestions => _suggestions;
  List<String> get recentSearches => _recentSearches;
  List<String> get trendingTags => _trendingTags;

  /// Creates a new SearchProvider and sets up listeners
  SearchProvider() {
    controller.addListener(_onTextChanged);
  }

  /// Handles text input changes
  void _onTextChanged() {
    // Skip listener logic if we're programmatically changing text
    if (_isProgrammaticTextChange) return;

    if (controller.text.isNotEmpty) {
      _isShowingSuggestions = true;
      _updateSuggestions(controller.text);
    } else {
      _isShowingSuggestions = false;
      _suggestions = [];
    }
    notifyListeners();
  }

  /// Updates the query without triggering the text listener
  void _setQuery(String query) {
    _isProgrammaticTextChange = true;
    controller.text = query;
    _query = query;
    _isProgrammaticTextChange = false;
  }

  /// Performs a search with the given query
  void performSearch(String query) {
    _isShowingSuggestions = false;
    _setQuery(query);
    notifyListeners();

    // Unfocus the text field
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }

    // Add to recent searches (avoid duplicates)
    if (!_recentSearches.contains(query)) {
      _recentSearches.insert(0, query);
      // Keep list to a reasonable size
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
    }

    // Navigate based on current state
    if (!isShowingResults) {
      navigateTo(SearchResultsFragment.routeName);
    } else if (isShowingDetailedResults) {
      navigateBackToResults();
    }
  }

  /// Clears the search and returns to initial state
  void clear() {
    controller.clear();
    _query = "";
    focusNode.requestFocus();
    notifyListeners();
    navigateToInitial();
  }

  /// Removes a search item from history
  void removeSearchItem(String item) {
    _recentSearches.remove(item);
    notifyListeners();
  }

  /// Fetches autocomplete suggestions for the input
  void _updateSuggestions(String input) async {
    if (input.isEmpty) {
      _suggestions = [];
      notifyListeners();
      return;
    }

    // Set loading state
    _suggestionsLoading = true;
    notifyListeners();

    try {
      // Get suggestions from the API
      final apiSuggestions = await Ao3Api().getAutocompleteSuggestions(input);

      // Only update if the input is still relevant
      if (controller.text == input) {
        _suggestions = apiSuggestions;
      }
    } catch (e) {
      _suggestions = [];
    } finally {
      _suggestionsLoading = false;

      try {
        notifyListeners();
      } catch (_) {
        // Handle case where provider is disposed
      }
    }
  }

  /// Navigates to the initial search screen
  void navigateToInitial() {
    _currentRouteLevel = _initialLevel;
    navigator.currentState?.popUntil((route) {
      return route.settings.name == InitialSearchFragment.routeName;
    });
  }

  /// Navigates back to results screen from detailed results
  void navigateBackToResults() {
    if (_currentRouteLevel > _resultsLevel) {
      _currentRouteLevel = _resultsLevel;
      navigator.currentState?.popUntil((route) {
        return route.settings.name == SearchResultsFragment.routeName;
      });
    }
  }

  /// Navigates to a specific route
  void navigateTo(String route, {Object? arguments}) {
    _currentRouteLevel++;
    navigator.currentState?.pushNamed(route, arguments: arguments);
  }

  /// Handles back navigation
  void pop() {
    if (_currentRouteLevel == 1) {
      // Clear the query when going back to the initial search
      _setQuery("");
      notifyListeners();
    }

    if (_currentRouteLevel > 0) {
      _currentRouteLevel--;
    }

    navigator.currentState?.pop();
  }

  /// Generates routes for the nested navigator
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return _SearchRoutes.onGenerateRoute(settings);
  }

  @override
  void dispose() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
