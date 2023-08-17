import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/meal_item.dart';
import 'package:meals_app/screens/single_meal.dart';

class mealScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onselectFavourite;
  const mealScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onselectFavourite});

  void _itemSelect(BuildContext context, Meal meal) {
    //filtererd list

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SingleMealScreen(
          title: meal.title,
          meal: meal,
          onselectFavourite: onselectFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      // scrollDirection: Axis.horizontal,
      itemCount: meals.length,
      itemBuilder: (ctx, index) => mealItems(
        meal: meals[index],
        onSelectItem: () => _itemSelect(context, meals[index]),
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "oho...No meal avalaible",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Try differrent Category",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
