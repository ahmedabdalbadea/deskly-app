import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: AppColors.surface),
      onPressed: onPressed,
      child: Text(
        "Skip",
        style: AppTextStyles.semiBold13(
          context,
        ).copyWith(color: AppColors.primaryPurple),
      ),
    );
  }
}
