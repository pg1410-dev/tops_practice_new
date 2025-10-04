import 'package:flutter/material.dart';
import 'dart:math';
import 'package:new_dice_app/styled_text.dart';

final randomize = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 2;

  void rollDice() {
    setState(() {
      // activeDiceImage = 'assets/images/dice-4.png';
      activeDiceImage = randomize.nextInt(6) + 1;
    });
    print("Changing Dice...");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/dice-${activeDiceImage}.png', width: 200),
          const SizedBox(height: 20),
          TextButton(
            onPressed: rollDice,
            // style: TextButton.styleFrom(
            //   padding: const EdgeInsets.only(top: 20),
            //   foregroundColor: Colors.white,
            //   textStyle: TextStyle(
            //     fontSize: 28
            //   )
            // ),
            child: const StyledText('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
