// Task 8:
// Create a screen with ListView.builder to display a list of names. When tapped, each name
// should print "Name tapped" in the console.


import 'package:flutter/material.dart';

import 'list_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List!",
      home: ListScreen(),
    );
  }
}