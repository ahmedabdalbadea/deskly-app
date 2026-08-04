import 'package:flutter/material.dart';

import 'onboarding_page_content.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [OnboardingPageContent()]),
    );
  }
}
