import 'package:app/database/get_db.dart';
import 'package:drift/drift.dart';
import "package:app/utils/cryptography.dart";

final _db = getdb;

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class UserService {
  static Future<void> saveUser(Map<String, dynamic> user) async {
    try {
      // Fetch if user exists in local db
      dynamic userExist = await _db.managers.user
          .filter((u) => u.userUuid.equals(user['user_uuid']))
          .getSingleOrNull();

      if (userExist != null) {
        // if user exists, update
        print("User Exists");
        await _db.managers.user
            .filter((u) => u.userUuid.equals(user["user_uuid"]))
            .update(
              (u) => u(
                fullName: Value(user["fullname"]),
                phoneNumber: Value(user['phonenumber']),
                hashedPassword: Value(user['hashed_password']),
              ),
            );
      } else {
        // if user doesnt exist, create user
        print("User does not exits, creating...");
        await _db.managers.user.create(
          (u) => u(
            userUuid: user['user_uuid'],
            fullName: user['fullname'],
            phoneNumber: Value(user['phonenumber']),
            hashedPassword: user["hashed_password"],
          ),
        );
      }
    } catch (e) {
      print("Saving User Error : $e");
      throw AuthException("$e");
    }
  }

  static Future<String?> loadUser(String phonenumber, String password) async {
    dynamic user = await _db.managers.user
        .filter((u) => u.phoneNumber.equals(phonenumber))
        .getSingleOrNull();
    if (user == null) throw AuthException("No Local Users Found");
    if (!verifyPassword(password, user.hashedPassword)){
      throw AuthException("Incorrect Password");
    }
    return user.userUuid;
  }
}
