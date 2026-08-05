import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'onboarding_page_content.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this._pageController});
  final PageController _pageController;
  final List<OnboardingModel> onboardingItems = const [
    OnboardingModel(
      image: AppImages.workspaceIllustration,
      title: 'Find Your Perfect Space',
      description:
          'Browse hundreds of premium co-working spaces, private offices, and meeting rooms near you.',
      gradient: AppGradients.primary,
    ),
    OnboardingModel(
      image: AppImages.bookingIllustration,
      title: 'Book in Seconds',
      description:
          'Pick a date, choose your time slot, and confirm your workspace booking instantly.',
      gradient: AppGradients.green,
    ),
    OnboardingModel(
      image: AppImages.qrIllustration,
      title: 'Work From Anywhere',
      description: 'Scan your QR ticket at the entrance and start working.',
      gradient: AppGradients.pink,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return OnboardingPageContent(item: onboardingItems[index]);
      },
    );
  }
}
