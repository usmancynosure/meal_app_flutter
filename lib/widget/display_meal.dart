import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/model/meal.dart';

class mealData extends StatelessWidget {
  final Meal meal;
  const mealData({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //image display
      children: [
        Container(
          height: 285,
          width: double.infinity,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        //displaying the ingredients
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Ingredients",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 180,
          width: 200,
          //loop
          child: ListView(
            children: [
              for (final ingredient in meal.ingredients)
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    child: Text(ingredient,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        //displaying the steps
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Steps",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 150,
          width: 300,
          //loop
          child: ListView(
            children: [
              for (final step in meal.steps)
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(step,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
