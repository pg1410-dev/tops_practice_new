// Task 18:
// Build a feedback form with TextField widgets for entering name and comments, and a
// DropdownButton for selecting a feedback category.

import 'package:flutter/material.dart';

import 'feedback_formpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form App',
      home: FeedbackFormPage(),
    );
  }

}