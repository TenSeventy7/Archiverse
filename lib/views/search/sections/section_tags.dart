import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/parsers/tag.dart';
import 'package:archiverse/components/suggestions/tag_suggestions.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_tag_results.dart';
import 'package:archiverse/views/search/sections/section_common.dart';
import 'package:flutter/material.dart';

class TagsResultSection extends SearchResultSection<Tag> {
  TagsResultSection({
    super.title = "Tags",
    super.routeName = TagSearchFragment.routeName,
  });

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await Ao3Api().searchTags(
        query,
        page: 1,
        type: TagType.FREEFORM,
      );
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Tag> getPlaceholderData() => Fillers.freeforms;

  @override
  Widget buildSectionWidget(BuildContext context, VoidCallback onSeeMore) {
    return TagSuggestions(
      tags: isLoading ? getPlaceholderData() : results,
      loading: isLoading,
      header: buildHeader(context, onSeeMore),
      elevation: 0,
    );
  }
}
