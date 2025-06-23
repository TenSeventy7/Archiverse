import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/work.dart';

class WorkSuggestions extends BaseSuggestions<Work, WorkCard> {
  final int itemCount;
  const WorkSuggestions({
    super.key,
    required List<Work> works,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
    this.itemCount = 5,
  }) : super(items: works, maxItems: itemCount);

  @override
  WorkCard buildCard(Work work, double elevation) {
    return WorkCard(work: work, elevation: elevation);
  }
}
