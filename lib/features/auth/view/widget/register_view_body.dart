import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/auth/view/widget/register_form.dart';
import 'package:flutter/material.dart';

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
            Text("Create Account", style: AppTextStyles.extraBold26(context)),
            Text(
              "Join thousands of workspace explorers",
              style: AppTextStyles.regular14(
                context,
              ).copyWith(color: const Color(0xff8A8AAA)),
            ),
            const SizedBox(height: 24),
            RegisterForm(),
            const SizedBox(height: 12),
            RegisterNavigation(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
