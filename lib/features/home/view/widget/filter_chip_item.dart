import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilterChipItem extends StatelessWidget {
  const FilterChipItem({super.key, this.active = false, required this.filter});
  final bool active;
  final String filter;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: !active ? AppColors.surfaceLight : null,
        gradient: active ? AppGradients.primary : null,
      ),
      child: Text(
        filter,
        style: AppTextStyles.semiBold12(
          context,
        ).copyWith(color: active ? Colors.white : const Color(0xff6E6E8A)),
      ),
    );
  }
}
