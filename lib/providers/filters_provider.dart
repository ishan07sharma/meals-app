import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

enum Filter {
  glutenfree,
  lactoseFree,
  vegeterian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactoseFree: false,
          Filter.vegeterian: false,
          Filter.vegan: false
        });
  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filtermealsProvider = Provider((ref) {
  final filteredMap = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
      if (filteredMap[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filteredMap[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filteredMap[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (filteredMap[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});
