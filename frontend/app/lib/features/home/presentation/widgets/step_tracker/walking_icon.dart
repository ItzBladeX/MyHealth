import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class WalkingIcon extends StatelessWidget {
  const new({super.key, required this.iconBackground});

  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: iconBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Icon(
        Icons.directions_walk,
        color: ColorConstants.basecolor,
        size: 26,
      ),
    );
  }
}
