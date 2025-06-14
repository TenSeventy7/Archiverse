import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class SearchSuggestionsFragment extends CommonStatelessSearchFragment {
  static const String routeName = 'search/suggestions/';
  const SearchSuggestionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeader.medium(icon: TablerIcons.bulb, title: 'Suggestions'),

            if (provider.suggestionsLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (provider.suggestions.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: ItemPlaceholder.small(
                  icon: TablerIcons.bulb,
                  message: 'No suggestions found',
                ),
              )
            else
              ...provider.suggestions.map(
                (suggestion) => _buildSuggestionItem(context, suggestion),
              ),

            // Search button for exact query
            if (provider.controller.text.isNotEmpty &&
                provider.suggestions.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutlinedButton.icon(
                  onPressed: () =>
                      provider.performSearch(provider.controller.text),
                  icon: const Icon(TablerIcons.search),
                  label: Text('Search for "${provider.controller.text}"'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionItem(BuildContext context, String suggestion) {
    final provider = Provider.of<SearchProvider>(context, listen: false);

    return ListTile(
      onTap: () => provider.performSearch(suggestion),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: const Icon(TablerIcons.search),
      title: Text(suggestion),
      trailing: IconButton(
        icon: const Icon(TablerIcons.arrow_up_right),
        onPressed: () => provider.performSearch(suggestion),
      ),
    );
  }
}
