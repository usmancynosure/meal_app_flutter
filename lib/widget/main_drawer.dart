import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class mianDrawer extends StatelessWidget {
  final void Function(String item) onSelectedDrawar;
  const mianDrawer({super.key, required this.onSelectedDrawar});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            curve: Curves.bounceOut,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onPrimaryContainer,
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.breakfast_dining,
                    size: 45,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.7)),
                const SizedBox(
                  width: 19,
                ),
                Text(
                  "Cooking up!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 25,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                size: 30,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8)),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 19,
                  ),
            ),
            onTap: () {
              onSelectedDrawar("meals");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.settings,
                size: 30,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8)),
            title: Text(
              "Filter",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 19,
                  ),
            ),
            onTap: () {
              onSelectedDrawar("filter");
            },
          ),
        ],
      ),
    );
  }
}
