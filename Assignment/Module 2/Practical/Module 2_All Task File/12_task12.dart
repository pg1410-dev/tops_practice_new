// Task 12:
// Create a function that accepts a list of numbers and returns the largest and smallest numbers
// in the list.



void main() {
  List<int> numbers = [3, 5, 1, 8, 2, -4, 7];
  
  var result = findLargestAndSmallest(numbers);
  
  print('Largest number: ${result['largest']}');
  print('Smallest number: ${result['smallest']}');
}

Map<String, int> findLargestAndSmallest(List<int> numbers) {
  int largest = numbers[0];
  int smallest = numbers[0];

  for (int num in numbers) {
    if (num > largest) {
      largest = num;
    }
    if (num < smallest) {
      smallest = num;
    }
  }

  return {'largest': largest, 'smallest': smallest};
}
