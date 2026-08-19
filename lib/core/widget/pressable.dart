import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.radius,
    this.onPressed,
    required this.child,
    this.splashColor,
    this.highlightColor,
  });
  final double radius;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? splashColor, highlightColor;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
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
          splashColor: widget.splashColor,
          highlightColor: widget.highlightColor,
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(widget.radius),
          child: widget.child,
        ),
      ),
    );
  }
}
