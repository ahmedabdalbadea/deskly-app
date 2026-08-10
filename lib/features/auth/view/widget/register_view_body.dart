import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/auth/view/widget/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'register_navigation.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text("Create Account", style: AppTextStyles.extraBold26(context))
                .animate(delay: 200.ms)
                .fadeIn(duration: kAnimationDuration)
                .slideY(
                  begin: 0.08,
                  end: 0,
                  duration: kAnimationDuration,
                  curve: Curves.easeOutCubic,
                ),

            Text(
              "Join thousands of workspace explorers",
              style: AppTextStyles.regular14(
                context,
              ).copyWith(color: const Color(0xff8A8AAA)),
            ).animate(delay: 260.ms).fadeIn(duration: kAnimationDuration),
            const SizedBox(height: 24),
            RegisterForm()
                .animate(delay: 320.ms)
                .fadeIn(duration: kAnimationDuration)
                .slideY(
                  begin: 0.05,
                  end: 0,
                  duration: kAnimationDuration,
                  curve: Curves.easeOutCubic,
                ),
            const SizedBox(height: 12),
            RegisterNavigation(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
