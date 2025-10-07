// 2) Implement a news feed app that retrieves and displays articles from an API.

import 'package:flutter/material.dart';
import 'package:project2/screens/news_feed_screen.dart';


final String API_KEY = 'API KEY'; // free https://newsapi.org
final String API_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1A1A2E),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: NewsFeedScreen(),
    );
  }
}







