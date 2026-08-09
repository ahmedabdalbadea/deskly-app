import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key, required this.image, this.onPressed});
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      radius: 14,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: BoxBorder.all(color: AppColors.border, width: 1),
        ),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
