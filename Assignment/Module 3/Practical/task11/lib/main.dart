// Task 11:
// Design a counter app with increment and decrement buttons. Use setState to update the
// displayed value as the buttons are pressed.

import 'package:flutter/material.dart';
import 'package:task11/counter_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: CounterPage(),
    );
  }
}
