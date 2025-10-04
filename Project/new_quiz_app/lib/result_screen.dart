import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'package:new_quiz_app/summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> data = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      data.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var numOfQuestions = questions.length;
    var numOfCorrectAnswers =
        summaryData
            .where(
              (summary) => summary["user_answer"] == summary["correct_answer"],
            )
            .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $numOfCorrectAnswers out of $numOfQuestions questions correctly!!!",
            style: TextStyle(
              color: Color.fromARGB(255, 228, 181, 181),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          QuestionSummary(summaryData: summaryData),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: onRestart,
            icon: Icon(Icons.refresh, color: Colors.white),
            label: Text(
              "Restart Quiz",
              style: GoogleFonts.lato(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
