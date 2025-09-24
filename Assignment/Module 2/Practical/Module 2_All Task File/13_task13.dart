// Task 13:
// Write a program to input a list of integers and sort them in ascending and descending order
// without using built-in sort methods.

import 'dart:io';

void main() {
  stdout.write("Enter a list of integers (comma-separated): ");
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print("Invalid input");
    return;
  }

  List<int> numbers = input.split(",").map((e) => int.tryParse(e.trim()) ?? 0).toList();

  List<int> ascending = bubbleSort(numbers, ascending: true);
  List<int> descending = bubbleSort(numbers, ascending: false);

  print("Ascending order: $ascending");
  print("Descending order: $descending");
}

List<int> bubbleSort(List<int> numbers, {bool ascending = true}) {
  List<int> sorted = List.from(numbers);
  int n = sorted.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (ascending ? sorted[j] > sorted[j + 1] : sorted[j] < sorted[j + 1]) {
        // Swap
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }
  return sorted;
}
