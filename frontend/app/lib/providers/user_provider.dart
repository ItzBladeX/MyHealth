import 'package:app/services/user_services.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'dart:async';

class UserException implements Exception {
  final String message;
  UserException(this.message);

  @override
  String toString() => message;
}

class UserProvider extends ChangeNotifier {
  String? userUUID = authProvider.userUUID;

  Map<String, dynamic>? _userInfo;
  Map<String, dynamic>? _userData;
  Map<String, dynamic>? _userAllergies;

  Map<String, dynamic>? get userInfo => _userInfo;
  Map<String, dynamic>? get userData => _userData;
  Map<String, dynamic>? get userAllergies => _userAllergies;

  StreamSubscription<Map<String, dynamic>?>? _userInfoSubscription;
  StreamSubscription<Map<String, dynamic>?>? _userDataSubscription;
  StreamSubscription<Map<String, dynamic>?>? _userAllergiesSubscription;

  UserProvider() {
    loadUserInfo();
    loadUserdata();
    loadUserAllergies();
  }

  Future<void> loadUserdata() async {
    _userDataSubscription?.cancel();
    _userDataSubscription = UserService.watchUserData(userUUID).listen((data) {
      _userData = data;
      notifyListeners();
    });
  }

  Future<void> loadUserInfo() async {
    _userInfoSubscription?.cancel();
    _userInfoSubscription = UserService.watchUserInfo(userUUID).listen((data) {
      _userInfo = data;
      notifyListeners();
    });
  }

  Future<void> loadUserAllergies() async {
    _userAllergiesSubscription?.cancel();
    _userAllergiesSubscription = UserService.watchUserAllergies(userUUID)
        .listen((data) {
          _userAllergies = data;
          notifyListeners();
        });
  }

  Future<bool> saveUserAllergies(
    String userUUID,
    String allergyName,
    String severity,
  ) async {
    try {
      if (userUUID == '') throw UserException("Invalid UserUUID");
      if (allergyName == "") throw UserException("allergyName cant be None");
      if (severity == "") throw UserException("severity Number Cant be None");
      bool success = await UserEditService.saveUserAllergies(userUUID, allergyName, severity);

      if (!success) throw ("Duplicate Data");
      notifyListeners();
      return true;
    } catch (e) {
      
      print(e);
      return false;
    }
  }

  Future<bool> deleteUserAllergy(String userUUID, String name) async {
    try{
      if (userUUID == '') throw UserException("Invalid UserUUID");
      if (name == "") throw UserException("Name cant be None");

      UserEditService.deleteUserAllergy(userUUID, name);
      notifyListeners();
      return true;
    }catch(e){
      return false;
    }

  }

  Future<bool> saveUserData(
    String newName,
    String newPhonenumber,
    DateTime? birthdate,
    String? bloodtype,
    double? weight,
    double? height,
    String userUUID,
  ) async {
    try {
      if (userUUID == '') throw UserException("Invalid UserUUID");
      if (newName == "") throw UserException("Name cant be None");
      if (newPhonenumber == "") throw UserException("Phone Number Cant be None");
      UserEditService.saveUserData(
        newName,
        newPhonenumber,
        birthdate,
        bloodtype,
        weight,
        height,
        userUUID,
      );
      notifyListeners();
      return true;
    } catch (e) {
      // print(e);
    }
    return false;
  }

  @override
  void dispose() {
    _userInfoSubscription?.cancel();
    super.dispose();
  }
}
