import 'package:app/services/auth_services.dart';
import 'package:app/services/user_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? userUUID = "20d849e4-99a2-492b-b9d5-56f398e57734"; //TODO: Remove this, only for testing purposes
  String? _token;
  String? get token => _token;

  bool isLoggedIn() {
    return userUUID != null || _token != null;
  }

  Future<void> loadSession() async {
    _token = await AuthStorage.getToken();
    notifyListeners();
  }

  Future<bool> loginUser(String phonenumber, String password) async {
    try {
      final Map<String, dynamic> response = await AuthService.loginUser(
        phonenumber,
        password,
      );
      final String? token = response['access_token'];

      if (token == null || token.isEmpty) {
        throw AuthException('Missing access token');
      }

      _token = token;
      await AuthStorage.saveToken(token);
      print('Token Saved');
      print('Access Token: $token');

      final dynamic userData = response['user_data'];
      if (userData != null) {
        await UserService.saveUser(userData);
      }
    } catch(e){
      print("Network Error $e" );
    }
    try{

      userUUID = await UserService.loadUser(phonenumber, password);
      print('UUID set to $userUUID');
      notifyListeners();
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> createAccount(
    String fullName,
    String phonenumber,
    String password,
  ) async {
    try {
      final Map<String, dynamic> response = await AuthService.registerUser(
        fullName,
        phonenumber,
        password,
      );

      if (response['access_token'] == null) {
        throw AuthException(
          'Account creation succeeded but no token was returned',
        );
      }

      return await loginUser(phonenumber, password);
    } catch (e) {
      print('Create account error: $e');
      return false;
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class AuthStorage {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
