import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_about.dart';
import 'package:archiverse/views/activity_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class UserFragment extends StatefulWidget {
  const UserFragment({Key? key}) : super(key: key);

  @override
  State<UserFragment> createState() => _UserFragmentState();
}

class _UserFragmentState extends State<UserFragment> {
  String userName = '@TenSeventy7'; // TODO: Fetch from API
  String userImage = 'https://placehold.co/200.jpg'; // TODO: Fetch from API

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[_buildAppBar()];
      },
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Cards of options
          SliverPadding(
            padding: context.horizontalPadding,
            sliver: SliverList.list(
              children: [
                _buildUserList(),
                SizedBox(height: context.commonPaddingHalf),
                _buildContentList(),
                SizedBox(height: context.commonPaddingHalf),
                _buildWorksList(),
                SizedBox(height: context.commonPaddingHalf),
                _buildSettingsList(),
                SizedBox(height: context.commonPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar.large(
      title: Text(userName),
      expandedHeight: context.screenHeight * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.screenPadding.top),
            CircleAvatar(radius: 52, backgroundImage: NetworkImage(userImage)),
            SizedBox(height: context.commonPadding),
            Text(
              userName,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.commonPaddingHalf),
            FilledButton.tonal(
              onPressed: () {
                // TODO: Open profile page
              },
              child: const Text('View Profile'),
            ),
          ],
        ),
      ),
      actions: [],
    );
  }

  Widget _buildUserList() {
    return OptionGroup(
      children: [
        OptionTile(
          title: 'Subscriptions',
          icon: TablerIcons.star,
          onTap: () {
            // TODO: Navigate to subscriptions
          },
        ),
        OptionTile(
          title: 'History',
          icon: TablerIcons.history,
          onTap: () {
            // TODO: Navigate to history
          },
        ),
        OptionTile(
          title: 'Messages',
          icon: TablerIcons.messages,
          trailing: Badge.count(count: 2),
          onTap: () {
            // TODO: Navigate to messages
          },
        ),
        OptionTile(
          title: 'Account Settings',
          icon: TablerIcons.settings,
          onTap: () {
            // TODO: Navigate to account settings
          },
        ),
      ],
    );
  }

  Widget _buildContentList() {
    return OptionGroup(
      children: [
        OptionTile(
          title: 'Bookmarks',
          icon: TablerIcons.bookmark,
          onTap: () {
            // TODO: Navigate to bookmarks
          },
        ),
        OptionTile(
          title: 'Downloads',
          icon: TablerIcons.download,
          onTap: () {
            // TODO: Navigate to downloads
          },
        ),
      ],
    );
  }

  Widget _buildWorksList() {
    return OptionGroup(
      children: [
        OptionTile(
          title: 'My Works',
          icon: TablerIcons.pencil,
          onTap: () {
            // TODO: Navigate to works
          },
        ),
        OptionTile(
          title: 'Series',
          icon: TablerIcons.books,
          onTap: () {
            // TODO: Navigate to series
          },
        ),
        OptionTile(
          title: 'Collections',
          icon: TablerIcons.folder,
          onTap: () {
            // TODO: Navigate to collections
          },
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return OptionGroup(
      children: [
        OptionTile(
          title: 'App Settings',
          icon: TablerIcons.settings,
          routeName: SettingsActivity.routeName,
        ),
        OptionTile(
          title: 'Help & Support',
          icon: TablerIcons.help,
          onTap: () {
            // TODO: Navigate to help
          },
        ),
        OptionTile(
          title: 'About',
          icon: TablerIcons.info_circle,
          routeName: AboutActivity.routeName,
        ),
      ],
    );
  }
}
