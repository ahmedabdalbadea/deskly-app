import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    super.key,
    required this.icon,
    required this.radius,
    required this.padding,
    required this.onPressed,
  });
  final double radius, padding;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          gradient: AppGradients.primary,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
