import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildSelectField(
  BuildContext context,
  String title,
  TextEditingController controller, {
  double size = 13,
  bool bold = true,
}) {
  final List<String> bloodTypes = [
    "-",
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];

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
        readOnly: true,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 2),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white60,
          ), // Visual cue for a selection field
          suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        ),
        onTap: () {
          // Open selection menu from the bottom
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.grey[900], // Matches your dark theme theme
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (BuildContext context) {
              return SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bloodTypes.length,
                  itemBuilder: (context, index) {
                    final option = bloodTypes[index];
                    return ListTile(
                      title: Text(
                        option,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        controller.text = option;
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    ],
  );
}

Widget buildTextField(
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

Widget buildNumberField(
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

        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
        ],
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

Widget buildDateField(
  BuildContext context,
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
        readOnly: true,
        onTap: () async {
          // 1. Open the native Material Date Picker
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            // Enforces a standard YYYY-MM-DD format
            String formatted =
                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
            controller.text = formatted;
          }
        },

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
