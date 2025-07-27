import 'package:archiverse/components/expressive/nested_scroll_view.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BlockedContentActivity extends CommonActivity {
  static const String routeName = '/settings/blocked_content';
  const BlockedContentActivity({super.key});

  @override
  State<BlockedContentActivity> createState() => _BlockedContentActivityState();
}

class _BlockedContentActivityState extends State<BlockedContentActivity> {
  // Sample blocked works for demonstration
  final List<Map<String, String>> _blockedWorks = [
    {'id': '12345678', 'title': 'Untold Stories'},
    {'id': '87654321', 'title': 'Beyond the Stars'},
  ];

  // Sample blocked collections
  final List<Map<String, String>> _blockedCollections = [
    {'id': 'col123', 'title': 'Summer Exchange 2024'},
  ];

  bool _hideBlockedInSearch = true;
  bool _hideBlockedInFeeds = true;
  bool _showBlockedIndicator = true;

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      body: (controller) => ExpressiveNestedScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled, controller) {
          return <Widget>[
            ExpressiveSliverAppBar.medium(
              controller: controller,
              title: Text(context.strings.settings_blocked_content_title),
              actions: [
                IconButton(
                  icon: const Icon(TablerIcons.plus),
                  onPressed: () => _showAddBlockDialog(context),
                  tooltip: context.strings.settings_blocked_content_add,
                ),
              ],
            ),
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            context.commonPadding,
            0,
            context.commonPadding,
            16,
          ),
          children: [
            OptionGroup(
              title: context.strings.settings_blocked_content_title,
              children: [
                OptionTile.switcher(
                  title: context.strings.settings_blocked_content_hide_search,
                  icon: TablerIcons.search_off,
                  value: _hideBlockedInSearch,
                  onChanged: (value) {
                    setState(() {
                      _hideBlockedInSearch = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title: context.strings.settings_blocked_content_hide_feeds,
                  icon: TablerIcons.layout_list,
                  value: _hideBlockedInFeeds,
                  onChanged: (value) {
                    setState(() {
                      _hideBlockedInFeeds = value;
                    });
                  },
                ),
                OptionTile.switcher(
                  title:
                      context.strings.settings_blocked_content_show_indicator,
                  subtitle: context
                      .strings
                      .settings_blocked_content_show_indicator_subtitle,
                  icon: TablerIcons.eye_exclamation,
                  value: _showBlockedIndicator,
                  onChanged: (value) {
                    setState(() {
                      _showBlockedIndicator = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            if (_blockedWorks.isNotEmpty)
              OptionGroup(
                title: context.strings.settings_blocked_content_blocked_works,
                children: _blockedWorks
                    .map(
                      (work) => OptionTile(
                        title: work['title']!,
                        subtitle: context.strings
                            .settings_blocked_content_work_id(work['id']!),
                        icon: TablerIcons.book_off,
                        trailing: IconButton(
                          icon: const Icon(TablerIcons.trash),
                          onPressed: () {
                            setState(() {
                              _blockedWorks.remove(work);
                            });
                          },
                          tooltip: context
                              .strings
                              .settings_blocked_content_unblock_work,
                        ),
                      ),
                    )
                    .toList(),
              ),

            if (_blockedWorks.isNotEmpty) const SizedBox(height: 16.0),

            if (_blockedCollections.isNotEmpty)
              OptionGroup(
                title: context
                    .strings
                    .settings_blocked_content_blocked_collections,
                children: _blockedCollections
                    .map(
                      (collection) => OptionTile(
                        title: collection['title']!,
                        subtitle: context.strings
                            .settings_blocked_content_collection_id(
                              collection['id']!,
                            ),
                        icon: TablerIcons.folders_off,
                        trailing: IconButton(
                          icon: const Icon(TablerIcons.trash),
                          onPressed: () {
                            setState(() {
                              _blockedCollections.remove(collection);
                            });
                          },
                          tooltip: context
                              .strings
                              .settings_blocked_content_unblock_collection,
                        ),
                      ),
                    )
                    .toList(),
              ),

            if (_blockedWorks.isEmpty && _blockedCollections.isEmpty)
              OptionGroup(
                title: context.strings.settings_blocked_content_title,
                children: [
                  OptionTile.custom(
                    title: "",
                    widget: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              TablerIcons.ghost,
                              size: 48,
                              color: context.colorScheme.onSurfaceVariant
                                  .withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              context.strings.settings_blocked_content_empty,
                              style: TextStyle(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context
                                  .strings
                                  .settings_blocked_content_empty_subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                color: context.colorScheme.onSurfaceVariant
                                    .withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBlockDialog(context),
        child: const Icon(TablerIcons.plus),
      ),
    );
  }

  void _showAddBlockDialog(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    String contentType = context.strings.settings_blocked_content_work;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(context.strings.settings_blocked_content_add),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: contentType,
                    decoration: InputDecoration(
                      labelText:
                          context.strings.settings_blocked_content_enter_type,
                    ),
                    items:
                        [
                          context.strings.settings_blocked_content_work,
                          context.strings.settings_blocked_content_collection,
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setDialogState(() {
                          contentType = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      labelText:
                          contentType ==
                              context.strings.settings_blocked_content_work
                          ? context
                                .strings
                                .settings_blocked_content_work_id_label
                          : context
                                .strings
                                .settings_blocked_content_collection_id_label,
                      hintText:
                          contentType ==
                              context.strings.settings_blocked_content_work
                          ? context
                                .strings
                                .settings_blocked_content_enter_work_id
                          : context
                                .strings
                                .settings_blocked_content_enter_collection_id,
                      prefixIcon: Icon(
                        contentType ==
                                context.strings.settings_blocked_content_work
                            ? TablerIcons.hash
                            : TablerIcons.folder,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(context.strings.dialog_cancel),
                ),
                TextButton(
                  onPressed: () {
                    if (idController.text.isEmpty) return;

                    setState(() {
                      if (contentType ==
                          context.strings.settings_blocked_content_work) {
                        _blockedWorks.add({
                          'id': idController.text,
                          'title': context.strings
                              .settings_blocked_content_work_format(
                                idController.text,
                              ),
                        });
                      } else {
                        _blockedCollections.add({
                          'id': idController.text,
                          'title': context.strings
                              .settings_blocked_content_collection_format(
                                idController.text,
                              ),
                        });
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: Text(context.strings.dialog_block),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
