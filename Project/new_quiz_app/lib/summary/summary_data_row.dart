
import 'package:flutter/material.dart';
import 'package:new_quiz_app/summary/question_details.dart';
import 'package:new_quiz_app/summary/question_index.dart';


class SummaryDataRow extends StatelessWidget {
  const SummaryDataRow({super.key, required this.summary});

  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {

    final isCorrectAnswer = summary["user_answer"] == summary["correct_answer"];

    return Row(// screen width
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIndex(summary: summary, isCorrectAnswer: isCorrectAnswer),
        QuestionDetails(summary: summary, isCorrectAnswer: isCorrectAnswer),
      ],
    );
  }

}