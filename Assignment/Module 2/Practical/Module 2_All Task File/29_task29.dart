// Task 29:
// Write a program that uses the spread operator to combine multiple lists into one list. Remove
// duplicates and sort the list in ascending order.

void main() {
  List<int> list1 = [1, 2, 3, 4, 5];
  List<int> list2 = [4, 5, 6, 7, 8];
  List<int> list3 = [7, 8, 9, 10];

  List<int> combined = [
    ...list1,
    ...list2,
    ...list3
  ];

  // Remove duplicates
  combined = combined.toSet().toList();

  // Sort the list
  combined.sort();

  print("Combined and sorted list:");
  print(combined);
}
