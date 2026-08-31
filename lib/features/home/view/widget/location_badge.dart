import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LocationBadge extends StatelessWidget {
  final VoidCallback? onPressed;

  const LocationBadge({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Text(
            '📍Maadi',
            style: AppTextStyles.semiBold11(
              context,
            ).copyWith(color: AppColors.primaryPurple),
          ),
        ),
      ),
    );
  }
}
