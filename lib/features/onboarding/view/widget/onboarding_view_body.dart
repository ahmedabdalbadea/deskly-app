import 'package:deskly_app/features/onboarding/view/widget/onboarding_hero_card.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [AspectRatio(aspectRatio: 1, child: OnboardingHeroCard())],
      ),
    );
  }
}
