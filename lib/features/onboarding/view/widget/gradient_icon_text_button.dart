import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class GradientIconTextButton extends StatefulWidget {
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
  State<GradientIconTextButton> createState() => _GradientIconTextButtonState();
}

class _GradientIconTextButtonState extends State<GradientIconTextButton> {
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
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            padding: widget.padding,
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.bold15(
                    context,
                  ).copyWith(color: Colors.white),
                ),

                const SizedBox(width: 4),
                Icon(widget.icon, color: Colors.white, size: 21),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
