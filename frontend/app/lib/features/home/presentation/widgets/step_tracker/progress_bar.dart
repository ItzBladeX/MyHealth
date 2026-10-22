import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class ProgressBar extends StatelessWidget {
  const new({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: const LinearProgressIndicator(
        value: 0.74, // Matches 74%
        minHeight: 10,
        backgroundColor: Color(0xFFECEFF4),
        valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.basecolor),
      ),
    );
  }
}