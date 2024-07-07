import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onselectMeal});

  final Meal meal;
  final void Function(Meal meal) onselectMeal;
  String get complexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${meal.duration} min',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Icon(
                                Icons.work,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                complexity,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Icon(
                                Icons.currency_rupee,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                affordability,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
