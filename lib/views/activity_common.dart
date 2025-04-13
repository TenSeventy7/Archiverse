/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import 'package:flutter/material.dart';

/* Why this nomenclature?
 * Simple. Android. I'm very used to how Android activities work
 * and I want to keep the same nomenclature for Flutter.
 * 
 * Hence, *Activity, activity_*, and fragment_* names.
 * 
 * This is a common base class for all activities in the app.
 * It provides a common interface for all activities and
 * allows for easy navigation between them.
 */
abstract class CommonActivity extends StatefulWidget {
  // This forces subclasses to define their own routeName
  static String get routeName =>
      throw UnimplementedError('All activities must define a routeName');

  const CommonActivity({super.key});

  @override
  State<CommonActivity> createState();
}

abstract class CommonStatelessActivity extends StatelessWidget {
  // This forces subclasses to define their own routeName
  static String get routeName =>
      throw UnimplementedError('All activities must define a routeName');

  const CommonStatelessActivity({super.key});
}
