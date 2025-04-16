import 'package:archiverse/components/cards/author_card.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/pseud.dart';

class AuthorSuggestions extends BaseSuggestions<Pseud, AuthorCard> {
  const AuthorSuggestions({
    super.key,
    required List<Pseud> authors,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : super(items: authors, maxItems: 8);

  @override
  AuthorCard buildCard(Pseud author, double elevation) {
    return AuthorCard(author: author, elevation: elevation);
  }
}
