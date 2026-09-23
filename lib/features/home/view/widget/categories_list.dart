import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(categories.length, (i) {
        final cat = categories[i];
        return CategoryItem(icon: cat.icon, label: cat.name);
      }),
    );
  }
}
