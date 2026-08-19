import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientCheckBox extends StatelessWidget {
  const GradientCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.validated = true,
  });
  final bool value, validated;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: kAnimationDuration,
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value
                ? Colors.transparent
                : validated
                ? const Color(0xFF000000)
                : AppColors.error,
          ),
          gradient: value ? AppGradients.primary : null,
        ),

        child: value ? Icon(Icons.check, size: 14, color: Colors.white) : null,
      ),
    );
  }
}
