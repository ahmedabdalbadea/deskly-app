import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/deskly_logo.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 28),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppGradients.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),

      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          children: [
            DesklyLogo(size: 60, radius: 18, backgroundColor: Colors.white30),
            const SizedBox(height: 12),
            Text(
              "Welcome Back",
              style: AppTextStyles.bold22(
                context,
              ).copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "Sign in to your account",
              style: AppTextStyles.regular13(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
