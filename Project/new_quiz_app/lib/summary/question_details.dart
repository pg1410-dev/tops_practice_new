

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionDetails extends StatelessWidget {
  const QuestionDetails({super.key, required this.summary, required this.isCorrectAnswer});

  final Map<String, Object> summary;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(summary['question'].toString(),
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 138, 227, 175),
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),),
            Text(summary['correct_answer'].toString(),
            style: GoogleFonts.lato(
              color: Colors.white54
            ),),
            Text(summary['user_answer'].toString(),
                style: GoogleFonts.lato(
                    color: Colors.amberAccent
                )),
          ],
        ),
      ),
    );
  }

}