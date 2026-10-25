import 'package:app/core/constants.dart';
import 'package:app/features/history/presentation/widegts/record_sheet.dart/show_sheet.dart';
import 'package:flutter/material.dart';

class AddRecordButton extends StatelessWidget {

  const new({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
          showMedicalRecordBottomSheet(context,null);
      },
     
      shape: StadiumBorder(),
   
      backgroundColor: ColorConstants.basecolor,
  
      icon: const Icon(Icons.add, color: Colors.white),
      
      label: const Text(
        "Add Record",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}