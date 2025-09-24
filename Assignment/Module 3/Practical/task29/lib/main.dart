// Task 29:
// Use a Stack widget to create an overlay effect, where a centered image has a partially
// transparent overlay with some text.

import 'package:flutter/material.dart';
import 'package:task29/stack_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      title: 'Stack App',
      home: StackWidget(),
    );
  }
}
