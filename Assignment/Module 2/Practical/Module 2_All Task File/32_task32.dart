// Task 32:
// Implement a simple number guessing game where the computer generates a random number,
// and the user has to guess it. Use a lambda function to provide hints, such as “too high” or
// “too low.”

import 'dart:math';
import 'dart:io';

void main() {
  int target = Random().nextInt(100) + 1;
  int attempts = 0;

  print("Welcome to the Number Guessing Game!");
  print("I'm thinking of a number between 1 and 100.");

  while (true) {
    stdout.write("Enter your guess: ");
    int guess = int.parse(stdin.readLineSync()!);
    attempts++;

    String hint = (guess < target) ? "too low" : (guess > target) ? "too high" : "correct";
    print("Your guess is $hint.");

    if (guess == target) {
      print("Congratulations! You've guessed the number in $attempts attempts.");
      break;
    }
  }
}
