import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'onboarding_hero_card.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({super.key, required this.item});
  final OnboardingModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: OnboardingHeroCard(image: item.image, gradient: item.gradient),
        ),
        const SizedBox(height: 36),

        Text(
          item.title,
          style: AppTextStyles.extraBold28(context),
          maxLines: 2,
        ),
        const SizedBox(height: 12),
        Text(
          item.description,
          style: AppTextStyles.regular15(
            context,
          ).copyWith(color: const Color(0xff6E6E8A)),
        ),
      ],
    );
  }
}
