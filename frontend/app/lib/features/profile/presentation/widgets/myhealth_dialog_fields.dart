import 'package:flutter/material.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_dialog_builders.dart';

class MyHealthDialogField extends StatelessWidget {
  const new({
    super.key,
    required this._name,
    required this._phone,
    required this._age,
    required this._blood,
    required this._weight,
    required this._height,
  });

  final TextEditingController _name;
  final TextEditingController _phone;
  final TextEditingController _age;
  final TextEditingController _blood;
  final TextEditingController _weight;
  final TextEditingController _height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: [
        buildTextField("FULL NAME", _name, size: 18),
        const SizedBox(height: 14),
        buildTextField(
          "PHONE NUMBER",
          _phone,
          size: 15,
          bold: false,
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: buildDateField(context, "Birthdate", _age)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildSelectField(context,"BLOOD TYPE", _blood),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: buildNumberField("WEIGHT [kg]", _weight),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildNumberField("HEIGHT [cm]", _height),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}