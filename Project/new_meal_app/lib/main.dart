import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_meal_app/screens/tabs_screen.dart';

void main() {

  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
      theme: theme,
      home: TabsScreen()
    // home: const CategoriesScreen(),
    // home: MealsScreen(title: "Category Name", meals: dummyMeals),
  ));
}
