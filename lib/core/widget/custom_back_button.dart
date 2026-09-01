import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.isActive = true,
  });
  final Color? backgroundColor, iconColor;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: isActive
          ? () {
              context.pop();
            }
          : null,
      icon: Icon(
        size: 18,
        Icons.arrow_back_ios_new_rounded,
        color: iconColor ?? AppColors.primaryPurple,
      ),
    );
  }
}
