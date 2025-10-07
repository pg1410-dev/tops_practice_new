
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // var declaration API
  final String _apiKey = 'YOUR_API_KEY_HERE';

  final TextEditingController _cityController = TextEditingController();
  String _location = '';
  String _temperature = '';
  String _weatherCondition = '';
  String _humidity = '';
  String _iconUrl = '';
  bool _isLoading = false;
  String? _errorMessage;

  // Fetches data from API
  Future<void> _fetchWeather() async {
    if (_cityController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a city name';
      });
      return;
    }

    if (_apiKey == 'YOUR_API_KEY_HERE') {
      setState(() {
        _errorMessage = 'Please add your API key in the code (main.dart)';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final city = _cityController.text;
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        setState(() {
          _location = weatherData['name'] ?? 'Unknown Location';
          _temperature = '${weatherData['main']['temp'].toStringAsFixed(1)}°C';
          _weatherCondition = weatherData['weather'][0]['main'] ?? '';
          _humidity = 'Humidity: ${weatherData['main']['humidity']}%';
          final iconCode = weatherData['weather'][0]['icon'];
          _iconUrl = 'https://openweathermap.org/img/wn/$iconCode@2x.png';
          _cityController.clear();
        });
      } else {
        final errorData = json.decode(response.body);
        setState(() {
          _errorMessage = errorData['message'] ?? 'City not found';
          _resetWeatherInfo();
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load weather data. Please check your connection.';
        _resetWeatherInfo();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Resets the weather display information
  void _resetWeatherInfo() {
    _location = '';
    _temperature = '';
    _weatherCondition = '';
    _humidity = '';
    _iconUrl = '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.blue.shade800],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWeatherCard(),
                SizedBox(height: 20),
                _buildCityInputField(),
                SizedBox(height: 20),
                _buildFetchButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildWeatherCard() {     // <--- card for displaying weather information
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white.withOpacity(0.9),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _errorMessage != null
            ? Text(
          _errorMessage!,
          style: TextStyle(color: Colors.red, fontSize: 18),
          textAlign: TextAlign.center,
        )
            : _location.isEmpty
            ? Text(
          'Enter a city to get the weather',
          style: TextStyle(fontSize: 20, color: Colors.black54),
          textAlign: TextAlign.center,
        )
            : _buildWeatherDataDisplay(),
      ),
    );
  }



  Widget _buildWeatherDataDisplay() {  // <-----UI for displaying the fetch weather data
    return Column(
      children: [
        Text(
          _location,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        if (_iconUrl.isNotEmpty)
          Image.network(
            _iconUrl,
            errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.cloud_off, color: Colors.grey, size: 64),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CircularProgressIndicator();
            },
          ),
        Text(
          _temperature,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
        ),
        Text(
          _weatherCondition,
          style: TextStyle(fontSize: 24, color: Colors.black54),
        ),
        SizedBox(height: 10),
        Text(
          _humidity,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ],
    );
  }


  Widget _buildCityInputField() {    // <----- text input field for the city
    return TextField(
      controller: _cityController,
      decoration: InputDecoration(
        labelText: 'Enter City Name',
        hintText: 'e.g., London',
        prefixIcon: Icon(Icons.location_city, color: Colors.white70),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
      onSubmitted: (_) => _fetchWeather(),
    );
  }



  Widget _buildFetchButton() {   // <------ button to trigger the weather fetch
    return ElevatedButton(
      onPressed: _fetchWeather,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      child: Text(
        'Get Weather',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
