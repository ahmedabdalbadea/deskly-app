import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/features/home/view/widget/recent_search_item.dart';
import 'package:flutter/material.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: List.generate(7, (index) {
          return index % 2 == 0
              ? RecentSearchItem(label: "The Hub Cairo")
              : Divider(thickness: 0, color: AppColors.surfaceLight, height: 1);
        }),
      ),
    );
  }
}
