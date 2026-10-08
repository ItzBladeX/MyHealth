import 'package:app/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  static bool isValidPhoneNumber(String phoneNumber) {
    final normalizedPhone = phoneNumber.trim();
    return RegExp(r'^\+251[97]\d{8}$').hasMatch(normalizedPhone);
  }

  static bool isValidPassword(String password) => password.trim().length > 4;

  static Future<Map<String, dynamic>> loginUser(
    String phonenumber,
    String password,
  ) async {
    // if (!isValidPhoneNumber(phonenumber) || !isValidPassword(password)) {
    //   throw ArgumentError(
    //     'Use a valid phone number: +2519xxxxxxxx or +2517xxxxxxxx, and a password longer than 4 characters.',
    //   );
    // }

    final url = Uri.parse(AppConstants.login);

    try {
      final response = await http
          .post(url, body: {'username': phonenumber, 'password': password})
          .timeout(const Duration(seconds: 5));

      final Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        return data;
      } else {
        throw AuthException("Fetch Error");
      }
    } catch (e) {
      print('Connection error: $e');
      throw AuthException("$e");
    }
  }

  static Future<Map<String, dynamic>> registerUser(
    String fullname,
    String phonenumber,
    String password,
  ) async {
    final url = Uri.parse(AppConstants.createAccount);

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'fullname': fullname,
              'phonenumber': phonenumber,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 5));

      final Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        return data;
      } else {
        throw AuthException("Fetch Error");
      }
    } catch (e) {
      print('Connection error: $e');
      throw AuthException("$e");
    }
  }
}
