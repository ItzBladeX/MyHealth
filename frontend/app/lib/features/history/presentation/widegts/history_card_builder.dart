import 'package:app/core/constants.dart';
import 'package:app/features/history/presentation/widegts/record_sheet.dart/show_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCardBuilder extends StatefulWidget {
  final Map<String, dynamic> record;
  const new({super.key, required this.record});

  @override
  State<HistoryCardBuilder> createState() => _HistoryCardBuilderState();
}

class _HistoryCardBuilderState extends State<HistoryCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,

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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            CardHeader(
              hospital: widget.record['hospital'],
              date: DateFormat('MMM,dd,yyyy').format(widget.record['date']),
            ),

            DiagnosticText(diagnosis: widget.record['diagnosis']),
            NoteText(notes: widget.record['notes']),
            DetailButton(record: widget.record,),
          ],
        ),
      ),
    );
  }
}

class DetailButton extends StatelessWidget {
  final Map<String,dynamic> record;
  const new({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      showMedicalRecordBottomSheet(context, record);
      },
      style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text("View Full Detains & Edit")),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class NoteText extends StatelessWidget {
  final String? notes;
  const new({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Text(
      notes ?? "-",
      style: TextStyle(fontSize: 12, color: Color(0xFF3D4947)),
      softWrap: true,
    );
  }
}

class DiagnosticText extends StatelessWidget {
  final String diagnosis;
  const new({super.key, required this.diagnosis});

  @override
  Widget build(BuildContext context) {
    return Text(
      diagnosis,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      softWrap: true,
    );
  }
}

class CardHeader extends StatelessWidget {
  final String hospital;
  final String date;
  const new({super.key, required this.hospital, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon + Text
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_hospital_outlined,
                color: ColorConstants.basecolor,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  hospital,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Date
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            color: const Color(0xFFE3EDFA),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 10,
                color: Color(0xFF565E74),
              ),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(color: Color(0xFF565E74))),
            ],
          ),
        ),
      ],
    );
  }
}
