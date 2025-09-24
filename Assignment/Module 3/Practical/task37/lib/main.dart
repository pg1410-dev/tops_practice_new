// Task 37:
// Build a counter app using the Provider package to manage and display the counter value
// across multiple widgets.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task37/counter_provider.dart';
import 'package:task37/counter_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterScreen(),
    );
  }
}