/*
 * (C) 2024-2025, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * 
 * DUMMY API IMPLEMENTATION FOR PUBLIC REPOSITORY
 * This is a placeholder implementation that returns dummy data from placeholders.dart
 * The actual API implementation is proprietary to prevent abuse.
 */

import 'package:archiverse/models/pseud.dart';
import 'package:http/http.dart' show Response;
import 'dart:async';

export "package:archiverse/api/endpoints/autocomplete.dart";
export "package:archiverse/api/endpoints/auth.dart";
export "package:archiverse/api/endpoints/bookmarks.dart";
export "package:archiverse/api/endpoints/chapters.dart";
export "package:archiverse/api/endpoints/collections.dart";
export "package:archiverse/api/endpoints/comments.dart";
export "package:archiverse/api/endpoints/search.dart";
export "package:archiverse/api/endpoints/series.dart";
export "package:archiverse/api/endpoints/tags.dart";
export "package:archiverse/api/endpoints/users.dart";
export "package:archiverse/api/endpoints/works.dart";

// Default custom user-agent, as advised by OTW
String defaultUserAgent =
    "Archiverse/1.0 (https://archiverse.tenseventyseven.xyz) "
    "Dart/2.10 (dart:io) ";

// Priority levels for requests
enum RequestPriority {
  low(0),
  normal(1),
  high(2),
  critical(3);

  const RequestPriority(this.value);
  final int value;
}

class _DummyStorage {
  Future<String?> read({required String key}) async {
    return null;
  }

  Future<void> write({required String key, required String value}) async {
    // No-op in public API
  }
}

class Ao3Api {
  String _baseUrl = "https://example.com/"; // Placeholder base URL
  String get baseUrl => _baseUrl;
  static final Ao3Api _instance = Ao3Api.generative();

  // User information
  Pseud? _user;
  Pseud? get user => _user;

  // Storage
  _DummyStorage storage = _DummyStorage();

  Ao3Api.generative() {
    // This constructor is private to prevent instantiation
  }

  // Singleton instance
  factory Ao3Api() {
    return _instance;
  }

  Future<void> initFlutter({String? baseUrl}) async {
    // Set base URL if provided
    _baseUrl = baseUrl ?? _baseUrl;
  }

  void setUser(Pseud? user) {
    _user = user;
  }

  bool get isLoggedIn => _user != null;

  // Dummy response creation
  Response _createDummyResponse({
    int statusCode = 200,
    String body = "",
    Map<String, String>? headers,
  }) {
    return Response(body, statusCode, headers: headers ?? {});
  }

  // Dummy POST response - always throws exception for public API
  Future<Response> postResponse({
    required String path,
    Map<String, String>? query,
    Map<String, String>? body,
    Map<String, String>? headers,
    bool json = false,
    bool acceptAny = false,
    RequestPriority priority = RequestPriority.normal,
  }) async {
    throw Exception(
      'POST requests are not supported in the public API implementation',
    );
  }

  // Dummy GET response - returns placeholder HTML content
  Future<Response> getResponse({
    required String path,
    Map<String, String>? query,
    Map<String, String>? headers,
    bool refresh = false,
    bool json = false,
    RequestPriority priority = RequestPriority.normal,
    Duration cacheDuration = const Duration(hours: 12),
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 100));

    // Return dummy HTML response
    return _createDummyResponse(
      body:
          '<html><body><p>Dummy API Response for path: $path</p></body></html>',
      headers: {'content-type': 'text/html'},
    );
  }

  void addCookie(String name, String value) {
    // No-op in public API
  }

  void clearCsrfToken() {
    // No-op in public API
  }

  void clearCookies() {
    // No-op in public API
  }

  void clearFutures() {
    // No-op in public API
  }

  Future<void> clearCache() async {
    // No-op in public API
  }

  // Empty cookies for public API
  Map<String, String> get cookies => {};
}
