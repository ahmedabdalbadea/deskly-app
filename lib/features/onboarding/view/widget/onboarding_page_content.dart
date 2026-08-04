import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'onboarding_hero_card.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 1, child: OnboardingHeroCard()),
        const SizedBox(height: 36),

        Text(
          "Find Your Perfect Space",
          style: AppTextStyles.extraBold28(context),
          maxLines: 2,
        ),
        const SizedBox(height: 12),
        Text(
          "Browse hundreds of premium co-working spaces, private offices, and meeting rooms near you.",
          style: AppTextStyles.regular15(
            context,
          ).copyWith(color: const Color(0xff6E6E8A)),
        ),
      ],
    );
  }
}
