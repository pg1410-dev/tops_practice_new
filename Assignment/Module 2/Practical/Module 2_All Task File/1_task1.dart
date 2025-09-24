// Task 1:
// Write a program that takes a user's name and age as input and prints a welcome message that
// includes their name and how many years they have left until they turn 100.

import 'dart:io';

void main(){

  stdout.write("Enter Your Name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter Your Age: ");
  String? ageInput = stdin.readLineSync();
  int? age = int.tryParse(ageInput?? '');

  if (name != null && age != null) {
    int yearsLeft = 100 - age;
    // print("Welcome $name! You have $yearsLeft years left until you turn 100.");

    if (yearsLeft > 0) {
      print("Hello $name! You have $yearsLeft years left until you turn 100.");
    } else if (yearsLeft == 0) {
      print("Hello $name! You have already turned 100.");
    } else {
      print("Hello $name! You turned 100 ${-yearsLeft} years ago.");
    }
  } else {
    print("Invalid input. Please enter a valid name and age.");
  }
}

//   if (age == null) {
//     print("Invalid age input.");
//     return;
//   }

//   int yearsLeft = 100 - age;

//   print("Welcome $name! You have $yearsLeft years left until you turn 100.");
// }