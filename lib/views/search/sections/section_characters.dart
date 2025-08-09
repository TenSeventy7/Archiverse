import 'package:archiverse/api.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_character_results.dart';
import 'package:archiverse/views/search/sections/section_tags.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CharactersResultSection extends TagsResultSection {
  CharactersResultSection()
    : super(
        title: 'Characters',
        icon: TablerIcons.users,
        routeName: CharacterSearchFragment.routeName,
      );

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await AppApi().searchTags(
        query,
        page: 1,
        type: TagType.CHARACTER,
      );
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Tag> getPlaceholderData() => Fillers.characters;
}
