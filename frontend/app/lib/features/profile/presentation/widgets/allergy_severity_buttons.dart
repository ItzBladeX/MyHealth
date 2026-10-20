import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class SeverityButton extends StatefulWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SeverityButton({
    super.key,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<SeverityButton> createState() => _SeverityButtonState();
}

class _SeverityButtonState extends State<SeverityButton> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedIndex == widget.index;

    Color btnBgColor = Colors.white;
    Color borderSideColor = Colors.transparent;
    Color txtColor = Colors.black87;

    // if (isSelected) {
    if (widget.index == 0) {
      btnBgColor = isSelected
          ? ColorConstants.redBackground
          : Colors.transparent;
      borderSideColor = ColorConstants.redText;
      txtColor = ColorConstants.redText;
    }
    else if (widget.index == 1) {
      btnBgColor = isSelected ? ColorConstants.lightBlue : Colors.transparent;
      borderSideColor = ColorConstants.darkBlue;
      txtColor = ColorConstants.darkBlue;
    } else {
      btnBgColor = isSelected ? ColorConstants.purpleBackground : Colors.transparent;
      borderSideColor = ColorConstants.purpleText; 
      txtColor = ColorConstants.purpleText;
    }
    // }

    return InkWell(
      onTap: () {
        widget.onSelected(widget.index);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnBgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderSideColor),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
