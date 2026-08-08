import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_button.dart';
import 'package:deskly_app/features/auth/view/widget/user_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email Address", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.emailIcon,
              hint: "ahmed@example.com",
            ),
          ),
          const SizedBox(height: 18),
          Text("Password", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.lockIcon,
              hint: "• • • • • • • •",
              isPassword: true,
            ),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: AppTextStyles.medium13(
                context,
              ).copyWith(color: AppColors.primaryPurple),
            ),
          ),
          const SizedBox(height: 18),

          GradientButton(
            title: "Sign In",
            radius: 16,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      ),
    );
  }
}
