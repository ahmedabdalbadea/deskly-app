import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnboardingHeroCard extends StatelessWidget {
  const OnboardingHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.primary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),

          Positioned(
            left: -40,
            bottom: -40,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),
          Image.asset(AppImages.workspaceIllustration, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
