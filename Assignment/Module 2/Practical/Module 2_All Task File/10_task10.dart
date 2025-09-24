// Task 10:
// Create a function that checks if a string is a palindrome (reads the same backward as forward).

import 'dart:io';

bool isPalindrome(String str) {
  String cleaned = str.replaceAll(RegExp(r'[\W_]+', ), '').toLowerCase();
  String reversed = cleaned.split('').reversed.join('');
  return cleaned == reversed;
}

void main() {
  stdout.write("Enter a string: ");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Invalid input");
    return;
  }

  if (isPalindrome(input)) {
    print("$input is a palindrome.");
  } else {
    print("$input is not a palindrome.");
  }
}
