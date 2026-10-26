import 'package:flutter/material.dart';

class ScreenOff extends StatelessWidget {
  const ScreenOff({
    super.key,
    required this.minutes,
    required this.screenOnMinutes,
  });

  final double minutes;
  final double screenOnMinutes;

  String _formatDuration(double value) {
    final totalMinutes = value.round();
    final hours = totalMinutes ~/ 60;
    final remainingMinutes = totalMinutes % 60;
    if (hours == 0) return '${remainingMinutes}m';
    if (remainingMinutes == 0) return '${hours}h';
    return '${hours}h ${remainingMinutes}m';
  }

  @override
  Widget build(BuildContext context) {
    // Custom exact color matching from the source design
    const colorBackground = Colors.white;
    const colorIconBg = Color(0xFFEBEBFF); // Soft blue-indigo icon frame
    const colorIcon = Color(0xFF3B3B7A); // Deep slate blue for crescent moon
    final isPassive = minutes >= screenOnMinutes;
    final colorBadgeBg = isPassive
        ? const Color(0xFFEBFDF5)
        : const Color(0xFFFFF4E5);
    final colorBadgeText = isPassive
        ? const Color(0xFF0D9488)
        : const Color(0xFFB45309);
    const colorMainText = Color(0xFF0F172A); // Primary text charcoal slate
    const colorSubText = Color(0xFF64748B); // Soft gray for metadata text

    return Container(
      // margin: EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(20),
      //  width: 180,

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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: colorBadgeBg,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  isPassive ? 'Passive' : 'Active',
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
          Text(
            _formatDuration(minutes),
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
            'Today',
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
