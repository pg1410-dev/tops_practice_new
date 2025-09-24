

import 'package:flutter/material.dart';
import 'package:task42/custom_progress_bar.dart';

class ProgressBarDemo extends StatefulWidget {
  const ProgressBarDemo({super.key});

  @override
  State<ProgressBarDemo> createState() => _ProgressBarDemoState();
}

class _ProgressBarDemoState extends State<ProgressBarDemo> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Bar'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(_progress * 100).toInt()}%',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomProgressBar(progress: _progress),
              SizedBox(height: 40),
              Slider(
                value: _progress,
                min: 0.0,
                max: 1.0,
                onChanged: (newValue) {
                  setState(() {
                    _progress = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
