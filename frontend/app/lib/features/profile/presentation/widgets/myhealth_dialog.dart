import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:provider/provider.dart';

import 'package:app/features/profile/presentation/widgets/error_message.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_dialog_fields.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_dialog_header.dart';

void showEditMedicalIdDialog(
  BuildContext context,
  String fullName,
  String phonenumber,
  String bloodType,
  DateTime? birthdate,
  double weight,
  double height,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: EditableMedicalIdDialog(
          fullName: fullName,
          phonenumber: phonenumber,
          bloodType: bloodType,
          birthdate: birthdate,
          weight: weight,
          height: height,
        ),
      );
    },
  );
}

class EditableMedicalIdDialog extends StatefulWidget {
  final String fullName;
  final String phonenumber;
  final String bloodType;
  final DateTime? birthdate;
  final double weight;
  final double height;

  const EditableMedicalIdDialog({
    super.key,
    required this.fullName,
    required this.phonenumber,
    required this.bloodType,
    required this.birthdate,
    required this.weight,
    required this.height,
  });

  @override
  State<EditableMedicalIdDialog> createState() =>
      _EditableMedicalIdDialogState();
}

class _EditableMedicalIdDialogState extends State<EditableMedicalIdDialog> {
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _birthdate;
  late final TextEditingController _blood;
  late final TextEditingController _weight;
  late final TextEditingController _height;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.fullName);
    _phone = TextEditingController(text: widget.phonenumber);
    _blood = TextEditingController(text: widget.bloodType);
    _weight = TextEditingController(
      text: widget.weight != 0 ? "${widget.weight}" : '-',
    );
    _height = TextEditingController(
      text: widget.height != 0 ? "${widget.height}" : '-',
    );

    final localbirthdate = widget.birthdate;

    if (localbirthdate != null) {
      _birthdate = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(localbirthdate),
      );
    } else {
      _birthdate = TextEditingController(text: "-");
    }
  }

  String? _errorMessage;

  void saveData() async {
    setState(() {
      _errorMessage = null;
    });
    String name = _name.text.trim();
    String phone = _phone.text.trim();
    DateTime? birthdate;
    String? bloodtype;
    double? weight;
    double? height;
    if (_birthdate.text.trim() != '' && _birthdate.text.trim() != "-"){
      birthdate = DateTime.parse(_birthdate.text.trim());
    }
    if (_blood.text.trim() != '' && _blood.text.trim() != '-') {
      bloodtype = _blood.text.trim();
    }
    if (_weight.text.trim() != '' && _weight.text.trim() != '-') {
      weight = double.parse(_weight.text.trim());
    }
    if (_height.text.trim() != '' && _height.text.trim() != "-") {
      height = double.parse(_height.text.trim());
    }
    String useruuid = context.read<AuthProvider>().userUUID ?? "";
    final String normalizedFullName = name.replaceAll(RegExp(r'\s+'), ' ');
    if (!RegExp(r'^[A-Za-z]+ [A-Za-z]+$').hasMatch(normalizedFullName)) {
      setState(() {
        _errorMessage =
            'Full name must be in the format: <first name> <second name>';
      });
      return;
    }

    if (!AuthService.isValidPhoneNumber(phone)) {
      setState(() {
        _errorMessage =
            'Use a valid phone number: +2519xxxxxxxx or +2517xxxxxxxx';
      });
      return;
    }

    bool status = await context.read<UserProvider>().saveUserData(
      name,
      phone,
      birthdate,
      bloodtype,
      weight,
      height,
      useruuid,
    );
    if (!mounted) {
      setState(() {
        _errorMessage = "Something Unexpected Went Wrong.";
      });
      return;
    }

    if (status) Navigator.pop(context);
    if (!status) {
      setState(() {
        _errorMessage = "Something Unexpected Went Wrong. Unable to save data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: const BoxConstraints(maxWidth: 560),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: ColorConstants.cardBackground,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyHealthDialogHeader(),
              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                ErrorMessage(errorMessage: _errorMessage),
              ],
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorConstants.darkBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: MyHealthDialogField(
                  name: _name,
                  phone: _phone,
                  age: _birthdate,
                  blood: _blood,
                  weight: _weight,
                  height: _height,
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
                      onPressed: saveData,
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
