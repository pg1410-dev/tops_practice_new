// Task 24:
// Create a program that accepts a list of integers from the user. Use exception handling to
// handle cases where the user inputs non-integer values.

import 'dart:io';

void main() {
  List<int> numbers = [];
  while (true) {
    try {
      stdout.write("Enter an integer (or 'done' to finish): ");
      String input = stdin.readLineSync()!;
      if (input.toLowerCase() == 'done') {
        break;
      }
      int number = int.parse(input);
      numbers.add(number);
    } catch (e) {
      print("Invalid input. Please enter a valid integer.");
    }
  }

  print("You entered: $numbers");
}
