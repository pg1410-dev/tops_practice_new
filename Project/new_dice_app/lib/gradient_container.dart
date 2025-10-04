import 'package:flutter/material.dart';
import 'package:new_dice_app/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    const topAlignment = Alignment.topLeft;
    const bottomAlignment = Alignment.bottomRight;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: topAlignment,
          end: bottomAlignment,
        ),
      ),
      child: DiceRoller()
    );
  }
}
