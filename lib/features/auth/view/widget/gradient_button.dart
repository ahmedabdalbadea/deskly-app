import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.title,
    required this.radius,
    this.onPressed,
    required this.padding,
  });
  final String title;
  final double radius;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      radius: radius,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.primary,
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.bold15(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
