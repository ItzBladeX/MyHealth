import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
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

class ListAllergies extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        _buildMedicalChip(
          label: "Penicillin (Severe)",
          dotColor: ColorConstants.redText,
          bgColor: ColorConstants.redBackground,
          textColor: ColorConstants.redText,
        ),
        _buildMedicalChip(
          label: "Peanuts (Mild)",
          dotColor: ColorConstants.darkBlue,
          bgColor: ColorConstants.lightBlue,
          textColor: ColorConstants.darkBlue,
        ),
        _buildMedicalChip(
          label: "Asthma",
          dotColor:  ColorConstants.darkBlue,
          bgColor:  ColorConstants.lightBlue,
          textColor: ColorConstants.darkBlue,
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
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
