// Task 8:
// Implement a basic calculator that performs addition, subtraction, multiplication, or division
// based on the user’s choice.

import 'dart:io';

void main() {
  stdout.write("Enter first number: ");
  double? num1 = double.tryParse(stdin.readLineSync()!);

  stdout.write("Enter second number: ");
  double? num2 = double.tryParse(stdin.readLineSync()!);

  stdout.write("Enter an operator (+, -, *, /): ");
  String? operator = stdin.readLineSync();

  if (num1 == null || num2 == null || operator == null) {
    print("Invalid input");
    return;
  }

  double? result;

  switch (operator) {
    case "+":
      result = num1 + num2;
      break;
    case "-":
      result = num1 - num2;
      break;
    case "*":
      result = num1 * num2;
      break;
    case "/":
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print("Division by zero is not allowed.");
        return;
      }
      break;
    default:
      print("Invalid operator");
      return;
  }

  print("Result: $result");
}
