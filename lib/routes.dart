/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:flutter/material.dart';

import 'package:archiverse/views/activity_home.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeActivity(),
    // Add more routes here as needed
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String? name = settings.name;
    if (name == null) return null;

    switch (name) {
      default:
        return null;
    }
  }
}
