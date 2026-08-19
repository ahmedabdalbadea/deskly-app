import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gradient_icon_button.dart';
import 'gradient_icon_text_button.dart';
import 'page_indicators_list.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
    required this.pageController,
    required this.pageIndex,
  });
  final PageController pageController;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PageIndicatorsList(activePage: pageIndex),
        Spacer(),

        AnimatedSwitcher(
          duration: kAnimationDuration,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          child: pageIndex != 2
              ? GradientIconButton(
                  key: const ValueKey('next_button'),
                  icon: Icons.arrow_forward_ios_outlined,
                  padding: 20,
                  radius: 50,
                  onPressed: () {
                    pageController.nextPage(
                      duration: kAnimationDuration,
                      curve: Curves.easeInOut,
                    );
                  },
                )
              : GradientIconTextButton(
                  onPressed: () {
                    context.go(AppRouter.kLoginView);
                  },
                  key: const ValueKey('get_started_button'),
                  title: "Get Started",
                  icon: Icons.arrow_right_alt,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  radius: 18,
                ),
        ),
      ],
    );
  }
}
