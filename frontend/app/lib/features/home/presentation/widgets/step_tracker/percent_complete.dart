import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class PercentComplete extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Text(
        '74%',
        style: TextStyle(
          color: ColorConstants.basecolor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
