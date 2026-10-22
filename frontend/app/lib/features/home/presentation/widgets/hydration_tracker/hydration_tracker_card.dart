import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HydrationTrackerCard extends StatefulWidget {
  final int goalIntake;
  final int incrementAmount;
  final ValueChanged<int>? onIntakeChanged;

  const HydrationTrackerCard({
    super.key,
    this.goalIntake = 2000,
    this.incrementAmount = 250,
    this.onIntakeChanged,
  });

  @override
  State<HydrationTrackerCard> createState() => _HydrationTrackerCardState();
}

class _HydrationTrackerCardState extends State<HydrationTrackerCard> {
  int _currentIntake = 0;
  static const String _storageKey = 'cached_hydration_intake';

  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  // Pulls the cached data out of storage safely
  Future<void> _loadStoredData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        // Fallback to 1500 if no data exists yet
        _currentIntake = prefs.getInt(_storageKey) ?? 1500;
      });
    } catch (e) {
      print(e);
    }
  }

  // Pushes changes down to device storage
  Future<void> _updateIntake(int newValue) async {
    if (newValue >= 0 && newValue <= widget.goalIntake) {
      setState(() {
        _currentIntake = newValue;
      });

      if (widget.onIntakeChanged != null) {
        widget.onIntakeChanged!(_currentIntake);
      }

      // Async write to local system storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_storageKey, _currentIntake);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern();

    final int totalSegments = (widget.goalIntake / widget.incrementAmount)
        .ceil();
    final int filledSegments = (_currentIntake / widget.incrementAmount)
        .floor();

    return Center(
      child: Container(
        padding: EdgeInsets.all(16),

        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header Row
            // Text(
            //   '1-Tap Daily Check-ins',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Color(0xFF0A2540),
            //   ),
            // ),
            // SizedBox(height: 10,),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE3F2FD),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.water_drop,
                        color: ColorConstants.darkBlue,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Hydration Goal',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF667085),
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          // Clean, error-free replacement using an auto-wrapping Row structure
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                formatter.format(_currentIntake),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF101828),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  '/ ${formatter.format(widget.goalIntake)} ml',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF667085),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => _updateIntake(
                            _currentIntake - widget.incrementAmount,
                          ),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8EFFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xFF101828),
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),

                        InkWell(
                          onTap: () => _updateIntake(
                            _currentIntake + widget.incrementAmount,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF005943),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '+${widget.incrementAmount} ml',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Segment(
                  totalSegments: totalSegments,
                  filledSegments: filledSegments,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Segment extends StatelessWidget {
  const new({
    super.key,
    required this.totalSegments,
    required this.filledSegments,
  });

  final int totalSegments;
  final int filledSegments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSegments, (index) {
        bool isFilled = index < filledSegments;
        return Expanded(
          child: Container(
            height: 8,
            margin: EdgeInsets.only(right: index == totalSegments - 1 ? 0 : 5),
            decoration: BoxDecoration(
              color: isFilled
                  ? const Color(0xFF005943)
                  : const Color(0xFFE8EFFC),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}
