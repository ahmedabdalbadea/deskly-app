import 'package:flutter/material.dart';

import 'onboarding_navigation.dart' show OnboardingNavigation;
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(child: OnboardingPageView()),

          OnboardingNavigation(),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
