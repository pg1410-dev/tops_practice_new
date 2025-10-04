import 'package:flutter/material.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'package:new_quiz_app/questions_screen.dart';
import 'package:new_quiz_app/result_screen.dart';
import 'package:new_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  // Widget? activeScreen;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }
  //
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = QuestionsScreen();
  //   });
  // }

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      // selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    const topAlignment = Alignment.topLeft;
    const bottomAlignment = Alignment.bottomRight;

    Widget? widgetScreen = StartScreen(switchScreen);
    if(activeScreen == 'question-screen') {
      widgetScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    else if(activeScreen == 'result-screen') {
      widgetScreen = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body:
          Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 60, 75, 150),
                    Color.fromARGB(250, 17, 7, 251),
                  ],
                  begin: topAlignment,
                  end: bottomAlignment,
                ),
              ),
              // child: activeScreen == 'start-screen' ? StartScreen(switchScreen) : QuestionsScreen()
            child: widgetScreen,
          ),
      ),
    );
  }
}
