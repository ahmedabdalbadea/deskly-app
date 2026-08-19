import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginNavigation extends StatelessWidget {
  const LoginNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTextStyles.regular13(
            context,
          ).copyWith(color: AppColors.mutedText),
        ),

        const SizedBox(width: 4),

        Pressable(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          radius: 0,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Sign Up",
            style: AppTextStyles.semiBold13(
              context,
            ).copyWith(color: AppColors.primaryPurple),
          ),
        ),
      ],
    );
  }
}
