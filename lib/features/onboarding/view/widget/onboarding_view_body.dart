import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'onboarding_navigation.dart' show OnboardingNavigation;
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          if (currentPage < 2)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffF0EEFF),
                ),
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: AppTextStyles.semiBold13(
                    context,
                  ).copyWith(color: const Color(0xff6C47FF)),
                ),
              ),
            ),

          const SizedBox(height: 16),

          Expanded(
            child: OnboardingPageView(
              pageController: _pageController,
              onPageChanged: (pageIndex) {
                setState(() {
                  currentPage = pageIndex;
                });
              },
            ),
          ),

          OnboardingNavigation(
            pageController: _pageController,
            pageIndex: currentPage,
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
