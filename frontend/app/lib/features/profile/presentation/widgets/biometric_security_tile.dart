import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';

class BiometricSecurityTile extends StatefulWidget {
  const BiometricSecurityTile({super.key});

  @override
  State<BiometricSecurityTile> createState() => _BiometricSecurityTileState();
}

class _BiometricSecurityTileState extends State<BiometricSecurityTile> {
  bool isFaceIdEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: ColorConstants.lightBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.face_outlined, color: ColorConstants.darkBlue),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Biometric Security',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'FingerPrint enabled',
                style: TextStyle(fontSize: 13,),
              ),
            ],
          ),
        ),
        Switch(
          value: isFaceIdEnabled,
          onChanged: (value) => {
            setState(() {
              isFaceIdEnabled = !isFaceIdEnabled;
            }),
          },
          activeThumbColor: ColorConstants.cardBackground,
          inactiveThumbColor: ColorConstants.cardBackground,
          activeTrackColor: ColorConstants.basecolor,
          inactiveTrackColor: ColorConstants.lightBlue,
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ],
    );
  }
}

