// Task 26:
// Create an infinite scrolling list using ListView.builder that loads more data as the user
// scrolls to the bottom.

import 'package:flutter/material.dart';
import 'package:task26/scroll_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ScrollScreen(),
    );
  }
}








