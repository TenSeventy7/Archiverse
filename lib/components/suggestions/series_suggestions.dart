import 'package:archiverse/components/cards/series_card.dart';
import 'package:archiverse/components/suggestions/base_suggestions.dart';
import 'package:archiverse/models/series.dart';

class SeriesSuggestions extends BaseSuggestions<Series, SeriesCard> {
  const SeriesSuggestions({
    super.key,
    required List<Series> series,
    required super.loading,
    super.header,
    super.footer,
    super.elevation,
  }) : super(items: series, maxItems: 5);

  @override
  SeriesCard buildCard(Series series, double elevation) {
    return SeriesCard(series: series, elevation: elevation);
  }
}
