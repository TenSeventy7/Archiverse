import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/padded_divider.dart';
import 'package:archiverse/components/padded_wrap.dart';
import 'package:archiverse/components/search/recent_item.dart';
import 'package:archiverse/components/search/trending_tag.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/media.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/lists/activity_tag_works.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
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
          TextHeader.medium(title: 'Recent Searches', icon: Icons.history),

          if (provider.recentSearches.isEmpty)
            ItemPlaceholder.small(
              icon: TablerIcons.history,
              message: 'Your recent search terms will appear here.',
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
          const PaddedDivider(padding: EdgeInsets.symmetric(horizontal: 8.0)),

          // Trending tags section
          TextHeader.medium(icon: TablerIcons.arrows_random, title: 'Fandoms'),
          if (provider.isFandomsError) ...[
            LoadError.small(onPressed: () => provider.loadTopFandoms()),
          ] else if (provider.isFandomsLoading) ...[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ] else if (provider.fandoms.isEmpty) ...[
            ItemPlaceholder.small(
              icon: TablerIcons.arrows_random,
              message: 'No trending fandoms found.',
            ),
          ] else
            ..._buildTopFandomsWidgets(context, provider),

          // Add extra space at bottom
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  List<Widget> _buildTopFandomsWidgets(
    BuildContext context,
    SearchProvider provider,
  ) {
    return provider.fandoms.entries.map((entry) {
      Media media = entry.key;
      List<Tag> tags = entry.value;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: _buildFandomWidget(context, media, tags),
      );
    }).toList();
  }

  Widget _buildFandomWidget(BuildContext context, Media media, List<Tag> tags) {
    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            tileColor: context.colorScheme.surfaceContainerHigh,
            leading: Icon(
              media.icon,
              color: context.colorScheme.onSurfaceVariant,
            ),
            title: Text(
              media.toLocalName(context),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(
            height: 1,
            color: context.colorScheme.outlineVariant.withOpacity(0.3),
          ),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tags.length + 1,
            itemBuilder: (context, index) => index == tags.length
                ? _buildSeeMoreTile(context, media)
                : ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      tags[index].name,
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "${AppUtils.formatCompactNumber(tags[index].count)} works",
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      TablerIcons.chevron_right,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    onTap: () =>
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          TagWorksActivity.routeName,
                          arguments: tags[index],
                        ),
                  ),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: context.colorScheme.outlineVariant.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  _buildSeeMoreTile(BuildContext context, Media media) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      visualDensity: VisualDensity.compact,
      title: Text('See all', style: context.textTheme.titleMedium),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.colorScheme.onSurfaceVariant,
      ),
      onTap: () => Navigator.of(
        context,
      ).pushNamed(TagWorksActivity.routeName, arguments: media),
    );
  }
}
