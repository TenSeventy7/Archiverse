import 'package:archiverse/api/ao3_api.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  bool _showClearButton = false;
  bool _isShowingResults = false;
  String _lastSubmittedQuery = "";
  List<String> _suggestions = [];
  bool _isProgrammaticTextChange = false;
  bool _suggestionsLoading = false;

  // Mock data - replace with actual storage later
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
  bool get showClearButton => _showClearButton;
  bool get isShowingResults => _isShowingResults;
  bool get suggestionsLoading => _suggestionsLoading;
  String get lastSubmittedQuery => _lastSubmittedQuery;
  List<String> get suggestions => _suggestions;
  List<String> get recentSearches => _recentSearches;
  List<String> get trendingTags => _trendingTags;

  SearchProvider() {
    searchController.addListener(() {
      // Skip listener logic if we're programmatically changing text
      if (_isProgrammaticTextChange) return;

      _showClearButton = searchController.text.isNotEmpty;
      if (searchController.text.isNotEmpty) {
        _isShowingResults = false;
        _updateSuggestions(searchController.text);
      } else {
        _suggestions = [];
      }
      notifyListeners();
    });
  }

  void performSearch(String query) {
    _isShowingResults = true;
    _lastSubmittedQuery = query;

    // Set flag before changing text
    _isProgrammaticTextChange = true;
    searchController.text = query;

    // Reset flag after changing text
    _isProgrammaticTextChange = false;

    // Add to recent searches (avoid duplicates)
    if (!_recentSearches.contains(query)) {
      _recentSearches.insert(0, query);
      // Keep list to a reasonable size
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
    }

    notifyListeners();
    print('Searching for: $query');
  }

  void clearSearch() {
    searchController.clear();
    searchFocusNode.requestFocus();
    notifyListeners();
  }

  void removeSearchItem(String item) {
    _recentSearches.remove(item);
    notifyListeners();
  }

  void _updateSuggestions(String input) async {
    // Don't fetch suggestions if the input is empty
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
      List<String> apiSuggestions = await Ao3Api().getAutocompleteSuggestions(
        input,
      );

      // Only update if the input is still relevant
      if (searchController.text == input) {
        _suggestions = apiSuggestions;

        // If we get no suggestions from the API, just show nothing
        if (_suggestions.isEmpty) {
          _suggestions = [];
        }
      }
    } catch (e) {
      // On error, use fallback suggestions
      _suggestions = [];
      print('Error fetching suggestions: $e');
    } finally {
      // Clear loading state and notify
      _suggestionsLoading = false;

      // Check if the widget is still mounted before notifying
      // This is a safe practice when dealing with async operations
      try {
        notifyListeners();
      } catch (e) {
        // This will catch errors if the provider has been disposed
        print('Could not update suggestions - provider already disposed');
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
