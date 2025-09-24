// Task 31:
// Write a program that uses async* to create a stream of integers. Display each integer as it’s
// emitted and stop the stream after a certain count.

import 'dart:async';

Stream<int> generateNumbers(int count) async* {
  for (int i = 1; i <= count; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print("Starting number stream...");
  await for (var number in generateNumbers(5)) {
    print("Received: $number");
  }
  print("Number stream completed.");
}
