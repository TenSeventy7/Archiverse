import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Abstract base class for all search result sections
abstract class SearchResultSection<T> {
  /// Title displayed in the header
  final String title;

  /// Optional icon displayed in the header
  final IconData? icon;

  /// Route name for "See More" navigation
  final String routeName;

  /// Current loading state
  bool isLoading = true;

  /// Results data
  List<T> results = [];

  /// Key to force rebuilds when data changes
  final GlobalKey key = GlobalKey();

  SearchResultSection({
    required this.title,
    this.icon,
    required this.routeName,
  });

  /// Fetch data for this section from the API
  Future<void> fetchData(String query);

  /// Build the section widget with appropriate styling
  Widget buildSectionWidget(BuildContext context, VoidCallback onSeeMore);

  /// Get placeholder data for loading state
  List<T> getPlaceholderData();

  /// Navigate to detailed results screen
  void navigateToDetailedResults(BuildContext context, String query) {
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.navigateTo(routeName, arguments: query);
  }

  /// Create standard header with title and "More" action
  Widget buildHeader(BuildContext context, VoidCallback onSeeMore) {
    return TextHeader.medium(
      title: title,
      icon: icon,
      actionText: Text("More"),
      onTap: onSeeMore,
    );
  }
}
