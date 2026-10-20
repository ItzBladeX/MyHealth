import 'package:flutter/material.dart';

Widget buildAlertChip({
  required String label,
  required Color textColor,
  required Color bgColor,
  Color? dotColor,
  VoidCallback? onDelete, // Added callback so you can tap the close icon
}) {
  return Chip(
    side: BorderSide.none,

    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    labelPadding: EdgeInsets.zero,

    backgroundColor: bgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide.none,
    ),
    label: Text(
      label,
      style: TextStyle(
        color: textColor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    ),

    avatar:
        Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
      
    deleteIcon: Icon(
      Icons.close,
      size: 14,
      color: textColor.withValues(alpha: 0.7),
    ),
    onDeleted:
        onDelete ??
        () {
          print("deleted");
        },
  );
}
