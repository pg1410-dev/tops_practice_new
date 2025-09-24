// 3) Implement a feedback form that includes dropdowns, checkboxes, and text input fields, with
// submission handling.

import 'package:flutter/material.dart';
import 'package:project3/feedback_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        useMaterial3: true,
      ),
      home: FeedbackScreen(),
    );
  }
}

