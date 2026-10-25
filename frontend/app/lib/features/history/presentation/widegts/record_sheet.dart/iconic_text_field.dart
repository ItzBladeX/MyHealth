import 'package:app/features/history/presentation/widegts/record_sheet.dart/form_there.dart';
import 'package:app/features/history/presentation/widegts/record_sheet.dart/input_field.dart';
import 'package:flutter/material.dart';

class IconicTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final IconData prefixIcon;
  final TextEditingController controller;
  final int maxLines;
  final String placeholder;

  const IconicTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.controller,
    required this.placeholder,
    this.isRequired = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      label: label,
      isRequired: isRequired,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: maxLines == 1
              ? Icon(prefixIcon, color: Colors.grey[500], size: 20)
              : null,
          contentPadding: FormTheme.defaultPadding,
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}
