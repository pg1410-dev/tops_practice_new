// Task 22:
// Write a program that reads a file and displays its contents. Handle potential file not found
// exceptions and display an error message if the file doesn’t exist.

import 'dart:io';

void main() {
  print("Enter the file path:");
  String filePath = stdin.readLineSync()!;

  try {
    String contents = File(filePath).readAsStringSync();
    print("File Contents:\n$contents");
  } catch (e) {
    print("Error: $e");
  }
}
