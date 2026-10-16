import 'package:flutter/material.dart';

ClipRRect profileImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(
      40,
    ),
    child: Image.asset(
      'assets/images/logo.png',
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    ),
  );
}
