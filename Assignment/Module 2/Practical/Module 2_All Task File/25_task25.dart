// Task 25:
// Write a program that simulates a delayed operation using Future.delayed. Display a
// loading message, wait for 3 seconds, and then show a completion message.

import 'dart:async';

void main() {
  print("Loading...");
  Future.delayed(Duration(seconds: 3), () {
    print("Operation completed.");
  });
}
