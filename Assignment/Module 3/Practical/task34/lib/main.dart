// Task 34:
// Create a button that, when pressed, expands or collapses a section of content using the
// AnimatedContainer widget.

import 'package:flutter/material.dart';

void main() {
  runApp(const ExpandableApp());
}

class ExpandableApp extends StatelessWidget {
  const ExpandableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandableSection(),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({super.key});

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable Section'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                _isExpanded ? 'Collapse' : 'Expand',
              ),
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: _isExpanded ? 200.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(
                    'Flutter is an open-source UI development platform from Google that enables developers'
                        ' to build natively compiled applications for mobile, web, desktop, and embedded '
                        'devices from a single codebase. It uses the Dart programming language and a rich '
                        'set of customizable widgets to create visually appealing, high-performance apps '
                        'with a fast development cycle and features like "stateful hot reload".',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
