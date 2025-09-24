// Task 9:
// Build a simple calculator UI with RaisedButton or ElevatedButton widgets for numbers
// and operations. Display the result at the top of the screen.

import 'package:flutter/material.dart';

import 'calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calculator UI', home: CalculatorScreen());
  }
}
