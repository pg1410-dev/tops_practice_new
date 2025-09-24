// Task 5:
// Create a responsive layout using a Row widget with three Container widgets, each with
// different background colors and widths.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Flutter Task5!"))),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double totalWidth = constraints.maxWidth;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: totalWidth * 0.3,
                      height: 100,
                      color: Colors.blueAccent,
                      child: Center(child: Text("First!")),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: totalWidth * 0.35,
                      height: 100,
                      color: Colors.amberAccent,
                      child: Center(child: Text("Second!")),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: totalWidth * 0.3,
                      height: 100,
                      color: Colors.deepOrangeAccent,
                      child: Center(child: Text("Third!")),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
