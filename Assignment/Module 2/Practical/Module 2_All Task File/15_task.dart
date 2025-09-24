// Task 15:
// Write a program that counts the frequency of each character in a given string and stores the
// result in a map.

import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Invalid input");
    return;
  }

  Map<String, int> frequencyMap = countCharacterFrequency(input);
  print("Character frequency: $frequencyMap");
}

Map<String, int> countCharacterFrequency(String str) {
  Map<String, int> frequency = {};
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    frequency[char] = (frequency[char] ?? 0) + 1;
  }
  return frequency;
}
