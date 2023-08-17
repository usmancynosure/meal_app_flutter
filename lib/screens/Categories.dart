import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/screens/meal_items_screen.dart';
import 'package:meals_app/widget/category_grid_items.dart';
import 'package:meals_app/model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  // ..accept the after the filter the map
  final List<Meal> available_meal;
  const CategoriesScreen(
      {super.key,
      required this.onselectFavourite,
      required this.available_meal});
  final void Function(Meal meal) onselectFavourite;

  void _selectCategory(BuildContext context, Category category) {
    //match the meals category id to category id

//use available meal instead of dummymeal
    final filteredlist = available_meal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //2nd method->Navigotor.of(context)=>
    // Navigator.push(context, Navi)

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => mealScreen(
          title: category.title,
          meals: filteredlist,
          onselectFavourite: onselectFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //alternative method
        //availablecategories.map((category)=>CategoryItemDisplay(category: category),)
        for (final category in availableCategories)
          CategoryItemDisplay(
            category: category,
            onselectCategory: () => _selectCategory(context, category),
          ),
      ],
    );
  }
}
