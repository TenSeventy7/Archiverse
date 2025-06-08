import 'package:archiverse/components/cards/tag_bookmark_card.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/tag_bookmark.dart';

class TagBookmarkSuggestions
    extends BaseSuggestions<TagBookmark, TagBookmarkCard> {
  const TagBookmarkSuggestions({
    super.key,
    required List<TagBookmark> tagBookmarks,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : super(items: tagBookmarks, maxItems: 5);

  @override
  TagBookmarkCard buildCard(TagBookmark tagBookmark, double elevation) {
    return TagBookmarkCard(tagBookmark: tagBookmark, elevation: elevation);
  }
}
