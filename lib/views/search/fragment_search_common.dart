/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU AGPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: AGPL-3.0-or-later
 */
import 'package:flutter/material.dart';

abstract class CommonSearchFragment extends StatefulWidget {
  static String get routeName =>
      throw UnimplementedError('All fragments must define a routeName');

  const CommonSearchFragment({super.key});
}

abstract class CommonStatelessSearchFragment extends StatelessWidget {
  static String get routeName =>
      throw UnimplementedError('All fragments must define a routeName');

  const CommonStatelessSearchFragment({super.key});
}
