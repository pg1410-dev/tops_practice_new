import 'package:get/get.dart';
import 'package:new_meal_app/models/meal.dart';

// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// import 'package:get/get_state_manager/get_state_manager.dart';

class MealsController extends GetxController {
  final favoriteMeals = List<Meal>.empty().obs;

  String toggleFavoritMeal(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      favoriteMeals.remove(meal);
      return "Meal is no longer Favourite.";
    } else {
      favoriteMeals.add(meal);
      return "Marked as Favourite.";
    }
  }
}
