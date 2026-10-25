import 'package:app/features/history/presentation/widegts/record_sheet.dart/form_there.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const FormLabel({super.key, required this.label, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Text(label.toUpperCase(), style: FormTheme.labelStyle),
          if (isRequired)
            const Text(' *', style: TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ),
    );
  }
}
