import 'package:flutter/material.dart';

class ScreenOff extends StatelessWidget {
  const ScreenOff({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom exact color matching from the source design
    const colorBackground = Colors.white;
    const colorIconBg = Color(0xFFEBEBFF); // Soft blue-indigo icon frame
    const colorIcon = Color(0xFF3B3B7A); // Deep slate blue for crescent moon
    const colorBadgeBg = Color(0xFFEBFDF5); // Muted pale green badge back
    const colorBadgeText = Color(0xFF0D9488); // Deep teal badge text
    const colorMainText = Color(0xFF0F172A); // Primary text charcoal slate
    const colorSubText = Color(0xFF64748B); // Soft gray for metadata text

    return Container(
      // margin: EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(20),
      //  width: 180,

      decoration: BoxDecoration(
        color: Colors.white,
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
          // Header Row: Icon and Status Badge
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
                  Icons.dark_mode_outlined,
                  color: colorIcon,
                  size: 22,
                ),
              ),
              // "Passive" Activity State Badge
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
                  'Passive',
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
            'Screen-Off Rest',
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
            '7h 24m',
            style: TextStyle(
              color: colorMainText,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),

          // Relative Interval Time Block
          const Text(
            '11:15 PM – 6:39 AM',
            style: TextStyle(
              color: colorSubText,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}
