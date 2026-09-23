import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

import 'categories_list.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categories});
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextStyles.bold16(
            context,
          ).copyWith(color: AppColors.primaryText),
        ),
        const SizedBox(height: 12),
        CategoriesList(categories: categories),
      ],
    );
  }
}
