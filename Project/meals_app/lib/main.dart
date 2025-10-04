import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {

  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  runApp(MaterialApp(
      theme: theme,
      home: TabsScreen()
    // home: const CategoriesScreen(),
    // home: MealsScreen(title: "Category Name", meals: dummyMeals),
  ));
}
