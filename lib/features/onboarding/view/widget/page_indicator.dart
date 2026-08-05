import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      width: isActive ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: !isActive ? const Color(0xffE0E0F0) : null,
        gradient: isActive ? AppGradients.primary : null,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
