/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:archiverse/routes.dart';
import 'package:archiverse/theme.dart';
import 'package:archiverse/strings/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:relative_time/relative_time.dart';

void main() async {
  // Initialize the Ao3Api instance
  await Ao3Api().initFlutter();

  // Initialize the preferences provider
  final preferences = PreferencesProvider();
  final user = UserProvider();

  // Initialize providers
  await preferences.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => preferences),
        ChangeNotifierProvider(create: (_) => user),
      ],
      child: const Archiverse(),
    ),
  );
}

class Archiverse extends StatelessWidget {
  const Archiverse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archiverse',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        RelativeTimeLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: AppRoutes.routes,
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    );
  }
}
