import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/item_placeholder.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/components/padded_column.dart';
import 'package:archiverse/components/suggestions/bookmark_suggestions.dart';
import 'package:archiverse/components/suggestions/tag_bookmark_suggestions.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/bookmark.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/tag_bookmark.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_common_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TagActivity extends CommonDetailActivity<Tag> {
  static const String routeName = "/detail/tag/";

  const TagActivity({super.key, required Tag tag}) : super(item: tag);

  @override
  TagDetailState createState() => TagDetailState();
}

class TagDetailState extends CommonDetailActivityState<Tag> {
  TagDetailState() : super(Fillers.tag);

  // Content sections
  List<Work>? _works;
  List<TagBookmark>? _bookmarks;

  // Loading states
  LoadingState _worksState = LoadingState.LOADING;
  LoadingState _bookmarksState = LoadingState.LOADING;

  // Expansion states for tag sections
  bool _parentsExpanded = false;
  bool _childrenExpanded = false;
  bool _synonymsExpanded = false;
  bool _mergersExpanded = false;
  bool _subtagsExpanded = false;

  @override
  void onItemLoaded() {
    _fetchWorks();
    _fetchBookmarks();
  }

  Future<void> _fetchWorks() async {
    setState(() {
      _worksState = LoadingState.LOADING;
    });

    try {
      final works = await Ao3Api().getWorksFromTag(item);

      if (mounted) {
        setState(() {
          _works = works;
          _worksState = LoadingState.LOADED;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _worksState = LoadingState.ERROR;
        });
      }
    }
  }

  Future<void> _fetchBookmarks() async {
    setState(() {
      _bookmarksState = LoadingState.LOADING;
    });

    try {
      final bookmarks = await Ao3Api().getBookmarksFromTag(item);

      if (mounted) {
        setState(() {
          _bookmarks = bookmarks;
          _bookmarksState = LoadingState.LOADED;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _bookmarksState = LoadingState.ERROR;
        });
      }
    }
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.25;
  }

  @override
  Future<Tag> fetchItem() {
    return Ao3Api().getTag(item);
  }

