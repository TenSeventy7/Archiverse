import 'package:archiverse/components/settings/bottom_panel.dart';
import 'package:archiverse/components/settings/slider_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';

class ReadingLayoutSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/reading_layout';
  const ReadingLayoutSettingsActivity({super.key});

  @override
  State<ReadingLayoutSettingsActivity> createState() =>
      _ReadingLayoutSettingsActivityState();
}

class _ReadingLayoutSettingsActivityState
    extends State<ReadingLayoutSettingsActivity> {
  String _selectedLayout = 'Single Column';
  double _paragraphSpacing = 1.0; // 1.0 is default
  double _lineSpacing = 1.2; // 1.2 is default (120% line height)
  bool _justifyText = false;

  @override
  void initState() {
    super.initState();
    // We need to wait for context to be available before setting this
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedLayout = context.strings.settings_layout_single_column;
      });
    });
  }

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
                  title: Text(context.strings.settings_layout_title),
                  actions: [
                    IconButton(
                      icon: const Icon(TablerIcons.rotate_2),
                      onPressed: () {
                        setState(() {
                          _selectedLayout =
                              context.strings.settings_layout_single_column;
                          _paragraphSpacing = 1.0;
                          _lineSpacing = 1.2;
                          _justifyText = false;
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

          // Bottom section with layout controls
          SettingsBottomPanel(
            padding: EdgeInsets.symmetric(vertical: context.commonPadding),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Layout type selection
                  Padding(
                    padding: context.horizontalPadding,
                    child: Row(
                      children: [
                        const Icon(TablerIcons.spacing_vertical, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            context.strings.settings_layout_type,
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPadding,
                    ),
                    child: Row(
                      children: [
                        _buildLayoutChip(
                          context.strings.settings_layout_single_column,
                          TablerIcons.baseline_density_small,
                        ),
                        const SizedBox(width: 8),
                        _buildLayoutChip(
                          context.strings.settings_layout_dual_column,
                          TablerIcons.columns_3,
                        ),
                        const SizedBox(width: 8),
                        _buildLayoutChip(
                          context.strings.settings_layout_paginated,
                          TablerIcons.book,
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 24),

                  // Paragraph spacing slider
                  SliderControl(
                    title: context.strings.settings_layout_paragraph_spacing,
                    icon: TablerIcons.spacing_vertical,
                    value: _paragraphSpacing,
                    onChanged:
                        (value) => setState(() => _paragraphSpacing = value),
                  ),

                  // Line spacing slider
                  SliderControl(
                    title: context.strings.settings_layout_line_spacing,
                    icon: TablerIcons.line_height,
                    value: _lineSpacing,
                    onChanged: (value) => setState(() => _lineSpacing = value),
                  ),

                  // Text justification
                  SwitchListTile(
                    contentPadding: context.horizontalPadding,
                    title: Row(
                      children: [
                        const Icon(TablerIcons.align_justified, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          context.strings.settings_layout_justify_text,
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    value: _justifyText,
                    onChanged: (bool value) {
                      setState(() {
                        _justifyText = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutChip(String layout, IconData icon) {
    final isSelected = _selectedLayout == layout;

    return ChoiceChip(
      label: Text(layout),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedLayout = layout;
          });
        }
      },
    );
  }

  Widget _buildPreviewSection() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Layout type indicator
          Row(
            children: [
              Icon(
                _getLayoutIcon(),
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                context.strings.settings_layout_preview_format(_selectedLayout),
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          // Layout preview
          _buildLayoutPreview(),
        ],
      ),
    );
  }

  IconData _getLayoutIcon() {
    if (_selectedLayout == context.strings.settings_layout_single_column) {
      return TablerIcons.baseline_density_small;
    } else if (_selectedLayout == context.strings.settings_layout_dual_column) {
      return TablerIcons.columns_3;
    } else if (_selectedLayout == context.strings.settings_layout_paginated) {
      return TablerIcons.book;
    } else {
      return TablerIcons.baseline_density_small;
    }
  }

  Widget _buildLayoutPreview() {
    final textStyle = TextStyle(height: _lineSpacing, fontSize: 16);

    final paragraph1 = Text(
      'The library was quiet that morning, with sunlight streaming through tall windows and casting long shadows across the wooden floors.',
      style: textStyle,
      textAlign: _justifyText ? TextAlign.justify : TextAlign.start,
    );

    final paragraph2 = Text(
      'Sarah moved silently between the shelves, her fingers tracing the spines of countless books that had become her closest companions.',
      style: textStyle,
      textAlign: _justifyText ? TextAlign.justify : TextAlign.start,
    );

    // Different layouts
    if (_selectedLayout == context.strings.settings_layout_single_column) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          paragraph1,
          SizedBox(height: 16 * _paragraphSpacing),
          paragraph2,
        ],
      );
    } else if (_selectedLayout == context.strings.settings_layout_dual_column) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: paragraph1),
          const SizedBox(width: 16),
          Expanded(child: paragraph2),
        ],
      );
    } else if (_selectedLayout == context.strings.settings_layout_paginated) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paragraph1,
            SizedBox(height: 16 * _paragraphSpacing),
            const Center(
              child: Text(
                '— 1 —',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      );
    } else {
      return paragraph1;
    }
  }
}
