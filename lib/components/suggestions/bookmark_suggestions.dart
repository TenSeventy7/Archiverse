import 'package:archiverse/components/cards/bookmark_card.dart';
import 'package:archiverse/components/items/bookmark_item.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/bookmark.dart';

class BookmarkSuggestions extends BaseSuggestions<Bookmark, BookmarkCard> {
  const BookmarkSuggestions({
    super.key,
    required List<Bookmark> bookmarks,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
    this.displayMode = BookmarkItemDisplayMode.full,
  }) : super(items: bookmarks, maxItems: 5);

  const BookmarkSuggestions.bookmarkeeOnly({
    super.key,
    required List<Bookmark> bookmarks,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : displayMode = BookmarkItemDisplayMode.bookmarkeeOnly,
       super(items: bookmarks, maxItems: 5);

  const BookmarkSuggestions.contentOnly({
    super.key,
    required List<Bookmark> bookmarks,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : displayMode = BookmarkItemDisplayMode.contentOnly,
       super(items: bookmarks, maxItems: 5);

  const BookmarkSuggestions.contentWithNotes({
    super.key,
    required List<Bookmark> bookmarks,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : displayMode = BookmarkItemDisplayMode.contentWithNotes,
       super(items: bookmarks, maxItems: 5);

  final BookmarkItemDisplayMode displayMode;

  @override
  BookmarkCard buildCard(Bookmark bookmark, double elevation) {
    return BookmarkCard(
      bookmark: bookmark,
      displayMode: displayMode,
      elevation: elevation,
    );
  }
}
