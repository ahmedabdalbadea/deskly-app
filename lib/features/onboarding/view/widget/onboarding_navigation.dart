import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

import 'gradient_icon_button.dart';
import 'gradient_icon_text_button.dart';
import 'page_indicators_list.dart';

class OnboardingNavigation extends StatefulWidget {
  const OnboardingNavigation({super.key, required this._pageController});
  final PageController _pageController;

  @override
  State<OnboardingNavigation> createState() => _OnboardingNavigationState();
}

class _OnboardingNavigationState extends State<OnboardingNavigation> {
  @override
  Widget build(BuildContext context) {
    int pageIndex = widget._pageController.page == null
        ? 0
        : widget._pageController.page!.round() + 1;
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
                    setState(() {
                      widget._pageController.nextPage(
                        duration: kAnimationDuration,
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                )
              : GradientIconTextButton(
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
