import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _AuthorOrphanInfoDialog extends StatelessWidget {
  const _AuthorOrphanInfoDialog();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    TablerIcons.id_off,
                    color: colorScheme.secondary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Orphaned Account",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Content
            _buildInfoSection(
              context,
              title: "What is an orphaned work?",
              icon: TablerIcons.question_mark,
              content:
                  "Works on Archive of Our Own (AO3) can be 'orphaned' by authors who wish to disconnect their identity from their works while keeping the content available on the site.",
            ),

            const SizedBox(height: 16),

            _buildInfoSection(
              context,
              title: "How it works",
              icon: TablerIcons.info_circle,
              content:
                  "When a work is orphaned, it remains on AO3 but is attributed to 'orphan_account' rather than the original author. Comments, kudos, and other interactions remain, but the connection to the author's profile is permanently removed.",
            ),

            const SizedBox(height: 16),

            _buildInfoSection(
              context,
              title: "Why authors orphan works",
              icon: TablerIcons.question_mark,
              content:
                  "Authors may choose to orphan works for privacy reasons, when leaving a fandom, or to disassociate themselves from certain content while allowing others to continue enjoying it.",
            ),

            const SizedBox(height: 24),

            // Action buttons
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    icon: const Icon(TablerIcons.external_link),
                    label: const Text("Learn More"),
                    onPressed: () {
                      // TODO: Open URL to AO3's official documentation about orphaning works
                    },
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    child: const Text("Close"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String content,
    Color? color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = color ?? colorScheme.primary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: iconColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(content, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthorOrphanInfoDialog {
  static void showSheet(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const _AuthorOrphanInfoDialog(),
    );
  }
}
