// Task 35:
// Make a button with a pulsing effect using TweenAnimationBuilder to change the button size.

import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: PulsingButton(),
        ),
      ),
    );
  }
}


class PulsingButton extends StatefulWidget {
  const PulsingButton({super.key});

  @override
  State<PulsingButton> createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton> {
  bool _isPulsing = false;

  @override
  void initState() {
    super.initState();
    _togglePulsing();
  }


  void _togglePulsing() {
    setState(() {
      _isPulsing = !_isPulsing;
    });


    Future.delayed( Duration(milliseconds: 1000), () {
      if (mounted) {
        _togglePulsing();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _isPulsing ? 1.0 : 1.2, end: _isPulsing ? 1.2 : 1.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (BuildContext context, double scale, Widget? child) {
        return Transform.scale(
          scale: scale,
          child: ElevatedButton(
            onPressed: () {
              debugPrint('Button Pressed!');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              elevation: 8,
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 40),
          ),
        );
      },
    );
  }
}
