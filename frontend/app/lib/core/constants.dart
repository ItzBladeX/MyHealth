// lib/constants.dart
import 'package:flutter/material.dart';


abstract class AppConstants {
  static const String baseUrl = 'http://127.0.0.1:8000/auth';
  static const String login = "$baseUrl/login";
  static const String createAccount = "$baseUrl/create_account";
}



abstract class ColorConstants{
  static const Color basecolor = Color(0xFF00685F);
  static const Color shadowColor = Colors.white70;
  static const Color shadowColor2 = Color(0xFFE5EEFF);
  static const Color pageBackground = Color(0xFFF8F9FF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color darkBlue = Color(0xFF006194);
  static const Color lightBlue = Color(0xFFE5EEFF);
  static const Color shadowColor3 = Color(0XFFDCE9FF);
  static const Color redBackground = Color(0xFFFFDAD6);
  static const Color redText = Color(0xFF93000A);
}