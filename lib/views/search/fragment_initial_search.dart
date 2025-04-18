import 'package:archiverse/components/padded_divider.dart';
import 'package:archiverse/components/padded_wrap.dart';
import 'package:archiverse/components/search/recent_item.dart';
import 'package:archiverse/components/search/trending_tag.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialSearchFragment extends CommonStatelessSearchFragment {
  static const String routeName = 'search/';
  const InitialSearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent searches section
          TextHeader.medium(
            title: 'Recent Searches',
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),

          if (provider.recentSearches.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('No recent searches'),
            )
          else
            ...provider.recentSearches.map(
              (term) => RecentSearchItem(
                searchTerm: term,
                onTap: () => provider.performSearch(term),
                onRemove: () => provider.removeSearchItem(term),
              ),
            ),

          const SizedBox(height: 16.0),
          const PaddedDivider(padding: EdgeInsets.symmetric(horizontal: 16.0)),

          // Trending tags section
          TextHeader.medium(
            title: 'Trending Tags',
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          PaddedWrap(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            spacing: 8,
            runSpacing: 2,
            children:
                provider.trendingTags
                    .map(
                      (tag) => TrendingTagChip(
                        tag: tag,
                        onTap: () => provider.performSearch(tag),
                      ),
                    )
                    .toList(),
          ),

          // Add extra space at bottom
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
