import 'package:app/features/history/presentation/widegts/download_button.dart';
import 'package:app/features/history/presentation/widegts/search_bar.dart';
import 'package:flutter/material.dart';

class HistoryHeader extends StatefulWidget {
  const new({super.key});

  @override
  State<HistoryHeader> createState() => _HistoryHeaderState();
}

class _HistoryHeaderState extends State<HistoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         padding: EdgeInsets.all(16),

        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),

        child: Row(children: [
        Expanded(child: HistorySearchBar()),
        SizedBox(width: 10,) ,
        DowloadButton(),

        ],),
      ),
    );
  }
}