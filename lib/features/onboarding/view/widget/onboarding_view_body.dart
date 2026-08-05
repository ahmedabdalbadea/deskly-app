import 'package:flutter/material.dart';

import 'gradient_icon_button.dart';
import 'onboarding_page_view.dart';
import 'page_indicators_list.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(child: OnboardingPageView()),

          Row(
            children: [
              PageIndicatorsList(),
              Spacer(),
              GradientIconButton(
                icon: Icons.arrow_forward_ios_outlined,
                padding: 20,
                radius: 50,
                onPressed: () {},
              ),
            ],
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
