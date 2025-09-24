import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

String _input = '';
String _result = '';

class _CalculatorScreenState extends State<CalculatorScreen> {
  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        try {
          final finalInput = _input.replaceAll('x', '*').replaceAll('+', '/');
          _result = _calculate(finalInput);
        } catch (e) {
          _result = "Error";
        }
      } else {
        _input += value;
      }
    });
  }

  String _calculate(String input) {
    try {
      final exp = input.replaceAll(RegExp(r'[^0-9+\-*/.]'), '');
      final result = double.parse(_simpleEvaluate(exp));
      return result.toString();
    } catch (_) {
      return 'Error';
    }
  }

  String _simpleEvaluate(String input) {
    final regex = RegExp(r'(\d+\.?\d*|\+|\-|\*|\/)');
    final tokens = regex.allMatches(input).map((e) => e.group(0)!).toList();

    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double num = double.parse(tokens[i + 1]);
      if (operator == '+') result += num;
      if (operator == '-') result -= num;
      if (operator == '*') result *= num;
      if (operator == '/') result /= num;
    }
    return result.toString();
  }

  Widget _buildButton(String value) {
    return ElevatedButton(
      onPressed: () => _onPressed(value),
      child: Text(value, style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator UI!")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    _input,
                    style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷')]),
              Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×')]),
              Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')]),
              Row(children: [_buildButton('0'), _buildButton('.'), _buildButton('='), _buildButton('+')]),
              Row(children: [_buildButton('C')]),
            ],
          ),
        ],
      ),
    );
  }
}
