// Task 25:
// Build a to-do list app where users can add tasks. Use ListView.builder to display the list of
// tasks and allow each task to be removed with a swipe gesture.


import 'package:flutter/material.dart';
import 'package:task25/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO LIST APP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TodoList(),
    );
  }
}
