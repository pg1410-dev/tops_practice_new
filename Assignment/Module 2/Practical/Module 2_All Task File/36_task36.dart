// Task 36:
// Implement a basic file reading and writing program using the dart:io library. Write data to a
// file and read it back, handling any file errors that may occur.

import 'dart:io';

void main() async {
  String filePath = 'example.txt';

  // Writing to a file
  try {
    File file = File(filePath);
    await file.writeAsString('Hello, Dart!');
    print('Data written to file successfully.');
  } catch (e) {
    print('Error writing to file: $e');
  }

  // Reading from a file
  try {
    File file = File(filePath);
    String contents = await file.readAsString();
    print('Data read from file: $contents');
  } catch (e) {
    print('Error reading from file: $e');
  }
}
