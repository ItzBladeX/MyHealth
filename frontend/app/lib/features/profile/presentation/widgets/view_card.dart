import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

void showEditMedicalIdDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: const EditableMedicalIdDialog(),
      );
    },
  );
}

class EditableMedicalIdDialog extends StatefulWidget {
  const EditableMedicalIdDialog({super.key});

  @override
  State<EditableMedicalIdDialog> createState() =>
      _EditableMedicalIdDialogState();
}

class _EditableMedicalIdDialogState extends State<EditableMedicalIdDialog> {
  final _name = TextEditingController(text: "Moti Niguse");
  final _phone = TextEditingController(text: "+251938659012");
  final _age = TextEditingController(text: "8/2008 [17]");
  final _blood = TextEditingController(text: "O+");
  final _weight = TextEditingController(text: "64 kg");
  final _height = TextEditingController(text: "168 cm");

  @override
  Widget build(BuildContext context) {
    Widget buildField(
      String title,
      TextEditingController controller, {
      double size = 13,
      bool bold = true,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: controller,
            style: TextStyle(
              color: Colors.white,
              fontSize: size,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 2),
              border: InputBorder.none,
            ),
          ),
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: ColorConstants.cardBackground,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.png', width: 36, height: 36),
                  const SizedBox(width: 8),
                  const Text(
                    "MyHealth ID",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorConstants.darkBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildField("FULL NAME", _name, size: 18),
                    const SizedBox(height: 14),
                    buildField("PHONE NUMBER", _phone, size: 15, bold: false),
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
                              Expanded(child: buildField("AGE", _age)),
                              const SizedBox(width: 12),
                              Expanded(child: buildField("BLOOD TYPE", _blood)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: buildField("WEIGHT", _weight)),
                              const SizedBox(width: 12),
                              Expanded(child: buildField("HEIGHT", _height)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ColorConstants.shadowColor3,
                        foregroundColor: ColorConstants.darkBlue,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.basecolor,
                        foregroundColor: ColorConstants.cardBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Save Edit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
