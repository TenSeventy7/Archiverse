/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */

import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/theming.dart';
import 'package:archiverse/providers/provider_preferences.dart';
import 'package:archiverse/providers/provider_theme.dart';
import 'package:archiverse/providers/provider_user.dart';
import 'package:archiverse/routes.dart';
import 'package:archiverse/strings/app_localizations.dart';
import 'package:dynamic_color/dynamic_color.dart';
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
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
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
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            bool isDynamic = provider.appColorScheme == AppColorScheme.dynamic;

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
              theme: provider.getThemeData(
                context.textTheme,
                isDynamic ? lightDynamic : provider.lightColorScheme,
              ),
              darkTheme: provider.getThemeData(
                context.textTheme,
                isDynamic ? darkDynamic : provider.darkColorScheme,
              ),
              themeMode: provider.themeMode,
              initialRoute: '/',
              routes: AppRoutes.routes,
              onGenerateRoute: (settings) =>
                  AppRoutes.onGenerateRoute(settings),
            );
          },
        );
      },
    );
  }
}
