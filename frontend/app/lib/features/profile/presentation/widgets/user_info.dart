import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/user_name.dart';

Expanded userInfo() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        userName(),
        Row(
          children: [
            Icon(Icons.cake_outlined, color: ColorConstants.basecolor),
            Text(" 17 yrs", style: TextStyle(fontSize: 12)),
            Text(" | "),
            Icon(Icons.bloodtype_outlined, color: ColorConstants.basecolor),
            Text("O+ (Posative)", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12)), 
          ],
        ),
       
        
      ],
    ),
  );
}
