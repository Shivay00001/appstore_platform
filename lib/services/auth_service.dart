import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthService {
  Future<bool> login(String email, String password);
  Future<void> logout();
  bool get isAuthenticated;
}

class MockAuthService implements AuthService {
  bool _isLoggedIn = false;

  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _isLoggedIn = true;
    return true;
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
  }

  @override
  bool get isAuthenticated => _isLoggedIn;
}

final authServiceProvider = Provider<AuthService>((ref) => MockAuthService());
