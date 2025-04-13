import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AuthorFiltersSettingsActivity extends CommonActivity {
  static const String routeName = '/settings/author_filters';
  const AuthorFiltersSettingsActivity({super.key});

  @override
  State<AuthorFiltersSettingsActivity> createState() =>
      _AuthorFiltersSettingsActivityState();
}

class _AuthorFiltersSettingsActivityState
    extends State<AuthorFiltersSettingsActivity>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Sample authors for demonstration
  final List<Map<String, dynamic>> _blockedAuthors = [
    {'username': 'author123', 'reason': 'Posts content I dislike'},
    {'username': 'writer456', 'reason': null},
  ];

  final List<Map<String, dynamic>> _followedAuthors = [
    {'username': 'favwriter1', 'notifyUpdates': true},
    {'username': 'greatauthor2', 'notifyUpdates': false},
  ];

  bool _hideBlockedAuthorWorks = true;
  bool _hideBlockedInSearch = true;
  bool _showBlockedIndicator = true;
  bool _notifyNewWorks = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar.large(
                title: Text(context.strings.settings_author_filters_title),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: context.strings.settings_blocked_content_title),
                    Tab(text: context.strings.dialog_follow),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(TablerIcons.plus),
                    onPressed: () => _showAddAuthorDialog(context),
                    tooltip: context.strings.settings_author_filters_add_author,
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [_buildBlockedTab(), _buildFollowedTab()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddAuthorDialog(context),
          child: const Icon(TablerIcons.plus),
        ),
      ),
    );
  }

  Widget _buildBlockedTab() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: context.commonPadding,
        vertical: 16,
      ),
      children: [
        OptionGroup(
          title: context.strings.settings_author_filters_blocking,
          children: [
            OptionTile.switcher(
              title: context.strings.settings_author_filters_hide_works,
              icon: TablerIcons.eye_off,
              value: _hideBlockedAuthorWorks,
              onChanged: (value) {
                setState(() {
                  _hideBlockedAuthorWorks = value;
                });
              },
            ),
            OptionTile.switcher(
              title: context.strings.settings_author_filters_hide_search,
              icon: TablerIcons.search_off,
              value: _hideBlockedInSearch,
              onChanged: (value) {
                setState(() {
                  _hideBlockedInSearch = value;
                });
              },
            ),
            OptionTile.switcher(
              title: context.strings.settings_author_filters_show_indicator,
              subtitle:
                  context
                      .strings
                      .settings_author_filters_show_indicator_subtitle,
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

        if (_blockedAuthors.isNotEmpty)
          OptionGroup(
            title: context.strings.settings_author_filters_blocked_authors,
            children:
                _blockedAuthors
                    .map(
                      (author) => OptionTile(
                        title: author['username'],
                        subtitle: author['reason'],
                        icon: TablerIcons.user_off,
                        trailing: IconButton(
                          icon: const Icon(TablerIcons.trash),
                          onPressed: () {
                            setState(() {
                              _blockedAuthors.remove(author);
                            });
                          },
                          tooltip:
                              context.strings.settings_author_filters_unblock,
                        ),
                      ),
                    )
                    .toList(),
          )
        else
          OptionGroup(
            title: context.strings.settings_author_filters_blocked_authors,
            children: [
              OptionTile.custom(
                title: "",
                widget: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(
                          TablerIcons.user_off,
                          size: 48,
                          color: context.colorScheme.onSurfaceVariant
                              .withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.strings.settings_author_filters_no_blocked,
                          style: TextStyle(
                            color: context.colorScheme.onSurfaceVariant,
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
    );
  }

  Widget _buildFollowedTab() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: context.commonPadding,
        vertical: 16,
      ),
      children: [
        OptionGroup(
          title: context.strings.settings_author_filters_following,
          children: [
            OptionTile.switcher(
              title: context.strings.settings_author_filters_notify_works,
              subtitle:
                  context.strings.settings_author_filters_notify_works_subtitle,
              icon: TablerIcons.bell,
              value: _notifyNewWorks,
              onChanged: (value) {
                setState(() {
                  _notifyNewWorks = value;
                });
              },
            ),
            OptionTile(
              title: context.strings.settings_author_filters_sync_ao3,
              subtitle:
                  context.strings.settings_author_filters_sync_ao3_subtitle,
              icon: TablerIcons.cloud_download,
              onTap: () {
                // Implement AO3 sync functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This would sync with AO3 when implemented"),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16.0),

        if (_followedAuthors.isNotEmpty)
          OptionGroup(
            title: context.strings.settings_author_filters_followed_authors,
            children:
                _followedAuthors
                    .map(
                      (author) => OptionTile.switcher(
                        title: author['username'],
                        subtitle:
                            context
                                .strings
                                .settings_author_filters_notify_updates,
                        icon: TablerIcons.user_check,
                        value: author['notifyUpdates'],
                        onChanged: (value) {
                          setState(() {
                            author['notifyUpdates'] = value;
                          });
                        },
                        trailing: IconButton(
                          icon: const Icon(TablerIcons.trash),
                          onPressed: () {
                            setState(() {
                              _followedAuthors.remove(author);
                            });
                          },
                          tooltip:
                              context.strings.settings_author_filters_unfollow,
                        ),
                      ),
                    )
                    .toList(),
          )
        else
          OptionGroup(
            title: context.strings.settings_author_filters_followed_authors,
            children: [
              OptionTile.custom(
                title: "",
                widget: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(
                          TablerIcons.user,
                          size: 48,
                          color: context.colorScheme.onSurfaceVariant
                              .withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.strings.settings_author_filters_no_followed,
                          style: TextStyle(
                            color: context.colorScheme.onSurfaceVariant,
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
    );
  }

  void _showAddAuthorDialog(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController reasonController = TextEditingController();
    bool isBlocking = _tabController.index == 0;
    bool notifyUpdates = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(context.strings.settings_author_filters_add_author),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText:
                          context.strings.settings_author_filters_username,
                      prefixIcon: Icon(TablerIcons.user),
                    ),
                    autofocus: true,
                  ),
                  const SizedBox(height: 16),
                  if (isBlocking)
                    TextField(
                      controller: reasonController,
                      decoration: InputDecoration(
                        labelText:
                            context
                                .strings
                                .settings_author_filters_block_reason,
                        prefixIcon: Icon(TablerIcons.note),
                      ),
                    )
                  else
                    SwitchListTile(
                      title: Text(
                        context.strings.settings_author_filters_notify_updates,
                      ),
                      value: notifyUpdates,
                      onChanged: (value) {
                        setDialogState(() {
                          notifyUpdates = value;
                        });
                      },
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
                    if (usernameController.text.isEmpty) return;

                    setState(() {
                      if (isBlocking) {
                        _blockedAuthors.add({
                          'username': usernameController.text,
                          'reason':
                              reasonController.text.isNotEmpty
                                  ? reasonController.text
                                  : null,
                        });
                      } else {
                        _followedAuthors.add({
                          'username': usernameController.text,
                          'notifyUpdates': notifyUpdates,
                        });
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    isBlocking
                        ? context.strings.dialog_block
                        : context.strings.dialog_follow,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
