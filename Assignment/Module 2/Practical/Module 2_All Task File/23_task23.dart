// Task 23:
// Implement a calculator that catches invalid input errors (like entering a string instead of a
// number). Display appropriate error messages and ask for re-entry.

import 'dart:io';

void main() {
  while (true) {
    try {
      stdout.write("Enter the first number: ");
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter the second number: ");
      double num2 = double.parse(stdin.readLineSync()!);
      print("Result: ${num1 / num2}");
      break; // Exit the loop if successful
    } catch (e) {
      print("Invalid input. Please enter valid numbers.");
    }
  }
}
