// Task 31:
// Create a "card" UI with a floating action button positioned at the bottom right using Stack
// and Positioned.


import 'package:flutter/material.dart';
import 'package:task31/stack_card_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackCardScreen(),
    );
  }
}
