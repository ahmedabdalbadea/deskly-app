import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

import 'gradient_icon_button.dart';
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
    return Row(
      children: [
        PageIndicatorsList(
          activePage: widget._pageController.page == null
              ? 0
              : widget._pageController.page!.round() + 1,
        ),
        Spacer(),
        GradientIconButton(
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
        ),
      ],
    );
  }
}
