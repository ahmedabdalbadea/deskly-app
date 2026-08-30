import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.regular13(
          context,
        ).copyWith(color: AppColors.primaryText),

        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceLight,
          hintText: "Search workspaces, locations...",
          hintStyle: AppTextStyles.regular13(
            context,
          ).copyWith(color: AppColors.mutedText),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.mutedText,
            size: 22,
          ),
        ),
      ),
    );
  }
}
