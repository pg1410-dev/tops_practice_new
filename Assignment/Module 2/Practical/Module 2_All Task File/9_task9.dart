// Task 9:
// Write a function to calculate the factorial of a number entered by the user.

import 'dart:io';

int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

void main() {
  stdout.write("Enter a number: ");
  int? number = int.tryParse(stdin.readLineSync()!);

  if (number == null) {
    print("Invalid input");
    return;
  }

  int result = factorial(number);
  print("Factorial of $number is $result");
}