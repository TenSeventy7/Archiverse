import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  /// Ao3 API instance
  final Ao3Api _api = Ao3Api();

  /// User state
  Pseud? _user;
  Pseud? get user => _user;

  /// Constructor
  UserProvider() {
    // Initialize the user state when the provider is created
    initializeUser();
  }

  /// Attempt to load user information
  Future<void> initializeUser() async {
    String? username = await _api.storage.read(key: "username");

    print("Initializing user with username: $username");

    if (username == null) {
      _user = null;
      notifyListeners();
      return;
    }

    try {
      _user = await _api.getUser(Pseud(name: username, pseud: username));
      _api.setUser(_user);
      notifyListeners();
    } catch (e) {
      // Handle error, e.g., user not found or network issue
      print("Error loading user: $e");
      _user = null;
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
      return _user;
    } catch (e) {
      // Handle error, e.g., invalid credentials
      print("Error signing in: $e");
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
}
