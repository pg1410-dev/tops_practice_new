// Task 21:
// Create a two-screen app. The first screen should have a button that navigates to the second
// screen. Display a welcome message on the second screen.

import 'package:flutter/material.dart';
import 'package:task21/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Screen Page!',
      theme: ThemeData.from(
          colorScheme: ColorScheme.dark(),),
      home: FirstScreen(),
    );
  }
}
