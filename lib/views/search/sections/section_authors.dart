import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/suggestions/author_suggestions.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_author_results.dart';
import 'package:archiverse/views/search/sections/section_common.dart';
import 'package:flutter/material.dart';

class AuthorsResultSection extends SearchResultSection<Pseud> {
  AuthorsResultSection()
    : super(title: 'Authors', routeName: AuthorSearchFragment.routeName);

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await Ao3Api().searchUsers(query, page: 1);
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Pseud> getPlaceholderData() => Fillers.pseuds;

  @override
  Widget buildSectionWidget(BuildContext context, VoidCallback onSeeMore) {
    return AuthorSuggestions(
      authors: isLoading ? getPlaceholderData() : results,
      loading: isLoading,
      header: buildHeader(context, onSeeMore),
      elevation: 0,
    );
  }
}
