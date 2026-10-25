import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';

class DowloadButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        // TODO: add downlaod logic
      },
      style: FilledButton.styleFrom(
        
        backgroundColor: const Color(0xFFE3EDFA), 
        foregroundColor: ColorConstants.basecolor,
        elevation: 0, // Flat design with no shadow
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 23.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), 
        ),
      ),
      icon: const Icon(Icons.download_rounded, size: 22.0),
      label: const Text(
        'Download',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600, 
        ),
      ),
    );
  }
}
