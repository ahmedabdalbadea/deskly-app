import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordIcon extends StatelessWidget {
  const ForgotPasswordIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.surface,
      ),
      child: SvgPicture.asset(AppImages.lockKeyIcon),
    );
  }
}
