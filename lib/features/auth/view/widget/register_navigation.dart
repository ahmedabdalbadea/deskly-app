import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterNavigation extends StatelessWidget {
  const RegisterNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: AppTextStyles.regular13(
            context,
          ).copyWith(color: AppColors.mutedText),
        ),

        const SizedBox(width: 4),

        Pressable(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          radius: 0,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Sign In",
            style: AppTextStyles.semiBold13(
              context,
            ).copyWith(color: AppColors.primaryPurple),
          ),
        ),
      ],
    );
  }
}
