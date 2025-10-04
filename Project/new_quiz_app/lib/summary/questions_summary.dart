import 'package:flutter/material.dart';
import 'package:new_quiz_app/summary/summary_data_row.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: Column(
          children: summaryData.map((summary) {
            return SummaryDataRow(summary: summary);
          }).toList(),
        ),
      ),
    );
  }
}