import 'package:flutter/material.dart';
import 'package:new_dice_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(155, 6, 120, 60),
        body: GradientContainer(
          colors: [
            Color.fromARGB(155, 150, 120, 60),
            Color.fromARGB(150, 120, 120, 60),
          ],
        ),
      ),
    ),
  );
}
