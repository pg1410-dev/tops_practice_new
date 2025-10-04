
import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex({super.key, required this.summary, required this.isCorrectAnswer});

  final Map<String, Object> summary;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.green : Colors.redAccent,
          shape: BoxShape.circle
      ),
      alignment: Alignment.center,
      child: Text(((summary['question_index'] as int)+ 1).toString()),
    );
  }

}