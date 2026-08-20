import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'categories_list.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          'Categories',
          style: AppTextStyles.bold16(
            context,
          ).copyWith(color: AppColors.primaryText),
        ),
        const SizedBox(height: 12),
        const CategoriesList(),
      ],
    );
  }
}
