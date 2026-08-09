import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/view/widget/forgot_password_navigation.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'forgot_password_icon.dart';
import 'user_input.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              ForgotPasswordIcon(),

              const SizedBox(height: 24),

              Text(
                "Forgot Password?",
                style: AppTextStyles.extraBold28(context),
              ),

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

              const SizedBox(height: 16),

              GradientButton(
                title: "Send Reset Link",
                radius: 16,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.surface,
                ),

                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: SvgPicture.asset(AppImages.lightBulbIcon),
                  title: Text(
                    "Check your inbox",
                    style: AppTextStyles.semiBold13(
                      context,
                    ).copyWith(color: AppColors.primaryPurple),
                  ),
                  subtitle: Text(
                    "The reset link will expire in 15 minutes. Check your spam folder if you're not seeing it.",
                    style: AppTextStyles.regular12(
                      context,
                    ).copyWith(color: const Color(0xff8A8AAA)),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ForgotPasswordNavigation(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
