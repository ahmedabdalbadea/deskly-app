import 'package:flutter/material.dart';

import 'gradient_icon_button.dart';
import 'page_indicators_list.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
