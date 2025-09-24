// Task 28:
// Implement a mock weather fetching program. Display different messages as it waits for a
// response and then shows a message like “Weather data loaded successfully.”

import 'dart:async';

Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Sunny, 25°C";
}

void main() async {
  print("Fetching weather data...");
  String weather = await fetchWeatherData();
  print("Weather data loaded successfully:");
  print(weather);
}
