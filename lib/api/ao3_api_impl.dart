/*
 * (C) 2025, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * DUMMY API IMPLEMENTATION FOR PUBLIC REPOSITORY
 * This is a placeholder implementation that returns dummy data from placeholders.dart
 * The actual API implementation is proprietary to prevent abuse.
 */

import 'package:archiverse/api/ao3_api.dart';

class Ao3ApiImpl extends Ao3Api {
  static final Ao3ApiImpl _instance = Ao3ApiImpl._internal();

  Ao3ApiImpl._internal() : super.generative();

  factory Ao3ApiImpl() => _instance;
}
