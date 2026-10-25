import 'package:flutter/material.dart';

class FormTheme {
  static const Color primaryGreen = Color(0xFF00695C); // Emerald accent color
  static const Color backgroundColor = Color(0xFFF9F9F9);
  static const Color borderGrey = Color(0xFFE0E0E0);
  
  // Fixed the spelling error here:
  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  
  static TextStyle labelStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xFF616161),
    letterSpacing: 0.5,
  );
}
  