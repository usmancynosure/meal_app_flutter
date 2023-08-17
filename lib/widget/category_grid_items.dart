import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class CategoryItemDisplay extends StatelessWidget {
  final Category category;
  final void Function() onselectCategory;
  const CategoryItemDisplay(
      {super.key, required this.category, required this.onselectCategory});

  @override
  Widget build(BuildContext context) {
    //inkwell is used for the tapon the wigdte to switch to diff screen
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onselectCategory();
      },
      splashColor: Theme.of(context).colorScheme.onBackground,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
