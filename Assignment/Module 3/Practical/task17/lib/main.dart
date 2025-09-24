import 'package:flutter/material.dart';
import 'package:task17/registration_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Registration Form App!', home: RegistrationForm());
  }
}
