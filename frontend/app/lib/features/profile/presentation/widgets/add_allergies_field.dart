import 'package:app/providers/user_provider.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:intl/intl.dart';
import 'package:app/features/profile/presentation/widgets/error_message.dart';
import 'package:app/features/profile/presentation/widgets/allergy_severity_buttons.dart';
import 'package:provider/provider.dart';

// import 'package:app/features/profile/presentation/widgets/allergies_card.dart';

class AddAllergies extends StatefulWidget {
  const AddAllergies({super.key});

  @override
  State<AddAllergies> createState() => _AddAllergiesState();
}

class _AddAllergiesState extends State<AddAllergies> {
  int _selectedSeverityIndex = 0;
  final TextEditingController _nameController = TextEditingController();
  String? _errorMessage;
  void addNewAllergy(BuildContext context) async {

    String severity;
    String allergyName = toBeginningOfSentenceCase(_nameController.text.trim());
    String userUUID = context.read<AuthProvider>().userUUID ?? "";

    if (allergyName == "") {
      setState(() {
      _errorMessage = "Please Enter your Allergy or Condition Name";
        
      });
      return;
    }
    print(_selectedSeverityIndex);
    
    if (_selectedSeverityIndex == 0) {
      severity = "Severe";
    }
    else if (_selectedSeverityIndex == 1) {
      severity = "Mild";
    } else {
      severity = "Chronic";
    }
    try {
      bool success = await context.read<UserProvider>().saveUserAllergies(
        userUUID,
        allergyName,
        severity,
      );

      if (!success) {
        setState(() {
          _errorMessage = "Unable to save duplicate records";
        });
        return;
      }
      if (success){
        _errorMessage = "Successfully added $allergyName";
      }
      // Navigator.pop(context);
    } catch (e) {
      print(e);
      setState(() {
        _errorMessage = "Something Unexpected Went Wrong.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstants.cardBackground,
        borderRadius: BorderRadius.circular(16),
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
        children: [
          Row(
            children: const [
              Icon(
                Icons.add_circle_outline,
                color: ColorConstants.basecolor,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Add New Allergy or Condition',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 12),
            ErrorMessage(errorMessage: _errorMessage),
          ],
          const SizedBox(height: 16),
          const Text('Name', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'e.g. Sulfa, Latex, Eczema...',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorConstants.basecolor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: ColorConstants.basecolor,
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Type & Severity', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: SeverityButton(
                  title: 'Severe Allergy',
                  index: 0,
                  selectedIndex: _selectedSeverityIndex,
                  onSelected: (newIndex) {
                    setState(() {
                      _selectedSeverityIndex = newIndex;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SeverityButton(
                  title: 'Mild Allergy',
                  index: 1,
                  selectedIndex: _selectedSeverityIndex,
                  onSelected: (newIndex) {
                    setState(() {
                      _selectedSeverityIndex = newIndex;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SeverityButton(
                  title: 'Chronic Condition',
                  index: 2,
                  selectedIndex: _selectedSeverityIndex,
                  onSelected: (newIndex) {
                    setState(() {
                      _selectedSeverityIndex = newIndex;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00695C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.add, size: 20),
              label: const Text(
                'Add to List',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                addNewAllergy(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
