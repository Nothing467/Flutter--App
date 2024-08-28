import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _user;

  bool get isLoggedIn => _isLoggedIn;
  String? get user => _user;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _user = prefs.getString('user');
    _isLoggedIn = _user != null;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    // Simulating login logic
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call

    // For demonstration, any email and password combination is considered valid
    _user = email;
    _isLoggedIn = true;

    // Save user info to local storage
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', email);

    notifyListeners();
    return true;
  }

  Future<bool> register(String email, String password) async {
    // Simulating registration logic
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call

    // For demonstration, any email and password combination is considered valid
    _user = email;
    _isLoggedIn = true;

    // Save user info to local storage
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', email);

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _user = null;
    _isLoggedIn = false;

    // Remove user info from local storage
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');

    notifyListeners();
  }
}
