import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  SharedPreferences? _preferences;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (!_isInitialized) {
      _preferences = await SharedPreferences.getInstance();
      _isInitialized = true;
      notifyListeners();
    }
  }

  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'PreferencesProvider not initialized. Call initialize() first.',
      );
    }
  }

  // String operations
  String? getString(String key, {String? defaultValue}) {
    _ensureInitialized();
    return _preferences?.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) async {
    _ensureInitialized();
    final result = await _preferences?.setString(key, value) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Int operations
  int getInt(String key, {int defaultValue = 0}) {
    _ensureInitialized();
    return _preferences?.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) async {
    _ensureInitialized();
    final result = await _preferences?.setInt(key, value) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Double operations
  double getDouble(String key, {double defaultValue = 0.0}) {
    _ensureInitialized();
    return _preferences?.getDouble(key) ?? defaultValue;
  }

  Future<bool> setDouble(String key, double value) async {
    _ensureInitialized();
    final result = await _preferences?.setDouble(key, value) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Bool operations
  bool getBool(String key, {bool defaultValue = false}) {
    _ensureInitialized();
    return _preferences?.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) async {
    _ensureInitialized();
    final result = await _preferences?.setBool(key, value) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // StringList operations
  List<String>? getStringList(String key, {List<String>? defaultValue}) {
    _ensureInitialized();
    return _preferences?.getStringList(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    _ensureInitialized();
    final result = await _preferences?.setStringList(key, value) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Check if key exists
  bool containsKey(String key) {
    _ensureInitialized();
    return _preferences?.containsKey(key) ?? false;
  }

  // Remove key
  Future<bool> remove(String key) async {
    _ensureInitialized();
    final result = await _preferences?.remove(key) ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Clear all preferences
  Future<bool> clear() async {
    _ensureInitialized();
    final result = await _preferences?.clear() ?? false;
    if (result) notifyListeners();
    return result;
  }

  // Get all keys
  Set<String> getKeys() {
    _ensureInitialized();
    return _preferences?.getKeys() ?? <String>{};
  }

  // Reload preferences
  Future<void> reload() async {
    _ensureInitialized();
    await _preferences?.reload();
    notifyListeners();
  }
}
