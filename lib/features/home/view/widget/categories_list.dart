import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedIndex = 0;
  final categoriesList = const [
    CategoryModel(label: 'Hot Desk', icon: AppImages.hotDeskIcon),
    CategoryModel(label: 'Private Office', icon: AppImages.privateOfficeIcon),
    CategoryModel(label: 'Meeting Room', icon: AppImages.meetingRoomIcon),
    CategoryModel(label: 'Event Space', icon: AppImages.eventSpaceIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(categoriesList.length, (i) {
        final cat = categoriesList[i];
        return CategoryItem(
          icon: cat.icon,
          label: cat.label,
          isSelected: _selectedIndex == i,
          onPressed: () => setState(() => _selectedIndex = i),
        );
      }),
    );
  }
}
