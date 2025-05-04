import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repo/auth_repo.dart';

class AuthhProvider extends ChangeNotifier {
  final FirebaseAuthRepo _authService = FirebaseAuthRepo();

  User? _user;
  User? get user => _user;

  bool get isAuthenticated => _user != null;

  bool loginLoader = false;
  bool signUpLoader = false;

  AuthhProvider() {
    _authService.userStream.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    loginLoader = true;
    notifyListeners();

    await _authService.signIn(email, password);

    loginLoader = false;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    signUpLoader = true;
    notifyListeners();

    await _authService.signUp(email, password);

    signUpLoader = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
