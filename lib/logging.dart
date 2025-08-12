import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';

class AppLog {
  // Singleton instance
  static final AppLog _instance = AppLog._internal();
  Logger log = Logger("TNS-Archiverse");

  factory AppLog() {
    return _instance;
  }

  AppLog._internal();
  void initFlutter() {
    Logger.root.level = Level.ALL; // Set default log level

    // If Android platform, output to logcat
    if (Platform.isAndroid) {
      Logger.root.activateLogcat();
    }
  }

  // Just mirrors of the Android Log APIs for usability since I'm way too used to them
  void v(String message, {String tag = "app"}) {
    log.fine("[$tag]: $message");
  }

  void d(String message, {String tag = "app"}) {
    if (kDebugMode) {
      log.info("[$tag]: $message");
    }
  }

  void i(String message, {String tag = "app"}) {
    log.info("[$tag]: $message");
  }

  void w(String message, {String tag = "app"}) {
    log.warning("[$tag]: $message");
  }

  void e(String message, {String tag = "app"}) {
    log.severe("[$tag]: $message");
  }
}
