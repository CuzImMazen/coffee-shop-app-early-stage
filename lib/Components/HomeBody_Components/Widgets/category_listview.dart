import 'package:coffe_shop/Components/HomeBody_Components/Widgets/category_container.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    required this.toggleTab,
    required this.activeCategoryIndex,
  });
  final Function toggleTab;
  final int activeCategoryIndex;

  final List<String> categories = const ["All", "Coffee", "Tea", "Latte"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryContainer(
            text: categories[index],
            toggleTab: () => toggleTab(index),
            isActive: index == activeCategoryIndex,
          );
        },
      ),
    );
  }
}
