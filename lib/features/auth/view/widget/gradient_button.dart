import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
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
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
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
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            padding: widget.padding,
            child: Center(
              child: Text(
                widget.title,
                style: AppTextStyles.bold15(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
