/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/routes.dart';
import 'package:archiverse/theme.dart';
import 'package:archiverse/strings/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:relative_time/relative_time.dart';

void main() {
  // Ensure widgets have been initialized
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  runApp(const Archiverse());
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
