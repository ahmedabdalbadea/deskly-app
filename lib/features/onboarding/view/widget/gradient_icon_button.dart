import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientIconButton extends StatefulWidget {
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
  State<GradientIconButton> createState() => _GradientIconButtonState();
}

class _GradientIconButtonState extends State<GradientIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: kPressAnimationDuration,
      scale: _pressed ? 0.95 : 1,
      child: AnimatedOpacity(
        duration: kPressAnimationDuration,
        opacity: _pressed ? 0.9 : 1,
        child: InkWell(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            padding: EdgeInsets.all(widget.padding),
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: Icon(widget.icon, color: Colors.white, size: 16),
          ),
        ),
      ),
    );
  }
}
