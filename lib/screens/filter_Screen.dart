import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/widget/main_drawer.dart';
import 'package:meals_app/screens/tabs.dart';

enum Filter { vegetarian, vegan, lactosefree, glutenfree }

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> currentFiltermeal;
  const FilterScreen({super.key, required this.currentFiltermeal});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfreefiltercheck = false;
  var _vegetarianfiltercheck = false;
  var _veganfiltercheck = false;
  var _lactosefreefiltercheck = false;

  @override
  void initState() {
    super.initState();
    _glutenfreefiltercheck = widget.currentFiltermeal[Filter.glutenfree]!;
    _lactosefreefiltercheck = widget.currentFiltermeal[Filter.lactosefree]!;
    _veganfiltercheck = widget.currentFiltermeal[Filter.vegan]!;
    _vegetarianfiltercheck = widget.currentFiltermeal[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter by"),
      ),
      // drawer: mianDrawer(
      //   onSelectedDrawar: (item) {
      //     Navigator.of(context).pop();
      //     if (item == "meals") {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const Navigationtab()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          {
            Navigator.of(context).pop(
              {
                Filter.glutenfree: _glutenfreefiltercheck,
                Filter.lactosefree: _lactosefreefiltercheck,
                Filter.vegan: _veganfiltercheck,
                Filter.vegetarian: _vegetarianfiltercheck
              },
            );
            return false;
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreefiltercheck,
              onChanged: (ischeck) {
                setState(() {
                  _glutenfreefiltercheck = ischeck;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only include gluten-free meal",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 15),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: _vegetarianfiltercheck,
              onChanged: (ischeck) {
                setState(() {
                  _vegetarianfiltercheck = ischeck;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only include vegetarian meal",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 15),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: _lactosefreefiltercheck,
              onChanged: (ischeck) {
                setState(() {
                  _lactosefreefiltercheck = ischeck;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only include lactose-free meal",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 15),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: _veganfiltercheck,
              onChanged: (ischeck) {
                setState(() {
                  _veganfiltercheck = ischeck;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "only include vegan meal",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.only(left: 20, right: 15),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
