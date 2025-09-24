import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task37/counter_provider.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counter, child) {
        return Text(
          "Counter Value: ${counter.count}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
