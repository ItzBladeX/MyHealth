import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/allergies_edit_sheet.dart';
import 'package:provider/provider.dart';

import 'dart:collection';

class AllergiesCard extends StatelessWidget {
  const AllergiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius: BorderRadius.circular(24),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorConstants.redBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: ColorConstants.redText,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Allergies & Conditions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                EditButton(),
              ],
            ),
            const SizedBox(height: 16),
            ListAllergies(),
          ],
        ),
      ),
    );
  }
}

Widget _buildMedicalChip({
  required String label,
  required Color dotColor,
  required Color bgColor,
  required Color textColor,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    ),
  );
}

class ListAllergies extends StatefulWidget {
  const new({super.key});

  @override
  State<ListAllergies> createState() => _ListAllergiesState();
}

class _ListAllergiesState extends State<ListAllergies> {
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
    if (allergies == null || sortedAllergies!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            "No Allergies or Conditions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      );
    } else {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: sortedAllergies!.map((entry) {
          final String name = entry.key;
          final String severity = entry.value;
          final int type;
          if (severity.toLowerCase() == 'severe') {
            type = 0;
          } else if (severity.toLowerCase() == 'mild') {
            type = 1;
          } else {
            type = 2;
          }
          List<Color> textColors = [
            ColorConstants.redText,
            ColorConstants.darkBlue,
            ColorConstants.purpleText,
          ];

          List<Color> bgColors = [
            ColorConstants.redBackground,
            ColorConstants.lightBlue,
            ColorConstants.purpleBackground,
          ];

          final Color textColor = textColors[type];
          final Color bgColor = bgColors[type];
          final Color dotColor = textColors[type];

          return _buildMedicalChip(
            label: name,
            dotColor: dotColor,
            bgColor: bgColor,
            textColor: textColor,
          );
        }).toList(),
        // [
        //   ...allergies!.entries.map((entry) {
        //     final String name = entry.key;
        //     final String severity = entry.value;
        //     final int type;

        //     if (severity.toLowerCase() == 'severe') {
        //       type = 0;
        //     } else if (severity.toLowerCase() == 'mild') {
        //       type = 1;
        //     } else {
        //       type = 2;
        //     }

        // ],
      );
    }
  }
}

class EditButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        EditAllergiesBottomSheet.show(context);
        //TODO: Add Edit Form
      },
      style: TextButton.styleFrom(
        foregroundColor: ColorConstants.basecolor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text("Edit"),
    );
  }
}
