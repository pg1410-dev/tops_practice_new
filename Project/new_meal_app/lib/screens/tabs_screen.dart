import 'package:flutter/material.dart';
import 'package:new_meal_app/controller/meals_controller.dart';
import 'package:new_meal_app/data/dummy_data.dart';
import 'package:new_meal_app/screens/categories_screen.dart';
import 'package:new_meal_app/screens/filter_screen.dart';
import 'package:new_meal_app/screens/meals_screen.dart';
import 'package:new_meal_app/widgets/main_drawer.dart';
import 'package:get/get.dart';

final kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final controller = Get.put(MealsController()); //Dependency Injection Use

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Aa Controller ma add karyu GetX USE KARVA

  // void _toggleFavoritMeal(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     // show snackbar
  //     _showMessage("Meal is no longer Favourite.");
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     // show snackbar
  //     _showMessage("Marked as Favourite.");
  //   }
  // }

  // void _showMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(
        context,
      ).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilters : _selectedFilters)));
      // print(result);
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();


    Widget activeScreen = CategoriesScreen(
        availableMeals: availableMeals
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: controller.favoriteMeals,
      );
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
