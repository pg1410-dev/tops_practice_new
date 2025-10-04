import 'package:flutter/material.dart';
import 'package:new_quiz_app/styled_text.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: Color.fromARGB(100, 255, 255, 255),
            width: 200,
          ),
          const SizedBox(height: 50),
          StyledText('Learn Flutter the Fun Way'),
          const SizedBox(height: 30),
          // OutlinedButton(onPressed: () {}, child: StyledText("Start Quiz"))
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: StyledText("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
