import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/text_size_control.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TextSizeSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/text_size';
  const TextSizeSettingsActivity({super.key});

  @override
  State<TextSizeSettingsActivity> createState() =>
      _TextSizeSettingsActivityState();
}

class _TextSizeSettingsActivityState extends State<TextSizeSettingsActivity> {
  double _textScale = 1.0; // 1.0 is default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top section with app bar and preview
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar.large(
                  title: Text(context.strings.settings_text_size_title),
                  actions: [
                    IconButton(
                      icon: const Icon(TablerIcons.rotate_2),
                      onPressed: () {
                        setState(() {
                          _textScale = 1.0;
                        });
                      },
                      tooltip: context.strings.settings_common_reset,
                    ),
                  ],
                  pinned: true,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPadding,
                    ),
                    child: _buildPreviewSection(),
                  ),
                ),
              ],
            ),
          ),

          // Bottom section with controls - using the reusable component
          SettingsBottomPanel(
            child: TextSizeControl(
              value: _textScale,
              onChanged: (value) => setState(() => _textScale = value),
              label: context.strings.settings_text_size_adjust_label,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.settings_text_size_preview_title,
            style: context.textTheme.titleLarge,
          ),
          Divider(height: 24),

          // Display example text at different levels with the applied scale
          Text(
            context.strings.settings_text_size_heading,
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: context.textTheme.headlineSmall!.fontSize! * _textScale,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.strings.settings_text_size_subheading,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: context.textTheme.titleMedium!.fontSize! * _textScale,
              color: context.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            context.strings.settings_text_size_body,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: context.textTheme.bodyMedium!.fontSize! * _textScale,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.strings.settings_text_size_body,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: context.textTheme.bodyMedium!.fontSize! * _textScale,
            ),
          ),
        ],
      ),
    );
  }
}
