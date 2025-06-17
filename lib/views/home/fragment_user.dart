import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:archiverse/utils.dart';
import 'package:archiverse/views/activity_about.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_onboarding.dart';
import 'package:archiverse/views/activity_settings.dart';
import 'package:archiverse/views/activity_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserFragment extends StatefulWidget {
  const UserFragment({Key? key}) : super(key: key);

  @override
  State<UserFragment> createState() => _UserFragmentState();
}

class _UserFragmentState extends State<UserFragment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.user;

        return NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[_buildAppBar(userProvider, user)];
          },
          body: RefreshIndicator(
            notificationPredicate: user != null ? (_) => true : (_) => false,
            onRefresh: () => _onRefresh(userProvider),
            displacement: 20.0,
            elevation: 0.0,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: context.horizontalPadding,
                  sliver: SliverList.list(
                    children: [
                      if (user != null) ...[
                        _buildContentList(),
                        SizedBox(height: context.commonPaddingHalf / 2),
                        _buildWorksList(),
                        SizedBox(height: context.commonPaddingHalf / 2),
                      ],
                      _buildSettingsList(),
                      if (user != null) ...[
                        SizedBox(height: context.commonPaddingHalf / 2),
                        _buildAccountList(),
                      ],
                      SizedBox(height: context.commonPaddingHalf),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(UserProvider userProvider) async {
    // Refresh user data if signed in
    if (userProvider.user != null) {
      await userProvider.refresh();
    }
  }

  Widget _buildAppBar(UserProvider provider, Pseud? user) {
    return SliverAppBar.large(
      title: Text(user?.name ?? 'User'),
      centerTitle: true,
      expandedHeight: context.screenHeight * 0.3,
      shape: const RoundedRectangleBorder(),
      flexibleSpace: FlexibleSpaceBar(
        background: Skeletonizer(
          enabled: provider.isFetching,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.commonPaddingHalf,
              vertical: context.commonPaddingDouble,
            ),
            child: _buildExpandedHeader(provider, user),
          ),
        ),
      ),
      actions: const [],
    );
  }

  Widget _buildExpandedHeader(UserProvider provider, Pseud? user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(right: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8.0,
            children: [
              // User avatar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Skeleton.leaf(child: _buildUserImage(user)),
              ),

              // User info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _getUserName(user),
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      _buildUserActions(user),
                    ],
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(
            TablerIcons.chevron_right,
            size: 24,
            color: context.colorScheme.onSurface.withAlpha(150),
          ),
          onTap: () => _handleUserTap(user),
        ),
      ],
    );
  }

  void _handleUserTap(Pseud? user) {
    if (user != null) {
      context.navigator.pushNamed(AuthorActivity.routeName, arguments: user);
    } else {
      context.navigator.pushNamed(SignInActivity.routeName);
    }
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
          title: 'Works',
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
            context.navigator.pushNamed(OnboardingActivity.routeName);
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

  Widget _buildAccountList() {
    return OptionGroup(
      children: [
        OptionTile(
          title: 'Account Settings',
          icon: TablerIcons.user_cog,
          onTap: () {
            // TODO: Navigate to account settings
          },
        ),
        OptionTile(
          title: 'Sign Out',
          icon: TablerIcons.logout,
          onTap: () {
            _showSignOutDialog();
          },
        ),
      ],
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            TablerIcons.logout,
            size: 28.0,
            color: context.colorScheme.secondary,
          ),
          title: const Text('Sign out of your account?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'You\'ll need to sign in again to access your subscriptions, bookmarks, and other personal content.',
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 48.0,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          context.read<UserProvider>().signOut();
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: const Text('Sign out'),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      height: 48.0,
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserImage(Pseud? user) {
    Widget userImage;

    if (user == null) {
      userImage = Icon(
        TablerIcons.user_question,
        size: 52,
        color: context.colorScheme.onPrimaryContainer,
      );
    } else {
      userImage = UserImage(context: context, user: user, size: 52);
    }

    return Skeleton.leaf(child: CircleAvatar(radius: 48, child: userImage));
  }

  String _getUserName(Pseud? user) {
    return user?.name ?? 'Not signed in';
  }

  Widget _buildUserActions(Pseud? user) {
    if (user == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          "Sign in to your account to access more features",
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurface.withAlpha(150),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Skeleton.replace(
            replacement: const SizedBox.shrink(),
            child: Icon(
              TablerIcons.calendar,
              size: 16,
              color: context.colorScheme.onSurface.withAlpha(150),
            ),
          ),
          Skeleton.replace(
            replacement: const SizedBox.shrink(),
            child: const SizedBox(width: 6),
          ),
          Text(
            "Joined ${AppUtils.formatDate(context, user.joinDate!)}",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.onSurface.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }
}
