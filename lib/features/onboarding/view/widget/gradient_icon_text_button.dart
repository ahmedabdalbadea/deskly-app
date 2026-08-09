import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

class GradientIconTextButton extends StatelessWidget {
  const GradientIconTextButton({
    super.key,
    required this.title,
    required this.radius,
    required this.icon,
    this.onPressed,
    required this.padding,
  });
  final String title;
  final double radius;
  final EdgeInsets padding;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      radius: radius,
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.primary,
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.bold15(
                context,
              ).copyWith(color: Colors.white),
            ),

            const SizedBox(width: 4),
            Icon(icon, color: Colors.white, size: 21),
          ],
        ),
      ),
    );
  }
}
