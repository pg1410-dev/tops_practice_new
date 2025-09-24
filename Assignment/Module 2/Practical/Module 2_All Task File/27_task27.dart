// Task 27:
// Write a function that simulates fetching multiple data points (e.g., list of users)
// asynchronously. Use await and async keywords to wait for each "data point" to load, then
// display all the data once loaded.

import 'dart:async';

Future<String> fetchData(String userId) async {
  await Future.delayed(Duration(seconds: 2));
  return "User $userId";
}

Future<void> fetchAllData() async {
  List<Future<String>> futures = [];
  for (int i = 1; i <= 5; i++) {
    futures.add(fetchData(i.toString()));
  }

  List<String> results = await Future.wait(futures);
  print("All Data Loaded:");
  results.forEach(print);
}

void main() {
  fetchAllData();
}
