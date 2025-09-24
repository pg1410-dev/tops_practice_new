// Task 3:
// Write a program to take a number from the user and determine if it’s even or odd.

import 'dart:io';

void main() {
  stdout.write("Enter a number: ");
  String? input = stdin.readLineSync();
  int? number = int.tryParse(input ?? '');

  if (number != null) {
    if (number % 2 == 0) {
      print("$number is even.");
    } else {
      print("$number is odd.");
    }
  } else {
    print("Invalid input. Please enter a valid number.");
  }
}
