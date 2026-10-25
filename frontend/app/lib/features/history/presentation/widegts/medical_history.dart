import 'package:app/core/constants.dart';
import 'package:app/features/history/presentation/widegts/history_card_builder.dart';
import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class MedicalHistory extends StatefulWidget {
  const new({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  List<dynamic> historyList = [];

  void loadHistory(BuildContext context) {
    final Map<int, dynamic>? historyMap = context
        .watch<UserProvider>()
        .medicalHistory;
    historyList = historyMap?.values.toList() ?? [];
    historyList.sort((a, b) {
      final dateA = (a as Map)['date'] as DateTime;
      final dateB = (b as Map)['date'] as DateTime;
      return dateB.compareTo(dateA);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadHistory(context);


    return historyList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemCount: historyList.length,
            itemBuilder: (context, index) =>
                HistoryCardBuilder(record: historyList[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          )
        : Center(
            child: Text("No Medical History Records", style: TextStyle(fontSize: 24)),
          );
  }
}
