import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_button.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_check_box.dart';
import 'package:flutter/material.dart';

import 'user_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full Name", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.personIcon,
              hint: "Ahmed Mohamed",
            ),
          ),

          const SizedBox(height: 18),

          Text("Email Address", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.emailIcon,
              hint: "ahmed@example.com",
            ),
          ),

          const SizedBox(height: 18),

          Text("Phone Number", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.phoneIcon,
              hint: "+20 10 1234 5678",
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

          Text("Confirm Password", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.lockIcon,
              hint: "• • • • • • • •",
              isPassword: true,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              GradientCheckBox(),
              const SizedBox(width: 8),
              Text("I agree to ", style: AppTextStyles.regular12(context)),

              Text(
                "the Terms of Service",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),

              Text(" and ", style: AppTextStyles.regular12(context)),

              Text(
                "Privacy Policy",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ],
          ),

          const SizedBox(height: 18),

          GradientButton(
            title: "Create Account",
            radius: 16,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      ),
    );
  }
}
