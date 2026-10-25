import 'package:app/features/history/presentation/widegts/record_sheet.dart/add_record_buttons.dart';
import 'package:app/features/profile/presentation/widgets/error_message.dart';
import 'package:app/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'iconic_text_field.dart';
import 'date_picker_field.dart';

import 'package:provider/provider.dart';

class MedicalRecordBottomSheet extends StatefulWidget {
  final String? hospital;
  final String? diagnosis;
  final String? notes;
  final String? prescription;
  final DateTime? visitDate;
  final int? id;

  const MedicalRecordBottomSheet({
    super.key,
    this.hospital,
    this.diagnosis,
    this.notes,
    this.prescription,
    this.visitDate,
    this.id,
  });

  @override
  State<MedicalRecordBottomSheet> createState() =>
      _MedicalRecordBottomSheetState();
}

class _MedicalRecordBottomSheetState extends State<MedicalRecordBottomSheet> {
  void deleteRecord(BuildContext context) async {
    bool success = await context.read<UserProvider>().deleteHospitalRecord(widget.id!);
    if(!context.mounted) return;
    if(success) Navigator.pop(context);

  }

  void saveRecord(BuildContext context) async {
    if (_hospitalController.text.trim() == '') {
      setState(() {
        _errorMessage = "Hospital field cant be empty";
      });
      return;
    }

    if (_diagnosisController.text.trim() == '') {
      setState(() {
        _errorMessage = "Diagnosis field cant be empty";
      });
      return;
    }

    Map<String, dynamic> record = {
      'hospital': _hospitalController.text.trim(),
      'diagnosis': _diagnosisController.text.trim(),
      'prescription': _prescriptionController.text.trim(),
      'notes': _notesController.text.trim(),
      'date': _visitDate,
    };
    if (widget.id != null) record['id'] = widget.id;
    print("id set to $widget.id");
    bool success = await context.read<UserProvider>().saveMedicalHistory(
      record,
    );
    if (!context.mounted) return;

    if (!success) {
      setState(() {
        _errorMessage =
            "Something Unexpected Happened, Please try again later!";
      });
      return;
    }

    Navigator.pop(context);
  }

  String? _errorMessage;
  late final TextEditingController _hospitalController;
  late final TextEditingController _diagnosisController;
  late final TextEditingController _notesController;
  late final TextEditingController _prescriptionController;
  late DateTime _visitDate;
  @override
  void initState() {
    super.initState();
    _hospitalController = TextEditingController(text: widget.hospital ?? "");
    _diagnosisController = TextEditingController(text: widget.diagnosis ?? "");
    _notesController = TextEditingController(text: widget.notes ?? "");
    _prescriptionController = TextEditingController(
      text: widget.prescription ?? "",
    );
    _visitDate = widget.visitDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _hospitalController.dispose();
    _diagnosisController.dispose();
    _notesController.dispose();
    _prescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: keyboardPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          _buildHeader(context),

          // Scrollable input list
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  IconicTextField(
                    label: 'Hospital or Clinic Name',
                    prefixIcon: Icons.local_hospital_outlined,
                    isRequired: true,
                    controller: _hospitalController,
                    placeholder: "e.g.Referal Hospital...",
                  ),
                  DatePickerField(
                    label: 'Visit Date',
                    isRequired: true,
                    selectedDate: _visitDate,
                    onDateChanged: (date) => setState(() => _visitDate = date),
                  ),
                  IconicTextField(
                    label: 'Diagnosis / Primary Condition',
                    prefixIcon: Icons.healing_outlined,
                    isRequired: true,
                    controller: _diagnosisController,
                    placeholder: "e.g. Bronchitis...",
                  ),
                  IconicTextField(
                    label: 'Summary & Clinical Notes',
                    prefixIcon: Icons.description_outlined,
                    controller: _notesController,
                    maxLines: 3,
                    placeholder: "e.g.  Advised 5 days rest with humidified air and prescribed antibiotics...",
                  ),
                  IconicTextField(
                    label: 'Prescriptions & Dosage',
                    prefixIcon: Icons.medication_outlined,
                    controller: _prescriptionController,
                    placeholder: "e.g. Amoxicillin 875mg ...",
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ErrorMessage(errorMessage: _errorMessage),
            ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
            child: FormActionButtons(
              delete: widget.id != null ?  true: false,
              onDelete: () {
                deleteRecord(context);
              },
              onCancel: () => Navigator.pop(context),
              onSave: () {
                saveRecord(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.teal,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Medical Record',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Log a new hospital or clinic visit',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black54),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
