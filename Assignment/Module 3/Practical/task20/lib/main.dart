// Task 20:
// Make a simple task manager app with a form to add tasks. Use CheckboxListTile widgets
// to mark tasks as completed.

import 'package:flutter/material.dart';
import 'package:task20/task_manager.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskManager(),
    );
  }
}

