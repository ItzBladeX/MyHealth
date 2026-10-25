import 'package:app/core/constants.dart';
import 'package:app/features/history/presentation/widegts/add_record_button.dart';
import 'package:app/features/history/presentation/widegts/download_button.dart';
import 'package:app/features/history/presentation/widegts/history_header.dart';
import 'package:app/features/history/presentation/widegts/medical_history.dart';
import 'package:flutter/material.dart';
import 'package:app/app_bar.dart';
import 'package:app/features/history/presentation/widegts/search_bar.dart';

class HistoryPage extends StatefulWidget {
  const new({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Medical History"),
      body: HistoryScreen(),
      floatingActionButton: AddRecordButton(),
    );
  }
}



class HistoryScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [HistoryHeader(), MedicalHistory()]);
  }
}
