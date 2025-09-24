// Task 4:
// Make a "Login Screen" with two TextField widgets for email and password inputs, and a
// RaisedButton or ElevatedButton widget for the login button.


import 'package:flutter/material.dart';
import 'package:task4/login-screen.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }

}