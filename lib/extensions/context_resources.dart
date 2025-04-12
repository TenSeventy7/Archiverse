
/*
 * (C) 2024, John Vincent Corcega <flutter@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * This extends Flutter's BuildContext class to bring resource fetching
 * in the same way as Android's Context class.
 */
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ResourcesBuildContextExtension on BuildContext {
  String _getResource(
    String resource, {
    required String path,
    bool hasDark = true,
  }) {
    return "assets/${(hasDark && isDarkMode) ? '$path-night' : path}/$resource";
  }

  Future<bool> _resourceExists(
    String resource, {
    required String path,
    bool hasDark = true,
  }) async {
    try {
      await rootBundle.load(_getResource(
        resource,
        path: path,
        hasDark: hasDark,
      ));
      return true;
    } catch (e) {
      return false;
    }
  }

  String getDrawable(String resource, {bool hasDark = true}) {
    return _getResource(resource, path: "drawable", hasDark: hasDark);
  }

  String getRawResource(String resource, {bool hasDark = true}) {
    return _getResource(resource, path: "raw", hasDark: hasDark);
  }

  Future<bool> drawableExists(String resource, {bool hasDark = true}) async {
    return await _resourceExists(resource, path: "drawable", hasDark: hasDark);
  }

  Future<bool> rawResourceExists(String resource, {bool hasDark = true}) async {
    return await _resourceExists(resource, path: "raw", hasDark: hasDark);
  }
}

