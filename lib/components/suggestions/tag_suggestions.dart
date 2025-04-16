import 'package:archiverse/components/cards/tag_card.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/tag.dart';

class TagSuggestions extends BaseSuggestions<Tag, TagCard> {
  const TagSuggestions({
    super.key,
    required List<Tag> tags,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : super(items: tags, maxItems: 5);

  @override
  TagCard buildCard(Tag tag, double elevation) {
    return TagCard(tag: tag, elevation: elevation);
  }
}
