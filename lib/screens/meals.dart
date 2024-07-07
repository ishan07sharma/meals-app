import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals, });
  final List<Meal> meals;
  final String? title;
 // final void Function(Meal meal) togglefavourite;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MealDetail(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
          const SizedBox(
            height: 16,
          ),
          Text('Try selecting different categories',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ))
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onselectMeal: (meal) {
                  selectMeal(meal, context);
                },
              )

          // Text(meals[index].title,
          // style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //               color: Theme.of(context).colorScheme.onSurface,
          //             )
          // )
          );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
