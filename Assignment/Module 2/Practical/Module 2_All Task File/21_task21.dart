// Task 21:
// Create a program that accepts a number from the user and performs division by another
// number. Use exception handling to manage division by zero errors.

import 'dart:io';

void main() {
  print("Enter the numerator:");
  double numerator = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the denominator: ");
  double denominator = double.parse(stdin.readLineSync()!);

  try {
    divide(numerator, denominator);
    print("Result: \$result");
  } catch (e) {
    print("Error: $e");
  }
}

double divide(double a, double b) {
  if (b == 0) {
    throw Exception("Division by zero is not allowed.");
  }
  return a / b;
}
