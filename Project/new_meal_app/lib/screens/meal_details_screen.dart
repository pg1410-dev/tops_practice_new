import 'package:flutter/material.dart';
import 'package:new_meal_app/controller/meals_controller.dart';
import 'package:new_meal_app/models/meal.dart';
import 'package:get/get.dart';


class MealDetailsScreen extends StatefulWidget {
   const MealDetailsScreen({super.key, required this.meal,  });

  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {

  final controller = Get.find<MealsController>();

  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = controller.favoriteMeals.contains(widget.meal);
  }

  void _toggleFavoriteMeal(BuildContext context, Meal meal) {
    final message = controller.toggleFavoritMeal(meal);
    _showMessage(context, message);
    setState(() {                                           // aya setState use karvu j pade to j state rebuild thay
      isFavourite = controller.favoriteMeals.contains(widget.meal);
    });
  }

  // final void Function(Meal meal) toggleMealFavouriteStatus;
  void _showMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
        IconButton(
            onPressed: () => _toggleFavoriteMeal(context, widget.meal),
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                      turns: Tween<double>(
                        begin: 0.8,
                        end: 1).animate(animation),
                    child: child,
                      );
                },
                child: Icon(
                    isFavourite ?  Icons.star : Icons.star_border,
                    key: ValueKey(isFavourite),       // <- icon ma aa rite key apvi j pade toj animation thay
                ),
            ),
        ),
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.meal.id,
              child: Image.network(
                widget.meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            for (final ingredients in widget.meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            SizedBox(height: 10),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            for (final step in widget.meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
