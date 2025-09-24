import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Counter Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text('Counter Value', style: TextStyle(fontSize: 25)),
              SizedBox(height: 25,),
              Text('$_counter',
                  style: TextStyle(
                      fontSize: 50,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text(
                  'Increment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text(
                  'Decrement',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Icon(Icons.countertops),
            ],
          ),
        ),
      ),
    );
  }
}
