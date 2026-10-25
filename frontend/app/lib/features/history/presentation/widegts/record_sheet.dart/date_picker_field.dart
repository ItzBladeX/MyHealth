import 'package:app/features/history/presentation/widegts/record_sheet.dart/form_there.dart';
import 'package:app/features/history/presentation/widegts/record_sheet.dart/input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DatePickerField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const DatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateChanged,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      label: label,
      isRequired: isRequired,
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != selectedDate) {
            onDateChanged(picked);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: FormTheme.defaultPadding,
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined, color: Colors.grey[500], size: 20),
              const SizedBox(width: 12),
              Text(
                DateFormat('MMM dd, yyyy').format(selectedDate),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
