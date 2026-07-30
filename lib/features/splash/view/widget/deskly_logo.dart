import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class DesklyLogo extends StatelessWidget {
  const DesklyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.20),
            blurRadius: 23,
            offset: const Offset(0, 12),
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Image.asset(AppImages.desklyLogo),
    );
  }
}
