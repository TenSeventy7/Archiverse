import 'package:archiverse/components/items/work_item.dart';
import 'package:archiverse/dialogs/work_options.dart';
import 'package:flutter/material.dart';
import 'package:archiverse/models/work.dart';

class WorkCard extends StatelessWidget {
  final Work work;
  final double? elevation;
  const WorkCard({super.key, required this.work, this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Navigator.pushNamed(context, "", arguments: work);
        },
        onLongPress: () => WorkOptionsDialog.showSheet(context, work: work),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Accent color strip based on rating
            Container(height: 8, color: _getRatingColor(context, work)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 16.0,
              ),
              child: WorkItem(work: work),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRatingColor(BuildContext context, Work work) {
    // Different colors based on rating
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
