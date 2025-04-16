import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_work_results.dart';
import 'package:archiverse/views/search/sections/section_common.dart';
import 'package:flutter/material.dart';

class WorksResultSection extends SearchResultSection<Work> {
  WorksResultSection()
    : super(title: 'Works', routeName: WorkSearchFragment.routeName);

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await Ao3Api().searchWorks(query, page: 1);
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Work> getPlaceholderData() => Fillers.works;

  @override
  Widget buildSectionWidget(BuildContext context, VoidCallback onSeeMore) {
    return WorkSuggestions(
      works: isLoading ? getPlaceholderData() : results,
      loading: isLoading,
      header: buildHeader(context, onSeeMore),
      elevation: 0,
    );
  }
}
