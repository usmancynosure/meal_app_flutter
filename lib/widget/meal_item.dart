import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/meal_item_trait.dart';

class mealItems extends StatelessWidget {
  final void Function() onSelectItem;
  final Meal meal;
  const mealItems({super.key, required this.meal, required this.onSelectItem});

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get AffordabilityTest {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      //by apply shape stack does not support
      //for this use clipbehavioue
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectItem();
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 250,
              //make sure intire width is used
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  children: [
                    Text(meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true, //text be beutiful
                        overflow: TextOverflow.ellipsis, //if text is very long
                        style: const TextStyle(
                            color: Color.fromARGB(255, 242, 238, 238),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //  row inside row needs expnaded but in this case positioned auto addjust
                      children: [
                        mealItem(
                            icon: Icons.schedule, text: '${meal.duration} min'),
                        const SizedBox(width: 5),
                        mealItem(
                          icon: Icons.work,
                          text: complexityText,
                        ),
                        const SizedBox(width: 5),
                        mealItem(
                          icon: Icons.attach_money,
                          text: AffordabilityTest,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
