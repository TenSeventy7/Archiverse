import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/parsers/tag.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/views/search/fragment_relationship_results.dart';
import 'package:archiverse/views/search/sections/section_tags.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RelationshipsResultSection extends TagsResultSection {
  RelationshipsResultSection()
    : super(
        title: 'Relationships',
        icon: TablerIcons.user_heart,
        routeName: RelationshipSearchFragment.routeName,
      );

  @override
  Future<void> fetchData(String query) async {
    try {
      results = await Ao3Api().searchTags(
        query,
        page: 1,
        type: TagType.RELATIONSHIP,
      );
    } catch (e) {
      results = [];
    }
  }

  @override
  List<Tag> getPlaceholderData() => Fillers.relationships;
}
