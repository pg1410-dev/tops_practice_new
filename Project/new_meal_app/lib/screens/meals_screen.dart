import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meal.dart';
import 'package:new_meal_app/screens/meal_details_screen.dart';
import 'package:new_meal_app/widgets/meal_item.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) toggleMealFavouriteStatus;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Uh oh... nothing here!!"),
          SizedBox(height: 20),
          Text("Try selecting other category"),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: () => _selectMeal(context, meals[index]),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
