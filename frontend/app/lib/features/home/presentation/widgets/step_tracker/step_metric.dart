import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class StepMetric extends StatelessWidget {
  const new({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Accelerometer Steps',
            style: TextStyle(
              color:  ColorConstants.secondaryGrey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontFamily: 'sans-serif'),
              children: [
                TextSpan(
                  text: '7,420 ',
                  style: TextStyle(
                    color: ColorConstants.primaryDark,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '/10,000 steps',
                  style: TextStyle(
                    color:  ColorConstants.secondaryGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}