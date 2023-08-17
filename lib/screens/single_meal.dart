import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/display_meal.dart';

class SingleMealScreen extends StatelessWidget {
  //title
  //function for uplifting the content to the favorite Screen
  final void Function(Meal meal) onselectFavourite;
  final String title;
  final Meal meal;
  const SingleMealScreen(
      {super.key,
      required this.title,
      required this.meal,
      required this.onselectFavourite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 19,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onselectFavourite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: mealData(meal: meal),
    );
  }
}
