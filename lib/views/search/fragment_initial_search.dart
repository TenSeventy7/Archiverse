import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/search/recent_item.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/media.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_media.dart';
import 'package:archiverse/views/lists/activity_tag_works.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class InitialSearchFragment extends CommonStatelessSearchFragment {
  static const String routeName = 'search/';
  const InitialSearchFragment({super.key, this.controller});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return SingleChildScrollView(
      controller: controller,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  spacing: 4.0,
                  children: provider.recentSearches
                      .map(
                        (term) => RecentSearchItem(
                          searchTerm: term,
                          onTap: () => provider.performSearch(term),
                          onRemove: () => provider.removeSearchItem(term),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

          const SizedBox(height: 16.0),

          // Trending tags section
          TextHeader.medium(icon: TablerIcons.books, title: 'Popular Fandoms'),
          if (provider.isFandomsError) ...[
            LoadError.small(onPressed: () => {provider.refreshTopFandoms()}),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeader.medium(
          leading: Icon(
            media.icon,
            color: context.colorScheme.onSurfaceVariant,
          ),
          title: media.toLocalName(context),
          hasPadding: false,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),

        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
          clipBehavior: Clip.hardEdge,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: tags.length + 1,
            itemBuilder: (context, index) => index == tags.length
                ? _buildSeeMoreTile(context, media)
                : ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    tileColor: context.colorScheme.surfaceContainerLowest,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 2.0,
                    ),
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      tags[index].name,
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: _buildWorksCount(media, tags, index, context),
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
            separatorBuilder: (context, index) => SizedBox(height: 4.0),
          ),
        ),
      ],
    );
  }

  Widget? _buildWorksCount(
    Media media,
    List<Tag> tags,
    int index,
    BuildContext context,
  ) {
    if (media == Media.UNCATEGORIZED) {
      // AO3 does not support showing works count for uncategorized tags
      return null;
    }

    return Text(
      "${AppUtils.formatCompactNumber(tags[index].count)} works",
      style: context.textTheme.titleSmall?.copyWith(
        color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
      ),
    );
  }

  Widget _buildSeeMoreTile(BuildContext context, Media media) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      tileColor: context.colorScheme.surfaceContainerLowest,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 2.0,
      ),
      visualDensity: VisualDensity.compact,
      title: Text('See all', style: context.textTheme.titleMedium),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.colorScheme.onSurfaceVariant,
      ),
      onTap: () => Navigator.of(
        context,
        rootNavigator: true,
      ).pushNamed(MediaActivity.routeName, arguments: media),
    );
  }
}
