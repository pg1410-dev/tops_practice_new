// Create a simple grading system that takes a student’s score as input and prints their grade:
//  A: 90–100
//  B: 80–89
//  C: 70–79
//  D: 60–69
//  F: Below 60


import 'dart:io';

void main() {

  stdout.write("Enter Student Score");
  String? score = stdin.readLineSync();

  for ( int i = 1; i <= 100; i++){
    if (score == i.toString()) {
      if (i >= 90 && i <= 100) {
        print("Grade is A");
      } else if (i >= 80 && i <= 89) {
        print("Grade is B");
      } else if (i >= 70 && i <= 79) {
        print("Grade is C");
      } else if (i >= 60 && i <= 69) {
        print("Grade is D");
      } else {
        print("Grade is F");
      }
    }
  }

} 
