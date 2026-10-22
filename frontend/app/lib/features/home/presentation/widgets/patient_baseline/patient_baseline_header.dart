import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class PatientBaselineHeader extends StatelessWidget {
  const PatientBaselineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConstants.iconBackground, width: 2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorConstants.iconBackground,
            ),
            child: Icon(
              Icons.medical_information,
              color: ColorConstants.basecolor,
            ),
          ),

          SizedBox(width: 8),
          Text(
            "Patient Baseline",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
