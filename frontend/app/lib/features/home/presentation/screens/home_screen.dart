import 'package:app/features/home/presentation/widgets/hydration_tracker/hydration_tracker_card.dart';
import 'package:app/features/home/presentation/widgets/step_tracker/step_tracker.dart';
import 'package:app/features/home/presentation/widgets/usage_tracker/screen_of.dart';
import 'package:app/features/home/presentation/widgets/usage_tracker/screen_time.dart';
import 'package:app/features/home/presentation/widgets/usage_tracker/usage_matric.dart';
import 'package:flutter/material.dart';
import 'package:app/app_bar.dart';
import 'package:app/features/home/presentation/widgets/patient_baseline/patient_baseline.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar("Home"), body: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        HydrationTrackerCard(),
        SizedBox(height: 20),
        PatientBaseline(),
        SizedBox(height: 20),
        // StepTracker(), //TODO: Step Tracker not accurate on some devices
        SizedBox(height: 20),
        UsageMatric(),
        SizedBox(height: 40),
      ],
    );
  }
}
