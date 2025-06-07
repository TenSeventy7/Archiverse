import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/series_item.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:flutter/material.dart';

class SeriesCard extends BaseCard<Series> {
  const SeriesCard({
    super.key,
    required Series series,
    this.isSmall = false,
    super.elevation,
  }) : super(item: series);
  const SeriesCard.small({Key? key, required Series series, double? elevation})
    : this(key: key, series: series, isSmall: true, elevation: elevation);

  final bool isSmall;
  @override
  Widget buildContent(BuildContext context) {
    if (isSmall) {
      return SeriesItem.small(series: item);
    }

    return SeriesItem(series: item);
  }

  @override
  String getRouteName() => SeriesActivity.routeName;
}
