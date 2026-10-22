import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';

class ScreenTime extends StatelessWidget {
  const ScreenTime({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom exact color matching from the Screen Time design
    const colorBackground = Colors.white;
    const colorIconBg = Color(0xFFDCEBFA); // Soft blue icon background frame
    const colorIcon = Color(0xFF0D548C);   // Deep ocean blue for hourglass icon
    const colorBadgeBg = Color(0xFFE4F0FC); // Pale sky blue badge back
    const colorBadgeText = Color(0xFF0F5A9C); // Matching deep blue badge text
    const colorMainText = Color(0xFF0B192C);  // Dark slate primary text
    const colorSubText = Color(0xFF64748B);   // Soft gray for labels and metadata

    return Container(
          
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(24.0),
       
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Hourglass Icon and Status Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Styled Icon Box Container
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colorIconBg,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.hourglass_empty_rounded, // Styled hourglass match
                  color: colorIcon,
                  size: 22,
                ),
              ),
              // "Balanced" Activity State Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: colorBadgeBg,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Balanced',
                  style: TextStyle(
                    color: colorBadgeText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Section Title Accent Label
          const Text(
            'Screen Time',
            style: TextStyle(
              color: colorSubText,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
          ),
          const SizedBox(height: 6),
          
          // Primary Duration Figure
          const Text(
            '2h 15m',
            style: TextStyle(
              color: colorMainText,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          
          // Breakout App Usage Metric Label
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 15,
                letterSpacing: -0.1,
              ),
              children: [
                TextSpan(
                  text: '32m ',
                  style: TextStyle(
                    color: colorSubText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'in MyHealth',
                  style: TextStyle(
                    color: colorSubText,
                    fontWeight: FontWeight.w500, // Slightly bolder emphasis matching the design
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
