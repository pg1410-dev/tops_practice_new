// Task 30:
// Create a function that uses higher-order functions. Define a List of numbers and pass it to a
// function that returns a list of squares, cubes, or halves based on the function passed as an
// argument.

List<int> processNumbers(List<int> numbers, int Function(int) operation) {
  return numbers.map(operation).toList();
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> squares = processNumbers(numbers, (n) => n * n);
  List<int> cubes = processNumbers(numbers, (n) => n * n * n);
  List<int> halves = processNumbers(numbers, (n) => (n / 2).toInt());

  print("Squares: $squares");
  print("Cubes: $cubes");
  print("Halves: $halves");
}
