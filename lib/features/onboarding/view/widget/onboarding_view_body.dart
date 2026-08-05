import 'package:deskly_app/features/onboarding/view/widget/page_indicators_list.dart';
import 'package:flutter/material.dart';

import 'onboarding_page_content.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          OnboardingPageContent(),

          const Spacer(),

          PageIndicatorsList(),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
