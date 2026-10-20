import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/alert_chip_builder.dart';
import 'package:provider/provider.dart';

class AlertChips extends StatefulWidget {
  const new({super.key, required this.allergies});

  final List<MapEntry<String, dynamic>>? allergies;

  @override
  State<AlertChips> createState() => _AlertChipsState();
}

class _AlertChipsState extends State<AlertChips> {
  void deleteAllergy(BuildContext context, name) async {
    String? userUUID = context.read<AuthProvider>().userUUID ?? "";
    await context.read<UserProvider>().deleteUserAllergy(userUUID, name);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.allergies!.map((entry) {
        final String name = entry.key;
        final String severity = entry.value;
        final int type;
        if (severity.toLowerCase() == 'severe') {
          type = 0;
        } else if (severity.toLowerCase() == 'mild') {
          type = 1;
        } else {
          type = 2;
        }
        List<Color> textColors = [
          ColorConstants.redText,
          ColorConstants.darkBlue,
          ColorConstants.purpleText,
        ];

        List<Color> bgColors = [
          ColorConstants.redBackground,
          ColorConstants.lightBlue,
          ColorConstants.purpleBackground,
        ];

        final Color textColor = textColors[type];
        final Color bgColor = bgColors[type];
        final Color dotColor = textColors[type];

        return buildAlertChip(
          label: name,
          dotColor: dotColor,
          bgColor: bgColor,
          textColor: textColor,
          onDelete: () => deleteAllergy(context, name),
        );
      }).toList(),
      // [
      //   ...allergies!.entries.map((entry) {
      //     final String name = entry.key;
      //     final String severity = entry.value;
      //     final int type;

      //     if (severity.toLowerCase() == 'severe'){
      //       type = 0;
      //     }
      //     else if (severity.toLowerCase() == 'mild'){
      //       type = 1;
      //     }
      //     else{
      //       type = 2;
      //     }
      //     List<Color> textColors = [ColorConstants.redText,ColorConstants.darkBlue,ColorConstants.purpleText  ];

      //     List<Color> bgColors = [
      //       ColorConstants.redBackground,
      //       ColorConstants.lightBlue,
      //       ColorConstants.purpleBackground
      //     ];
      //     final Color textColor = textColors[type];
      //     final Color bgColor = bgColors[type];
      //     final Color dotColor = textColors[type];

      //     return buildAlertChip(
      //       label: name,
      //       dotColor: dotColor,
      //       bgColor: bgColor,
      //       textColor: textColor,
      //     );
      //   }),
      // ],
    );
  }
}
