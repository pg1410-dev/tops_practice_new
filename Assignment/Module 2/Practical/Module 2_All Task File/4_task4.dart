// Task 4:
// Create a program that calculates the area and circumference of a circle. Use constants to store the value of pi.


void main() {
  double radius = 5.0; // Example radius
  double area = calculateArea(radius);
  double circumference = calculateCircumference(radius);

  print('Area of the circle: $area');
  print('Circumference of the circle: $circumference');
}
const double pi = 3.14159;

double calculateArea(double radius) {
  return pi * radius * radius;
}

double calculateCircumference(double radius) {
  return 2 * pi * radius;
}