import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:archiverse/api/ao3_api.dart';
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

  @override
  void initState() {
    super.initState();
    _groups = _fetchTags();
  }

  Future<List<AlphabetListViewItemGroup>> _fetchTags() async {
    List<AlphabetListViewItemGroup> groups = [];
    List<Tag> tags = await Ao3Api().getTagsFromFandomType(media);

    if (tags.isEmpty) {
      return groups;
    }

    // Alphabetically arrange tags
    tags.sort((a, b) => a.name.compareTo(b.name));

    // Group tags by first letter
    String? currentLetter;
    List<Tag> currentGroup = [];
    for (final tag in tags) {
      String firstLetter = tag.name[0].toUpperCase();
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

    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(media.toLocalName(context)),
        centerTitle: true,
      ),
      body: EnhancedFutureBuilder(
        future: _groups,
        rememberFutureResult: true,
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
        borderRadius: BorderRadius.circular(8.0),
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
