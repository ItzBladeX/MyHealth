import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/current_allergies_edit.dart';
import 'package:app/features/profile/presentation/widgets/add_allergies_field.dart';

class EditAllergiesBottomSheet extends StatefulWidget {
  // final Function(String name, String severity) onAdd;

  const EditAllergiesBottomSheet({
    super.key,
    // required this.onAdd
  });

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditAllergiesBottomSheet(
        //onAdd: onAdd
      ),
    );
  }

  @override
  State<EditAllergiesBottomSheet> createState() =>
      _EditAllergiesBottomSheetState();
}

class _EditAllergiesBottomSheetState extends State<EditAllergiesBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorConstants.pageBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        top: 8,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: ColorConstants.redText,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          AllergiesSheetHeader(),
          const SizedBox(height: 24),
          CurrentAllergiesEdit(),
          const SizedBox(height: 24),
          AddAllergies(),
        ],
      ),
    );
  }
}

class AllergiesSheetHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //Header
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorConstants.redBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.warning_amber_rounded,
            color: ColorConstants.redText,
            size: 24,
          ),
        ),

        Text(
          'Edit Allergies & Conditions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        IconButton(
          visualDensity: VisualDensity.compact,
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFF0F2F8)),
          icon: const Icon(Icons.close, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
