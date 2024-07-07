import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });
  //final Map<Filter, bool> filters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PopScope(
    //   canPop: true,
    //   onPopInvoked: (didPop)  {
    //     if (didPop) {
    //       ref.read(filtersProvider.notifier).setFilters({
    //       Filter.glutenfree: _glutenFreeFilterSet,
    //       Filter.lactoseFree: _lactoseFreeFilterSet,
    //       Filter.vegeterian: _vegeterian,
    //       Filter.vegan: _vegan,
    //     });
    //       return;
    //     }
    //print('ishan');

    // Navigator.of(context).pop({
    //   Filter.glutenfree: _glutenFreeFilterSet,
    //   Filter.lactoseFree: _lactoseFreeFilterSet,
    //   Filter.vegeterian: _vegeterian,
    //   Filter.vegan: _vegan,
    // });
    //didPop = true;
    // },
    final filtermap = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(children: [
        SwitchListTile(
          value: filtermap[Filter.glutenfree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenfree, isChecked);
          },
          title: Text(
            'Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          subtitle: Text(
            'Only include gluten-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: filtermap[Filter.lactoseFree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          title: Text(
            'Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          subtitle: Text(
            'Only include lactose-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: filtermap[Filter.vegeterian]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegeterian, isChecked);
          },
          title: Text(
            'Vegeterian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          subtitle: Text(
            'Only include Vegeterian meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: filtermap[Filter.vegan]!,
          onChanged: (isChecked) {
            ref
                .watch(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          title: Text(
            'Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          subtitle: Text(
            'Only include Vegan meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
    );
  }
}
