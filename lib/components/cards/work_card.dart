import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/views/activity_work.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkCard extends BaseCard<Work> {
  const WorkCard({super.key, required Work work, super.elevation})
    : super(
        item: work,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 16.0,
        ),
      );

  // @override
  // Widget buildHeader(BuildContext context) {
  //   return Skeleton.shade(
  //     child: Container(height: 8, color: _getRatingColor(context, item)),
  //   );
  // }

  @override
  Widget buildContent(BuildContext context) {
    return WorkItem(work: item);
  }

  @override
  Function(BuildContext) get onLongPress =>
      (context) => WorkOptionsDialog.showSheet(context, work: item);

  @override
  String getRouteName() => WorkActivity.routeName;

  Color _getRatingColor(BuildContext context, Work work) {
    switch (work.rating) {
      case AgeRating.GENERAL:
        return Colors.lightGreen;
      case AgeRating.TEEN:
        return Colors.yellow;
      case AgeRating.MATURE:
        return Colors.orange;
      case AgeRating.EXPLICIT:
        return Colors.redAccent;
      default:
        return Colors.blueGrey;
    }
  }
}
