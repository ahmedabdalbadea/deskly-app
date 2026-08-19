import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class DesklyLogo extends StatelessWidget {
  const DesklyLogo({super.key, this.size, this.backgroundColor, this.radius});
  final double? size, radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 120,
      height: size ?? 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.20),
            blurRadius: 23,
            offset: const Offset(0, 12),
            spreadRadius: 0,
          ),
        ],
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 32),
      ),
      child: Image.asset(AppImages.desklyLogo),
    );
  }
}
