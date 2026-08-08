import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthButton extends StatefulWidget {
  const SocialAuthButton({super.key, required this.image, this.onPressed});
  final String image;
  final VoidCallback? onPressed;

  @override
  State<SocialAuthButton> createState() => _SocialAuthButtonState();
}

class _SocialAuthButtonState extends State<SocialAuthButton> {
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
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 54,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: BoxBorder.all(color: AppColors.border, width: 1),
            ),
            child: SvgPicture.asset(widget.image),
          ),
        ),
      ),
    );
  }
}
