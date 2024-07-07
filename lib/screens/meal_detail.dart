import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;
  //final void Function(Meal meal) togglefavourite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isfavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final result = ref
                  .read(favouriteMealsProvider.notifier)
                  .togglefavorite(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(result
                      ? 'Meal was added to favorites'
                      : 'Meal was removed from favorites'),
                ),
              );
              //togglefavourite(meal);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isfavourite ? Icons.star : Icons.star_border,
                key: ValueKey(isfavourite),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                step,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
        ]),
      ),
    );
  }
}
