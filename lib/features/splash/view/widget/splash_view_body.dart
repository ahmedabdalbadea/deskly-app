import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/splash/view/widget/deskly_logo.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DesklyLogo(),
        const SizedBox(height: 28),
        ShaderMask(
          shaderCallback: (bounds) {
            return AppGradients.primary.createShader(bounds);
          },
          child: Text(
            "Deskly",
            style: AppTextStyles.bold38(context).copyWith(color: Colors.white),
          ),
        ),

        const SizedBox(height: 6),
        Text(
          "Your workspace, on demand",
          style: AppTextStyles.regular14(
            context,
          ).copyWith(color: const Color(0xff6E6E8A)),
        ),

        const SizedBox(height: 48),
      ],
    );
  }
}
