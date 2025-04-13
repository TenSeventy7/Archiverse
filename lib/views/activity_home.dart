/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:archiverse/views/home/fragment_discover.dart';
import 'package:archiverse/views/home/fragment_library.dart';
import 'package:archiverse/views/home/fragment_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomeActivity extends CommonActivity {
  static const String routeName = '/';
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _selectedTabIndex = 0;
  late List<Widget> _fragments;

  @override
  void initState() {
    super.initState();

    _fragments = [DiscoverFragment(), LibraryFragment(), UserFragment()];
  }

  @override
  Widget build(BuildContext context) {
    context.setNavigationBarColor(Colors.transparent);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Durations.long3,
        switchInCurve: const Cubic(0.2, 0.0, 0, 1.0),
        switchOutCurve: const Cubic(0.2, 0.0, 0, 1.0),
        child: _fragments[_selectedTabIndex],
      ),
      bottomNavigationBar: _buildNavigation(),
    );
  }

  Widget _buildNavigation() {
    return NavigationBar(
      selectedIndex: _selectedTabIndex,
      onDestinationSelected: _animateToPage,
      destinations: const <NavigationDestination>[
        NavigationDestination(icon: Icon(TablerIcons.home), label: 'Discover'),
        NavigationDestination(icon: Icon(TablerIcons.book), label: 'Library'),
        NavigationDestination(icon: Icon(TablerIcons.user), label: 'Me'),
      ],
    );
  }

  void _animateToPage(int page) {
    setState(() {
      _selectedTabIndex = page;
    });
  }
}
