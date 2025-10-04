import 'package:flutter/material.dart';
import 'package:new_meal_app/data/dummy_data.dart';
import 'package:new_meal_app/models/category.dart';
import 'package:new_meal_app/models/meal.dart';
import 'package:new_meal_app/screens/meals_screen.dart';
import 'package:new_meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  // final void Function(Meal meal) toggleMealFavouriteStatus;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // with keyword sathe aa use karvu pade niche
  late AnimationController _animationController; // ni line na code sathe <-

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // <-  vsync ma this object apvu pade
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController
        .forward(); // NOTE: <- .forward() apiye to Animation Start that
  }

  @override
  void dispose() {
    // NOTE: <- dispose() animation auto remove karva
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: availableCategories
            .map(
              (category) => CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ),
            )
            .toList(),
      ),

      // builder: (ctx, child) => Padding(
      //     padding: EdgeInsets.only(
      //       bottom: 100 - _animationController.value * 100,         // <- Aya Animation nu logic ave, Value = upperBound ,lowerBound
      //     ),
      // child: child,             // <- child ma child apvu pade tyare j data load thay ne ave
      // ),


      // Biji Animation ni Rit

      builder: (ctx, child) => SlideTransition(
        position: Tween(begin: Offset(0, 0.5), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,            // <- child ma child apvu pade tyare j data load thay ne ave
      ),
    );
  }
}
