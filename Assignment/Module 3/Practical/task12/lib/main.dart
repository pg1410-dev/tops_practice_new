// Task 12:
// Make a toggle switch that changes the app’s background color when turned on or off. Use the
// Switch widget to handle the toggle state.


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle Switch App',
      home: ToggleScreen(),
    );
  }
}

class ToggleScreen extends StatefulWidget{
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {

  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? Colors.black : Colors.blueAccent,
      appBar: AppBar(
        title: Center(child: Text('Toggle Background Color Change')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Background Change',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
            Switch(
                value: isSwitched,
                onChanged: (value){
                  setState(() {
                    isSwitched = value;
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}


