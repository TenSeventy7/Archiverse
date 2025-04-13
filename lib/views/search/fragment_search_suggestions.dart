import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class SearchSuggestionsFragment extends StatelessWidget {
  const SearchSuggestionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeader.medium(
          title: 'Suggestions',
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),

        if (provider.suggestionsLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (provider.suggestions.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text('No suggestions available'),
          )
        else
          ...provider.suggestions.map(
            (suggestion) => _buildSuggestionItem(context, suggestion),
          ),

        // Search button for exact query
        if (provider.searchController.text.isNotEmpty &&
            provider.suggestions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed:
                  () => provider.performSearch(provider.searchController.text),
              icon: const Icon(TablerIcons.search),
              label: Text('Search for "${provider.searchController.text}"'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
              ),
            ),
          ),
      ],
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
