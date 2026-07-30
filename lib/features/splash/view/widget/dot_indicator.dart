import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: !isActive ? const Color(0xffD0D0E8) : null,
        gradient: isActive ? AppGradients.primary : null,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
