import 'package:archiverse/components/rating_utils.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _RatingInfoDialog extends StatelessWidget {
  final RatingInfo info;
  final bool useIcon;
  const _RatingInfoDialog({super.key, required this.info, this.useIcon = true});

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
        child:
            useIcon
                ? Icon(info.icon, color: info.foregroundColor, size: 32)
                : Center(
                  child: Text(
                    info.symbol,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge
                        ?.copyWith(
                          color: info.foregroundColor,
                          fontWeight: FontWeight.bold,
                        )
                        .apply(fontSizeDelta: 4),
                  ),
                ),
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
  static void showSheet(
    BuildContext context, {
    required RatingInfo info,
    bool useIcon = true,
  }) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) =>
              _RatingInfoDialog(info: info, useIcon: useIcon),
    );
  }
}
