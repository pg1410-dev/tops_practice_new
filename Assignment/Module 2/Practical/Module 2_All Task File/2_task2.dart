// Task 2:
// Create a program that converts temperature from Celsius to Fahrenheit and vice versa.
// Implement functions to handle both conversions and let the user choose the conversion type.

import 'dart:io';

void main() {
  print("Temperature Converter");
  print("1. Celsius to Fahrenheit");
  print("2. Fahrenheit to Celsius");
  stdout.write("Choose an option (1 or 2): ");
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    // Celsius to Fahrenheit
    stdout.write("Enter temperature in Celsius: ");
    String? celsiusInput = stdin.readLineSync();
    double? celsius = double.tryParse(celsiusInput ?? '');
    if (celsius != null) {
      double fahrenheit = celsiusToFahrenheit(celsius);
      print("Temperature in Fahrenheit: $fahrenheit");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else if (choice == '2') {
    // Fahrenheit to Celsius
    stdout.write("Enter temperature in Fahrenheit: ");
    String? fahrenheitInput = stdin.readLineSync();
    double? fahrenheit = double.tryParse(fahrenheitInput ?? '');
    if (fahrenheit != null) {
      double celsius = fahrenheitToCelsius(fahrenheit);
      print("Temperature in Celsius: $celsius");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else {
    print("Invalid choice. Please select 1 or 2.");
  }
}

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}