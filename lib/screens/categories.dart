import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categories_item.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.filtered});
  final List<Meal> filtered;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  //final void Function(Meal meal) togglefavourite;
  late AnimationController _animationController;
  @override
  void initState() {
    
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    
  }
  void _selectCategory(BuildContext context, MealsCategory category) {
    List<Meal> filteredlist = widget.filtered
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals(
              title: category.title,
              meals: filteredlist,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(animation: _animationController,
    
     builder: (context,child)=>Padding(
      padding:EdgeInsets.only(
        top:100-_animationController.value*100 ),
        child: child,),
     child: GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final mealscategory in availableCategories)
          CategoriesItem(
            mealscategory,
            onselectcategory: () {
              _selectCategory(context, mealscategory);
            },
          )
      ],
    ),
     )  ;
  }
}
