import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/user_info.dart';
import 'package:app/models/user_model.dart';
import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientBaselineBloodType extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userData =
        context.watch<UserProvider>().userData ?? {};
    String bloodType = '-';
    String rh = '-';
    String summery = '-';
    final Map<String, String> bloodTypeFunctions = {
      'O+': 'Universal Red Cell Donor',
      'O-': 'Absolute Universal Red Cell Donor',
      'A+': 'Targeted Positive Donor.',
      'A-': 'Flexible Negative Donor.',
      'B+': 'Specific Positive Donor. ',
      'B-': 'Rare Negative Donor. ',
      'AB+': 'Universal Red Blood Cell Recipient. ',
      'AB-': 'Universal Plasma Donor.',
    };
    final Map<String, String> Rh = {
      'O+': 'Rh Posative',
      'O-': 'Rh Negative',
      'A+': 'Rh Posative',
      'A-': 'Rh Negative',
      'B+': 'Rh Posative',
      'B-': 'Rh Negative',
      'AB+': 'Rh Posative',
      'AB-': 'Rh Negative',
    };
    if (userData.isNotEmpty) {
      bloodType = userData['bloodtype'] ?? '-';
      if (bloodType != '-') {
        rh = Rh[bloodType] ?? '-';
        summery = bloodTypeFunctions[bloodType] ?? '-';
      }
    }

    return Container(
      width: double.infinity,
      // height: 68,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 12,
        // crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: ColorConstants.amazingBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.bloodtype_outlined,
              color: ColorConstants.basecolor,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,

                children: [
                  Text(
                    bloodType,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    rh,
                    style: TextStyle(color: Color(0xFF565E74), fontSize: 11),
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.volunteer_activism_outlined,
                    color: ColorConstants.basecolor,
                    size: 18,
                  ),
                  Text(
                    summery,

                    style: TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
