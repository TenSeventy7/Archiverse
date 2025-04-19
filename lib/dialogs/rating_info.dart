import 'package:archiverse/components/rating_utils.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';

class _RatingInfoDialog extends StatelessWidget {
  final RatingInfo info;
  const _RatingInfoDialog({required this.info});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      icon: Container(
        width: 50,
        height: 50,
        constraints: BoxConstraints.tight(const Size(48, 48)),
        decoration: BoxDecoration(
          color: info.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(info.icon, color: info.foregroundColor, size: 32),
      ),
      iconPadding: EdgeInsets.only(
        left: context.screenWidth * 0.5 - 40,
        right: context.screenWidth * 0.5 - 40,
        top: 24.0,
        bottom: 12.0,
      ),
      title: Text(info.label),
      content: Text(
        info.information,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "OK",
            style: context.textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class RatingInfoDialog {
  static void showSheet(BuildContext context, {required RatingInfo info}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => _RatingInfoDialog(info: info),
    );
  }
}
