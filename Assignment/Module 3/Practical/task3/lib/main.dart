// Task 3:
// Create an app with two Text widgets. Apply different TextStyle properties (like font size,
// color, and weight) to each widget to explore styling options.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: (Text(
              "Hello!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            )),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Title(
            color: Colors.black,
            child: Text(
              "Welcome Flutter!",
              style: TextStyle(
                color: Color.fromARGB(160, 120, 20, 90),
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
