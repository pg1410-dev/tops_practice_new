

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task37/counter_provider.dart';
import 'package:task37/counter_text.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter with Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: CounterText()),
           SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: counter.increment,
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: counter.decrement,
                child: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}