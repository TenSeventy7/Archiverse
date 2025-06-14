import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:archiverse/views/activity_about.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_settings.dart';
import 'package:archiverse/views/activity_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

class UserFragment extends StatefulWidget {
  const UserFragment({Key? key}) : super(key: key);

  @override
  State<UserFragment> createState() => _UserFragmentState();
}

class _UserFragmentState extends State<UserFragment> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return _buildAppBar(userProvider);
            },
          ),
        ];
      },
      body: Consumer(
        builder: (context, UserProvider provider, child) {
          Pseud? user = provider.user;

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Cards of options
              SliverPadding(
                padding: context.horizontalPadding,
                sliver: SliverList.list(
                  children: [
                    if (user != null) ...[
                      _buildUserList(),
                      SizedBox(height: context.commonPaddingHalf),
                      _buildContentList(),
                      SizedBox(height: context.commonPaddingHalf),
                      _buildWorksList(),
                      SizedBox(height: context.commonPaddingHalf),
                    ],
                    _buildSettingsList(),
                    SizedBox(height: context.commonPadding),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar(UserProvider provider) {
    Pseud? user = provider.user;

    return SliverAppBar.large(
      title: Text(user?.name ?? 'User'),
      centerTitle: true,
      expandedHeight: context.screenHeight * 0.4,
      shape: RoundedRectangleBorder(),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.screenPadding.top),
            _buildUserImage(context, provider),
            SizedBox(height: context.commonPadding * 2),
            ..._buildHeaderBottom(context, provider),
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

  Widget _buildUserImage(BuildContext context, UserProvider provider) {
    Pseud? user = provider.user;
    ImageProvider<Object>? placeholder;
    Widget? userImage;

    if (user == null) {
      // If user is not signed in, return a placeholder image
      placeholder = NetworkImage('https://placehold.co/200.jpg');
    } else {
      // If user is signed in, use the user's image
      userImage = UserImage(context: context, user: user, size: 52);
    }

    return CircleAvatar(
      radius: 52,
      backgroundImage: placeholder,
      child: userImage,
    );
  }

  List<Widget> _buildHeaderBottom(BuildContext context, UserProvider provider) {
    Pseud? user = provider.user;
    if (user == null) {
      // If user is not signed in, show sign-in button
      return [
        FilledButton.tonal(
          onPressed: () {
            Navigator.pushNamed(context, SignInActivity.routeName);
          },
          child: const Text('Sign in'),
        ),
      ];
    } else {
      // If user is signed in, show username and sign-out button
      return [
        Text(
          user.name,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.commonPaddingHalf * 2),
        FilledButton.tonal(
          onPressed: () {
            context.navigator.pushNamed(
              AuthorActivity.routeName,
              arguments: user,
            );
          },
          child: const Text('View Profile'),
        ),
      ];
    }
  }
}
