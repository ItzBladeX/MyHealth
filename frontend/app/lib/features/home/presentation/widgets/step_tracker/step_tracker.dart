import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/features/home/presentation/widgets/step_tracker/step_metric.dart';
import 'package:app/features/home/presentation/widgets/step_tracker/progress_bar.dart';
import 'package:app/features/home/presentation/widgets/step_tracker/percent_complete.dart';
import 'package:app/features/home/presentation/widgets/step_tracker/walking_icon.dart';

class StepTracker extends StatelessWidget {
  const StepTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              spreadRadius: 0,
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorConstants.iconBackground,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Smartphone Sensor Insight",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConstants.iconBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Auto-Captured",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Top Row: Icon, Step Counts, and Percentage/Distance
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Walking Icon Container
                WalkingIcon(iconBackground: ColorConstants.iconBackground),
                const SizedBox(width: 12),

                StepMetric(),
                PercentComplete(),
              ],
            ),
            const SizedBox(height: 20),

            // Custom Styled Linear Progress Indicator
            ProgressBar(),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
