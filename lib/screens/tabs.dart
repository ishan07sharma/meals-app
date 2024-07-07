import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';

import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/screens/filters.dart';

const initialfilter = {
  Filter.glutenfree: false,
  Filter.lactoseFree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});
  @override
  ConsumerState<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectedPage = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  //final List<Meal> _favoritemeals = [];

  // void _togglefavoritem(Meal meal) {
  //   final isexisting = _favoritemeals.contains(meal);
  //   if (isexisting) {
  //     setState(() {
  //       _favoritemeals.remove(meal);
  //     });
  //     _showsnackbar('Removed from favourites');
  //   } else {
  //     setState(() {
  //       _favoritemeals.add(meal);
  //     });
  //     _showsnackbar('Added to favourites');
  //   }
  // }

  //Map<Filter, bool> filteredMap = initialfilter;
  void selectScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
      //print(result);
      // setState(() {
      //   filteredMap = result ?? initialfilter;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
   // final filteredMap = ref.watch(filtersProvider);
    final filteredlist = ref.watch(filtermealsProvider);
    Widget content = CategoriesScreen(
      filtered: filteredlist,
    );
    var activetitle = 'Categories';
    if (_selectedPage == 1) {
      final favouritemeal = ref.watch(favouriteMealsProvider);
      content = Meals(meals: favouritemeal);
      activetitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: MainDrawer(
        selectScreen: selectScreen,
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
