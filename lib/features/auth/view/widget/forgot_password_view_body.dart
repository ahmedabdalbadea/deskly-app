import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';

import 'forgot_password_icon.dart';
import 'user_input.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ForgotPasswordIcon(),
          const SizedBox(height: 24),
          Text("Forgot Password?", style: AppTextStyles.extraBold28(context)),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Text(
              "Don't worry! Enter your email and we'll send you a reset link.",
              style: AppTextStyles.regular14(
                context,
              ).copyWith(color: const Color(0xff8A8AAA)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email Address",
              style: AppTextStyles.medium13(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.emailIcon,
              hint: "ahmed@example.com",
            ),
          ),

          const SizedBox(height: 12),

          GradientButton(
            title: "Send Reset Link",
            radius: 16,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      ),
    );
  }
}
