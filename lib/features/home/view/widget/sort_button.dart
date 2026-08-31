import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        width: 16,
        height: 16,
        AppImages.adjustmentsIcon,
        color: AppColors.primaryPurple,
        colorBlendMode: BlendMode.srcIn,
      ),
      label: Text(
        "Sort",
        style: AppTextStyles.semiBold12(
          context,
        ).copyWith(color: AppColors.primaryPurple),
      ),
    );
  }
}
