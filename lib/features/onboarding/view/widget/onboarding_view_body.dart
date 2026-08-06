import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_navigation.dart';
import 'onboarding_page_view.dart';
import 'skip_button.dart';

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
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedSwitcher(
              duration: kAnimationDuration,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: currentPage < 2
                  ? SkipButton(
                      onPressed: () {
                        context.go(AppRouter.kLoginView);
                      },
                    )
                  : const SizedBox.shrink(),
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
