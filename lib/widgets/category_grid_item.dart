import 'package:adhyayan/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final BookCategory category;
  // final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        // onTap: ,
        splashColor: Theme.of(context).primaryColor, //visual tapping effect
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          //using container because container gives us a lot of background decoration thing
          decoration: BoxDecoration(
              //using this because we can create a gradient from it
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.55),
                  category.color.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),

          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
