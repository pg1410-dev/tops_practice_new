
import 'package:flutter/material.dart';

class AnimatedButtonPage extends StatefulWidget {
  const AnimatedButtonPage({super.key});

  @override
  State<AnimatedButtonPage> createState() => _AnimatedButtonPageState();
}

class _AnimatedButtonPageState extends State<AnimatedButtonPage> {
  double _buttonWidth = 200.0;
  double _buttonHeight = 60.0;
  Color _buttonColor = Colors.deepPurple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(30);
  bool _isPressed = false;

  void _handleButtonPress() {
    setState(() {
      _isPressed = !_isPressed;
      _buttonWidth = _isPressed ? 220.0 : 200.0;
      _buttonHeight = _isPressed ? 70.0 : 60.0;
      _buttonColor = _isPressed ? Colors.pinkAccent : Colors.deepPurple;
      _borderRadius = _isPressed ? BorderRadius.circular(10) : BorderRadius.circular(30);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Button'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: InkWell(
          onTap: _handleButtonPress,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _buttonWidth,
            height: _buttonHeight,
            decoration: BoxDecoration(
              color: _buttonColor,
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Press',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
