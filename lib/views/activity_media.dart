import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:archiverse/api.dart';
import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/media.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/lists/activity_tag_works.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MediaActivity extends CommonActivity {
  static const String routeName = '/media';
  final Media media;
  const MediaActivity({super.key, required this.media});

  @override
  State<MediaActivity> createState() => _MediaActivityState();
}

class _MediaActivityState extends State<MediaActivity> {
  Media get media => widget.media;
  late Future<List<AlphabetListViewItemGroup>> _groups;
  final TextEditingController _searchController = TextEditingController();
  List<Tag> _allTags = [];
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _groups = _fetchTags();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _searchQuery = _searchController.text;

    // Filter tags
    List<Tag> filtered = _allTags
        .where(
          (tag) => tag.name.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    setState(() {
      _groups = _buildGroupsFromTags(filtered);
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _searchQuery = '';
      _groups = _buildGroupsFromTags(_allTags);
    });
  }

  Future<List<AlphabetListViewItemGroup>> _fetchTags() async {
    List<Tag> tags = await AppApi().getTagsFromFandomType(media);
    _allTags = tags;
    return _buildGroupsFromTags(tags);
  }

  Future<List<AlphabetListViewItemGroup>> _buildGroupsFromTags(
    List<Tag> tags,
  ) async {
    List<AlphabetListViewItemGroup> groups = [];

    if (tags.isEmpty) {
      return groups;
    }

    // Filter tags based on search query
    List<Tag> filteredTags = tags;
    if (_searchQuery.isNotEmpty) {
      filteredTags = tags
          .where(
            (tag) => tag.localizedName.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ),
          )
          .toList();
    }

    if (filteredTags.isEmpty) {
      return groups;
    }

    // Alphabetically arrange tags
    filteredTags.sort((a, b) => a.localizedName.compareTo(b.localizedName));

    // Group tags by first letter
    String? currentLetter;
    List<Tag> currentGroup = [];
    for (final tag in filteredTags) {
      String firstLetter = tag.localizedName[0].toUpperCase();
      if (currentLetter != firstLetter) {
        if (currentGroup.isNotEmpty) {
          groups.add(
            AlphabetListViewItemGroup(
              tag: currentLetter!,
              children: currentGroup.map((t) => _buildListTile(t)).toList(),
            ),
          );
        }
        currentLetter = firstLetter;
        currentGroup = [tag];
      } else {
        currentGroup.add(tag);
      }
    }

    // Add the last group
    if (currentGroup.isNotEmpty) {
      groups.add(
        AlphabetListViewItemGroup(
          tag: currentLetter!,
          children: currentGroup.map((t) => _buildListTile(t)).toList(),
        ),
      );
    }

    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      appBar: (controller) => ExpressiveAppBar(
        controller: controller,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search fandoms',
                  border: InputBorder.none,
                  hintStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant.withOpacity(
                      0.7,
                    ),
                  ),
                ),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              )
            : Text(media.toLocalName(context)),
        leading: _isSearching
            ? IconButton(
                icon: Icon(TablerIcons.arrow_left),
                onPressed: _stopSearch,
              )
            : null,
        actions: _isSearching
            ? [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: Icon(TablerIcons.x),
                    onPressed: () {
                      _searchController.clear();
                      _onSearchChanged();
                    },
                  ),
              ]
            : [
                IconButton(
                  icon: Icon(TablerIcons.search),
                  onPressed: _startSearch,
                ),
              ],
      ),
      body: (controller) => EnhancedFutureBuilder(
        future: _groups,
        rememberFutureResult: false,
        whenDone: _buildList,
        whenError: (error) => LoadError(
          onPressed: () => setState(() {
            _groups = _fetchTags();
          }),
        ),
        whenNotDone: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildListTile(Tag tag) {
    if (!context.mounted) {
      return SizedBox.shrink();
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      visualDensity: VisualDensity.compact,
      title: Text(tag.name, style: context.textTheme.titleMedium),
      subtitle: Text(
        "${AppUtils.formatCompactNumber(tag.count)} works",
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.colorScheme.onSurfaceVariant,
      ),
      onTap: () => Navigator.of(
        context,
        rootNavigator: true,
      ).pushNamed(TagWorksActivity.routeName, arguments: tag),
    );
  }

  Widget _buildList(List<AlphabetListViewItemGroup> groups) {
    if (groups.isEmpty && _searchQuery.isNotEmpty) {
      return Center(
        child: ItemPlaceholder(
          icon: TablerIcons.search,
          message: 'No results found',
          subtitle: 'Try a different search term.',
        ),
      );
    }

    return AlphabetListView(
      items: groups,
      options: AlphabetListViewOptions(
        listOptions: ListOptions(listHeaderBuilder: _buildListHeader),
        scrollbarOptions: ScrollbarOptions(
          width: 28.0,
          mainAxisAlignment: MainAxisAlignment.center,
          symbolBuilder: _buildScrollbarSymbol,
        ),
        overlayOptions: OverlayOptions(overlayBuilder: _buildOverlay),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context, String symbol) {
    return Container(
      width: 72.0,
      height: 72.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        symbol,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }

  Widget _buildScrollbarSymbol(
    BuildContext context,
    String symbol,
    AlphabetScrollbarItemState state,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 2.0),
      child: Text(
        symbol,
        textAlign: TextAlign.center,
        style: context.textTheme.labelSmall?.copyWith(
          color: state == AlphabetScrollbarItemState.active
              ? context.colorScheme.onTertiaryContainer
              : context.colorScheme.onSurfaceVariant.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _buildListHeader(BuildContext context, String symbol) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        symbol,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}
