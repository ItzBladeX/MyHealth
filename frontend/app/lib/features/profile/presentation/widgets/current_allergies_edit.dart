import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/user_provider.dart';
import 'package:app/features/profile/presentation/widgets/alert_chips.dart';
import 'package:app/features/profile/presentation/widgets/no_allergies.dart';

class CurrentAllergiesEdit extends StatefulWidget {
  const new({super.key});

  @override
  State<CurrentAllergiesEdit> createState() => _CurrentAllergiesEditState();
}

class _CurrentAllergiesEditState extends State<CurrentAllergiesEdit> {
  Map<String, dynamic>? allergies;
  List<MapEntry<String, dynamic>>? sortedAllergies;
  void loadAllergies(BuildContext context) {
    allergies = context.watch<UserProvider>().userAllergies;

    final order = ["severe", "chronic", "mild"];
    sortedAllergies = (allergies ?? {}).entries.toList()
      ..sort(((a, b) {
        final valA = a.value.toString().toLowerCase();
        final valB = b.value.toString().toLowerCase();
        return order.indexOf(valA).compareTo(order.indexOf(valB));
      }));
  }

  @override
  Widget build(BuildContext context) {
    loadAllergies(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstants.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '  Current Medical Allergies & Conditions',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          allergies!.isEmpty
              ? NoAllergies()
              : AlertChips(allergies: sortedAllergies),
        ],
      ),
    );
  }
}
