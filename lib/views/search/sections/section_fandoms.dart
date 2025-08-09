import 'package:archiverse/api.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_fandom_results.dart';
import 'package:archiverse/views/search/sections/section_tags.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class FandomsResultSection extends TagsResultSection {
  FandomsResultSection()
    : super(
        title: 'Fandoms',
        icon: TablerIcons.books,
        routeName: FandomSearchFragment.routeName,
      );

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await AppApi().searchTags(query, page: 1, type: TagType.FANDOM);
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Tag> getPlaceholderData() => Fillers.fandoms;
}
