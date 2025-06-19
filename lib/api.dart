/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/api/ao3_api_impl.dart';

// Re-export everything so callers can use the extension methods directly
export 'package:archiverse/api/ao3_api.dart';

class AppApi extends Ao3Api {
  static final AppApi _instance = AppApi._internal();
  late final Ao3ApiImpl _ao3Api;

  AppApi._internal() : super.generative() {
    _ao3Api = Ao3ApiImpl();
  }

  factory AppApi() => _instance;
}
