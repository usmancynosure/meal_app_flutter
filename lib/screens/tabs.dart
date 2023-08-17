import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/Categories.dart';
import 'package:meals_app/screens/meal_items_screen.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/main_drawer.dart';
import 'package:meals_app/screens/filter_Screen.dart';

const initailfiltermeal = {
  //initially false
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class Navigationtab extends StatefulWidget {
  const Navigationtab({super.key});

  @override
  State<Navigationtab> createState() => _NavigationtabState();
}

class _NavigationtabState extends State<Navigationtab> {
  var _selectTabIndex = 0;
  final List<Meal> _favouriteMeal = [];
  Map<Filter, bool> _filteredmeal = initailfiltermeal;

  void selectedTabIndex(int index) {
    setState(() {
      _selectTabIndex = index;
    });
  }

  void _showsnakbarmessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _togglefavouriteMeal(Meal meal) {
    final isExisting = _favouriteMeal.contains(meal);

    if (isExisting == true) {
      setState(() {
        _favouriteMeal.remove(meal);
        _showsnakbarmessage("meal is no longer favourite");
      });
    } else {
      setState(() {
        _favouriteMeal.add(meal);
        _showsnakbarmessage("meal is added to favourite");
      });
    }
  }

  //on seleted drawar
  void _setScreen(String item) async {
    Navigator.of(context).pop();

    if (item == "filter") {
      final resultfilter = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFiltermeal: _filteredmeal),
        ),
      );

      setState(
        () {
          _filteredmeal = resultfilter ?? _filteredmeal;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //list of availabemeal same as the dummymeal
    final available_meals = dummyMeals.where((meal) {
      if (_filteredmeal[Filter.glutenfree] == true && !meal.isGlutenFree) {
        return false;
      }
      if (_filteredmeal[Filter.lactosefree] == true && !meal.isLactoseFree) {
        return false;
      }
      if (_filteredmeal[Filter.vegan] == true && !meal.isVegan) {
        return false;
      }
      if (_filteredmeal[Filter.vegetarian] == true && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoriesScreen(
      onselectFavourite: _togglefavouriteMeal,
      available_meal: available_meals,
    );
    var activepage = "Categories";
    if (_selectTabIndex == 1) {
      activeScreen = mealScreen(
        meals: _favouriteMeal,
        onselectFavourite: _togglefavouriteMeal,
      );
      activepage = "Favourite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepage),
      ),
      drawer: mianDrawer(onSelectedDrawar: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedTabIndex,
        currentIndex: _selectTabIndex,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
