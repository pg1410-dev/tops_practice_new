// Task 26:
// Create a program that fetches data from a fake API endpoint (using the http package).
// Display the data after it's loaded and catch any errors if the request fails.

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const url = "https://jsonplaceholder.typicode.com/posts/1";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("Title: ${data['title']}");
      print("Body: ${data['body']}");
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Failed to fetch data: $e");
  }
}
