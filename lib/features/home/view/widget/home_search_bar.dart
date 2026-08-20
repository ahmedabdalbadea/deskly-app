import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'filter_button.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    this.onTap,
    this.onChanged,
    this.onFilterPressed,
    this.controller,
    this.readOnly = false,
  });

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterPressed;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.regular13(
          context,
        ).copyWith(color: const Color(0xFF1E1E2D)),
        decoration: InputDecoration(
          hintText: "Search workspaces, locations...",
          hintStyle: AppTextStyles.regular13(
            context,
          ).copyWith(color: AppColors.mutedText),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.mutedText,
            size: 22,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: FilterButton(onPressed: onFilterPressed),
          ),
        ),
      ),
    );
  }
}
