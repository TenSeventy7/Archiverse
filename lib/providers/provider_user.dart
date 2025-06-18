import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  /// Ao3 API instance
  final Ao3Api _api = Ao3Api();

  /// User state
  Pseud? _user;
  Pseud? get user => _user;

  bool _isFetching = true;
  bool get isFetching => _isFetching;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool get isLoadingError => _isSignedIn && _user == null && !_isFetching;

  /// Constructor
  UserProvider() {
    // Initialize the user state when the provider is created
    _isFetching = true;
    initializeUser();
  }

  /// Attempt to load user information
  Future<void> initializeUser() async {
    String? username = await _api.storage.read(key: "username");

    if (username == null) {
      _user = null;
      _isFetching = false;
      notifyListeners();
      return;
    }

    _isSignedIn = true;

    try {
      _user = await _api.getUserInfo(username, firstTime: true);
      _api.setUser(_user);
      _isFetching = false;
      notifyListeners();
    } catch (e) {
      // Handle error, e.g., user not found or network issue
      _user = null;
      _isFetching = false;
      notifyListeners();
    }
  }

  /// Sign in a user with the provided credentials
  Future<Pseud?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      _user = await _api.signIn(username, password);
      notifyListeners();

      // Save the username in secure storage for future use
      await _api.storage.write(key: "username", value: _user!.name);

      return _user;
    } catch (e) {
      // Handle error, e.g., invalid credentials
      return null;
    }
  }

  /// Sign out the current user
  Future<bool> signOut() async {
    bool result = await _api.signOut();
    if (result) {
      _user = null;
      notifyListeners();
    }
    return result;
  }

  /// Refresh the user information
  Future<void> refresh() async {
    if (_user == null) {
      return;
    }
    _isFetching = true;
    notifyListeners();
    try {
      // Fetch the latest user information
      _user = await _api.getUserInfo(user?.name, refresh: true);
      _api.setUser(_user);
    } catch (e) {
      // Handle error, e.g., network issue
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
