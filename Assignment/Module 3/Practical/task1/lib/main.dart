// Task 1:
// Create a simple "Hello World" Flutter app with a Text widget displaying "Hello, Flutter!"
// centered on the screen.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(body: Center(child: Text("Hello, Flutter"))),
      ),
    );
  }
}
