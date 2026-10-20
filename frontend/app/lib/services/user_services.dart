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

class AuthUserService {
static Future<void> saveUser(Map<String, dynamic> user) async {
    try {
      // Fetch if user exists in local db
      dynamic userExist = await _db.managers.user
          .filter((u) => u.userUuid.equals(user['user_uuid']))
          .getSingleOrNull();

      if (userExist != null) {
        // if user exists, update
        // print("User Exists");
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
        // print("User does not exits, creating...");
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
      // print("Saving User Error : $e");
      throw AuthException("$e");
    }
  }

  static Future<String?> loadUser(String phonenumber, String password) async {
    dynamic user = await _db.managers.user
        .filter((u) => u.phoneNumber.equals(phonenumber))
        .getSingleOrNull();
    if (user == null) throw AuthException("No Local Users Found");
    if (!verifyPassword(password, user.hashedPassword)) {
      throw AuthException("Incorrect Password");
    }
    return user.userUuid;
  }
}

class UserService {
  static Stream<Map<String, dynamic>?> watchUserData(String? userUUID) {
    return _db.managers.userData
        .filter((userData) => userData.userUuid.equals(userUUID))
        .watchSingleOrNull()
        .map((userData) {
          if (userData != null) {
            // print("Successfully Fetched USerData");
            return {
              "height": userData.height,
              "weight": userData.weight,
              "bloodtype": userData.bloodType,
              "birthdate": userData.birthdate,
            };
          }
          // print("Failed to Fetch UserData");
          return null;
        });
  }

  static Stream<Map<String, dynamic>?> watchUserInfo(String? userUUID) {
    return _db.managers.user
        .filter((user) => user.userUuid.equals(userUUID))
        .watchSingleOrNull()
        .map((user) {
          if (user != null) {
            // print("Successfully fetched userinfo");
            return {"name": user.fullName, "phonenumber": user.phoneNumber};
          }
          // print("Failed to fetch userdata");
          return null;
        });
  }

  static Stream<Map<String, dynamic>?> watchUserAllergies(String? userUUID) {
    return _db.managers.userAllergies
        .filter((allergy) => allergy.userUuid.equals(userUUID))
        .watch()
        .map((allergy) {
          if (allergy != []) {
            print("Loaded Allergies Successfully");
            return {for (var item in allergy) item.name: item.severity};
          }
          print("Failed or no User Allergies");
          return null;
        });
  }
}

class UserEditService {
  static Future<bool> saveUserAllergies(
    String userUUID,
    String allergyName,
    String severity,
  ) async {
    try {
      await _db.managers.userAllergies.create(
        (allergy) =>
            allergy(userUuid: userUUID, name: allergyName, severity: severity),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> deleteUserAllergy(String userUUID, String name) async {
    try{
      await _db.managers.userAllergies
      .filter((allergy) => allergy.userUuid.equals(userUUID) & allergy.name.equals(name)).delete();
    }catch(e){
      print(e);
    }

  }

  static Future<void> saveUserData(
    String fullname,
    String phonenumber,
    DateTime? birthdate,
    String? blood,
    double? weight,
    double? height,
    String userUUID,
  ) async {
    try {
      //saev user info
      await _db.managers.user
          .filter((u) => u.userUuid.equals(userUUID))
          .update(
            (user) => user(
              fullName: Value(fullname),
              phoneNumber: Value(phonenumber),
            ),
          );
      // create or save userdata
      bool dataExists = await _db.managers.userData
          .filter((userData) => userData.userUuid.equals(userUUID))
          .exists();

      if (dataExists) {
        await _db.managers.userData
            .filter((u) => u.userUuid.equals(userUUID))
            .update(
              (userData) => userData(
                birthdate: Value(birthdate),
                bloodType: Value(blood),
                weight: Value(weight),
                height: Value(height),
              ),
            );
      } else {
        await _db.managers.userData.create(
          (userData) => userData(
            userUuid: userUUID,
            birthdate: Value(birthdate),
            bloodType: Value(blood),
            weight: Value(weight),
            height: Value(height),
          ),
        );
      }
    } catch (e) {
      // print("database Error: $e");
    }
  }
}
