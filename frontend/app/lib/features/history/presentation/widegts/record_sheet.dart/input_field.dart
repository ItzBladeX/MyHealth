import 'package:app/features/history/presentation/widegts/record_sheet.dart/form_label.dart';
import 'package:app/features/history/presentation/widegts/record_sheet.dart/form_there.dart';
import 'package:flutter/material.dart';


class BaseInputField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final Widget child;

  const BaseInputField({
    super.key,
    required this.label,
    this.isRequired = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabel(label: label, isRequired: isRequired),
          Container(
            decoration: BoxDecoration(
              color: FormTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: FormTheme.borderGrey),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
