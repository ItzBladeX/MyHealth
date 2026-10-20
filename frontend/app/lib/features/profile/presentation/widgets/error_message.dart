import 'package:flutter/material.dart';

import 'package:app/core/constants.dart';

class ErrorMessage extends StatelessWidget {
  const new({
    super.key,
    required this._errorMessage,
  });

  final String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE3E3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConstants.redBackground),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: ColorConstants.redText, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _errorMessage!,
              style: const TextStyle(
                color: ColorConstants.redText,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}