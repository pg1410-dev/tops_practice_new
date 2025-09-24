// Task 35:
// Write a program that uses the path package to manipulate file paths. Extract the directory,
// filename, and extension from a file path string.

import 'package:path/path.dart' as path;

void main() {
  String filePath = '/f:/Tops/Assignment/A/Module 2/Practical/Module 2_All Task File/35_task35.dart';

  // Extracting directory, filename, and extension
  String dir = path.dirname(filePath);
  String fileName = path.basenameWithoutExtension(filePath);
  String extension = path.extension(filePath);

  print('Directory: $dir');
  print('Filename: $fileName');
  print('Extension: $extension');
}
