/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/components/expressive/nested_scroll_view.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/option_group.dart';
import 'package:archiverse/components/option_tile.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutActivity extends CommonActivity {
  static const String routeName = '/about';

  const AboutActivity({Key? key}) : super(key: key);

  @override
  State<AboutActivity> createState() => _AboutActivityState();
}

class _AboutActivityState extends State<AboutActivity> {
  String appVersion = '1.0.0';
  String appName = 'Archiverse';

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    // final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      // appVersion = '${packageInfo.version} (${packageInfo.buildNumber})';
    });
  }

  Future<void> _launchUrl(String url) async {
    // if (await canLaunch(url)) {
    // await launch(url);
    // }
  }

  @override
  String get title => 'About';

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      body: (controller) => ExpressiveNestedScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled, controller) {
          return <Widget>[
            ExpressiveSliverAppBar.large(
              controller: controller,
              title: Text(title),
              expandedHeight: context.screenHeight * 0.4,
              flexibleSpace: (controller, opacity) => FlexibleSpaceBar(
                background: Material(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: context.screenPadding.top),
                      const CircleAvatar(
                        radius: 50,
                        // backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        appName,
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        appVersion,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: context.horizontalPadding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildAppInfo(),
                  SizedBox(height: context.commonPaddingHalf),
                  _buildDeveloperInfo(),
                  SizedBox(height: context.commonPaddingHalf),
                  _buildLicenseInfo(),
                  SizedBox(height: context.commonPaddingHalf),
                  _buildCommunityLinks(),
                  SizedBox(height: context.commonPadding),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppInfo() {
    return OptionGroup(
      title: 'About Archiverse',
      children: [
        OptionTile(
          title: 'What is Archiverse?',
          icon: TablerIcons.info_circle,
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('About Archiverse'),
                  content: const Text(
                    'Archiverse is an unofficial mobile client for Archive of Our Own (AO3), '
                    'designed to enhance your reading experience on mobile devices.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        OptionTile(
          title: 'Check for Updates',
          icon: TablerIcons.refresh,
          onTap: () {
            // TODO: Implement update check
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No updates available')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDeveloperInfo() {
    return OptionGroup(
      title: 'Developer',
      children: [
        OptionTile(
          title: 'John Vincent Corcega',
          subtitle: '@TenSeventy7',
          icon: TablerIcons.user_circle,
          onTap: () => _launchUrl('https://github.com/TenSeventy7'),
        ),
      ],
    );
  }

  Widget _buildLicenseInfo() {
    return OptionGroup(
      title: 'Legal',
      children: [
        OptionTile(
          title: 'Open Source Licenses',
          icon: TablerIcons.license,
          onTap: () {
            showLicensePage(
              context: context,
              applicationName: appName,
              applicationVersion: appVersion,
            );
          },
        ),
        OptionTile(
          title: 'Privacy Policy',
          icon: TablerIcons.shield_lock,
          onTap: () =>
              _launchUrl('https://tenseventyseven.xyz/archiverse/privacy'),
        ),
        OptionTile(
          title: 'Terms of Service',
          icon: TablerIcons.file_text,
          onTap: () =>
              _launchUrl('https://tenseventyseven.xyz/archiverse/terms'),
        ),
        OptionTile(
          title: 'Source Code',
          subtitle: 'GNU AGPL 3.0',
          icon: TablerIcons.brand_github,
          onTap: () => _launchUrl('https://github.com/TenSeventy7/Archiverse'),
        ),
      ],
    );
  }

  Widget _buildCommunityLinks() {
    return OptionGroup(
      title: 'Community',
      children: [
        OptionTile(
          title: 'Report an Issue',
          icon: TablerIcons.bug,
          onTap: () =>
              _launchUrl('https://github.com/TenSeventy7/Archiverse/issues'),
        ),
        OptionTile(
          title: 'Website',
          icon: TablerIcons.world,
          onTap: () => _launchUrl('https://tenseventyseven.xyz/archiverse'),
        ),
      ],
    );
  }
}
