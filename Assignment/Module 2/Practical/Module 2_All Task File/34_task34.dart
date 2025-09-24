// Task 34:
// Create a program that generates a QR code from a given string using a QR code package, and
// display it in the console.

import 'package:qr/qr.dart';
import 'dart:io';

void main() {
  stdout.write("Enter a string to generate QR code: ");
  String input = stdin.readLineSync()!;

  // Generate QR code
  final qrCode = QrCode(4, QrErrorCorrectLevel.L);
  qrCode.addData(input);
  qrCode.make();

  // Display QR code in console
  print("Generated QR Code:");
  for (int x = 0; x < qrCode.moduleCount; x++) {
    String line = '';
    for (int y = 0; y < qrCode.moduleCount; y++) {
      line += qrCode.isDark(y, x) ? '██' : '  ';
    }
    print(line);
  }
}

extension on QrCode {
  void make() {}
}

extension QrCodeExtension on QrCode {
  bool isDark(int x, int y) {
    return this.isDark(x, y);
  }
}