import 'package:flutter/material.dart';

void main() {
runApp (MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    title: "Hello World",
    home: Scaffold(
      appBar: AppBar(
        title: const Text("My First App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text("Hello World From Prakash",
        style: TextStyle(
          fontSize: 30,
          color: Colors.purple,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    ),
    );
  }
}


