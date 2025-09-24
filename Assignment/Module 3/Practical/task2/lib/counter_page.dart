import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();

}


class _CounterPageState extends State<CounterPage> {

  int _counter = 0;

  void _incrementCounter() {
  setState((){
  _counter++;

  });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 20,
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            child: Text("Flutter!"),
          ),
        ),
      ),
      body: Center(
  child: Text(
  'Counter: $_counter'
  ),
  )
    );

  }
  }