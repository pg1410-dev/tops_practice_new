// Task 11:
// Write a recursive function to generate the Fibonacci series up to a specified number.

import 'dart:io';

List<int> fibonacci(int n, [List<int>? series]) {
  series ??= [0, 1];
  if (series.length >= n) {
    return series.sublist(0, n);
  }
  series.add(series[series.length - 1] + series[series.length - 2]);
  return fibonacci(n, series);
}

void main() {
  stdout.write("Enter the number of Fibonacci numbers to generate: ");
  int? count = int.tryParse(stdin.readLineSync()!);

  if (count == null || count <= 0) {
    print("Invalid input");
    return;
  }

  List<int> result = fibonacci(count);
  print("Fibonacci series up to $count: $result");
}
