import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      radius: 12,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
          image: const DecorationImage(
            image: AssetImage(AppImages.profileTest),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
