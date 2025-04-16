import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/parsers/tag.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_fandom_results.dart';
import 'package:archiverse/views/search/sections/section_tags.dart';

class FandomsResultSection extends TagsResultSection {
  FandomsResultSection()
    : super(title: 'Fandoms', routeName: FandomSearchFragment.routeName);

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await Ao3Api().searchTags(query, page: 1, type: TagType.FANDOM);
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Tag> getPlaceholderData() => Fillers.fandoms;
}
