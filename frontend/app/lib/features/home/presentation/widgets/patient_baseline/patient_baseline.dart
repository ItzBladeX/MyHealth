import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/home/presentation/widgets/patient_baseline/patient_baseline_header.dart';
import 'package:app/features/home/presentation/widgets/patient_baseline/patient_baseline_blood_type.dart';
import 'package:app/features/home/presentation/widgets/patient_baseline/patient_baseline_allergies.dart';
import 'package:app/features/home/presentation/widgets/patient_baseline/patient_baseline_conditions.dart';

class PatientBaseline extends StatefulWidget {
  const new({super.key});

  @override
  State<PatientBaseline> createState() => _PatientBaselineState();
}

class _PatientBaselineState extends State<PatientBaseline> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 358,
        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 12,

            children: [
              SizedBox(height: 4),
              PatientBaselineHeader(),
              PatientBaselineBloodType(),
              PatientBaselineAllergies(),
              PatientBaselineConditions(),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
