import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AvailableTimeItem extends StatelessWidget {
  const AvailableTimeItem({super.key, this.active = false, required this.time});

  final bool active;
  final String time;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: !active ? AppColors.surfaceLight : null,
        gradient: active ? AppGradients.primary : null,
      ),
      child: Text(
        time,
        style: AppTextStyles.semiBold12(
          context,
        ).copyWith(color: active ? Colors.white : AppColors.mutedText),
      ),
    );
  }
}