  @override
  List<Widget> buildDetailSlivers(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(context),

            // Related tags sections
            if (item.parents.isNotEmpty)
              _buildTagSection(
                context,
                "Parent tags",
                "Broader tags",
                item.parents,
                TablerIcons.arrow_up,
                _parentsExpanded,
                () => setState(() => _parentsExpanded = !_parentsExpanded),
              ),

            if (item.children.isNotEmpty)
              _buildTagSection(
                context,
                "Child tags",
                "Narrower tags",
                item.children,
                TablerIcons.arrow_down,
                _childrenExpanded,
                () => setState(() => _childrenExpanded = !_childrenExpanded),
              ),

            if (item.synonyms.isNotEmpty)
              _buildTagSection(
                context,
                "Synonyms",
                "Equivalent tags",
                item.synonyms,
                TablerIcons.equal,
                _synonymsExpanded,
                () => setState(() => _synonymsExpanded = !_synonymsExpanded),
              ),

            if (item.mergers.isNotEmpty)
              _buildTagSection(
                context,
                "Merged tags",
                "Similar tags",
                item.mergers,
                TablerIcons.git_merge,
                _mergersExpanded,
                () => setState(() => _mergersExpanded = !_mergersExpanded),
              ),

            if (item.subtags.isNotEmpty)
              _buildTagSection(
                context,
                "Subtags",
                "Related tags",
                item.subtags,
                TablerIcons.folder,
                _subtagsExpanded,
                () => setState(() => _subtagsExpanded = !_subtagsExpanded),
              ),

            _buildWorksSection(context),

            _buildBookmarksSection(context),

            // Add some space at the bottom
            SizedBox(height: context.screenPadding.bottom + 24.0),
          ],
        ),
      ),
    ];
  }

  Widget _buildHeroSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        top: context.commonPaddingDouble,
        left: context.commonPaddingDouble,
        right: context.commonPaddingDouble,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag type and canonical status
          Row(
            children: [
              // Tag type chip
              Chip(
                avatar: Icon(
                  _getTagTypeIcon(item.type),
                  size: 16,
                  color: colorScheme.onPrimaryContainer,
                ),
                label: Text(
                  item.type.toString(),
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: colorScheme.primaryContainer,
                side: BorderSide.none,
              ),

              SizedBox(width: 8),

              // Relationship type indicator
              if (item.type == TagType.RELATIONSHIP)
                Chip(
                  avatar: Icon(
                    item.isRomanticRelationship
                        ? TablerIcons.heart_filled
                        : TablerIcons.users,
                    size: 16,
                    color: item.isRomanticRelationship
                        ? colorScheme.onErrorContainer
                        : colorScheme.onSurfaceVariant,
                  ),
                  label: Text(
                    item.isRomanticRelationship ? "Romantic" : "Platonic",
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: item.isRomanticRelationship
                      ? colorScheme.secondaryContainer.withOpacity(0.7)
                      : colorScheme.tertiaryContainer.withOpacity(0.7),
                  side: BorderSide.none,
                ),
            ],
          ),
          if (item.canonical) ...[
            SizedBox(height: 24),
            _buildCanonicalCard(context),
          ],
        ],
      ),
    );
  }

  Widget _buildCanonicalCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card.filled(
      elevation: 0,
      color: colorScheme.tertiaryContainer.withAlpha(77),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Icon(
          TablerIcons.award,
          color: colorScheme.onTertiaryContainer,
        ),
        title: Text(
          "This tag is canonical!",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onTertiaryContainer,
          ),
        ),
        subtitle: Text(
          "This tag is recognized as an official tag by wranglers.",
          style: context.textTheme.bodySmall?.copyWith(
            color: colorScheme.onTertiaryContainer.withOpacity(0.8),
          ),
        ),
        // trailing: Icon(
        //   TablerIcons.chevron_right,
        //   color: colorScheme.onTertiaryContainer,
        // ),
        // onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      ),
    );
  }

  Widget _buildTagChip(BuildContext context, Tag tag) {
    final colorScheme = Theme.of(context).colorScheme;

    return ActionChip(
      avatar: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getTagTypeIcon(tag.type),
            size: 14,
            color: colorScheme.onSurfaceVariant,
          ),
          // Add relationship type indicator for relationship tags
          if (tag.type == TagType.RELATIONSHIP) ...[
            SizedBox(width: 2),
            Icon(
              tag.isRomanticRelationship
                  ? TablerIcons.heart
                  : TablerIcons.user_plus,
              size: 10,
              color: tag.isRomanticRelationship
                  ? colorScheme.error.withOpacity(0.8)
                  : colorScheme.onSurfaceVariant.withOpacity(0.8),
            ),
          ],
        ],
      ),
      label: Text(tag.name),
      onPressed: () {
        Navigator.pushNamed(context, TagActivity.routeName, arguments: tag);
      },
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.3),
      side: BorderSide(color: colorScheme.outline.withOpacity(0.2), width: 1),
    );
  }

  IconData _getTagTypeIcon(TagType type) {
    switch (type) {
      case TagType.FANDOM:
        return TablerIcons.book;
      case TagType.CHARACTER:
        return TablerIcons.user;
      case TagType.RELATIONSHIP:
        return TablerIcons.heart;
      case TagType.FREEFORM:
        return TablerIcons.tag;
    }
  }

  Widget _buildStatsCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card.filled(
      elevation: 0,
      color: colorScheme.primaryContainer.withAlpha(77),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              context,
              TablerIcons.book_2,
              AppUtils.formatCompactNumber(item.count),
              "Works",
              colorScheme.primary,
            ),

            Container(
              height: 40,
              width: 1,
              color: colorScheme.outline.withOpacity(0.2),
            ),

            _buildStatItem(
              context,
              TablerIcons.tags,
              "${item.parents.length + item.children.length + item.synonyms.length}",
              "Related",
              colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildTagSection(
    BuildContext context,
    String title,
    String subtitle,
    List<Tag> tags,
    IconData icon,
    bool isExpanded,
    VoidCallback onToggle,
  ) {
    if (tags.isEmpty) return SizedBox.shrink();

    final shouldShowExpandButton = tags.length > 10;
    final tagsToShow = isExpanded ? tags : tags.take(10).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.medium(
            title: title,
            subtitle: subtitle,
            icon: icon,
            hasPadding: false,
            onTap: shouldShowExpandButton ? onToggle : null,
            actionText: shouldShowExpandButton
                ? Text(isExpanded ? "Show less" : "Show all (${tags.length})")
                : null,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: tagsToShow
                .map((tag) => _buildTagChip(context, tag))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildWorksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.large(
            title: "Works",
            icon: TablerIcons.book_2,
            onTap:
                _worksState == LoadingState.LOADED && _works?.isNotEmpty == true
                ? () => Navigator.pushNamed(context, "", arguments: item)
                : null,
            actionText:
                _worksState == LoadingState.LOADED && _works?.isNotEmpty == true
                ? Text("See all")
                : null,
            hasPadding: false,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),

          SizedBox(height: 8),

          _buildWorksContent(context),
        ],
      ),
    );
  }

  Widget _buildWorksContent(BuildContext context) {
    if (_worksState == LoadingState.ERROR) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LoadError.small(onPressed: _fetchWorks)),
      );
    } else if (_worksState == LoadingState.LOADING) {
      return WorkSuggestions(works: Fillers.works, loading: true, elevation: 0);
    } else if (_works == null || _works!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemPlaceholder.small(
            message: "No works found",
            icon: TablerIcons.book_off,
          ),
        ),
      );
    } else {
      return WorkSuggestions(works: _works!, loading: false, elevation: 0);
    }
  }

  _buildBookmarksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader.large(
            title: "Bookmarks",
            icon: TablerIcons.bookmark,
            onTap:
                _bookmarksState == LoadingState.LOADED &&
                    _bookmarks?.isNotEmpty == true
                ? () => Navigator.pushNamed(context, "", arguments: item)
                : null,
            actionText:
                _bookmarksState == LoadingState.LOADED &&
                    _bookmarks?.isNotEmpty == true
                ? Text("See all")
                : null,
            hasPadding: false,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),

          SizedBox(height: 8),

          _buildBookmarksContent(context),
        ],
      ),
    );
  }

  Widget _buildBookmarksContent(BuildContext context) {
    if (_bookmarksState == LoadingState.ERROR) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LoadError.small(onPressed: _fetchBookmarks)),
      );
    } else if (_bookmarksState == LoadingState.LOADING) {
      return Skeletonizer(
        child: TagBookmarkSuggestions(
          tagBookmarks: Fillers.tagBookmarks,
          loading: true,
          elevation: 0,
        ),
      );
    } else if (_bookmarks == null || _bookmarks!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemPlaceholder.small(
            message: "No bookmarks found",
            icon: TablerIcons.bookmark_off,
          ),
        ),
      );
    } else {
      return TagBookmarkSuggestions(tagBookmarks: _bookmarks!, loading: false);
    }
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          // Series type indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Tag",
              style: context.textTheme.labelSmall?.copyWith(
                color: colorScheme.onTertiaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            item.name,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(item.name);
  }
}
