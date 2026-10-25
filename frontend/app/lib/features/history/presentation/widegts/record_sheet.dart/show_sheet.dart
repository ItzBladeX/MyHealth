import 'package:app/features/history/presentation/widegts/record_sheet.dart/add_record_sheet.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

void  showMedicalRecordBottomSheet(BuildContext context, Map<String,dynamic>?record) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: record  != null ? MedicalRecordBottomSheet(
          id: record['id'],
          hospital: record['hospital'],
          diagnosis: record['diagnosis'],
          notes: record['notes'],
          prescription: record["prescription"],
          visitDate: record['date'],
          ) : MedicalRecordBottomSheet()
      );
    },
  );
}
